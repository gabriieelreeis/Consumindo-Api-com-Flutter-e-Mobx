import 'package:app/utils/db_helper.dart';
import 'package:path/path.dart';
import 'package:app/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'home.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final navigatorKey = GlobalKey<NavigatorState>();
  late String nextUrl;

  @observable
  bool allLoaded = false;

  @observable
  int selectedTab = 0;

  @observable
  GlobalKey<ScaffoldState> skaffoldKey = new GlobalKey<ScaffoldState>();

  @action
  changeTab(int i) {
    selectedTab = i;
  }

  final ApiUtil api = ApiUtil();

  @observable
  List<dynamic> listPersonagens = [];
  @observable
  String pagePersonagens = 'https://swapi.dev/api/people/?page=1';
  @observable
  bool apiLoading = false;

  @action
  Future importaPersonagens() async {
    apiLoading = true;
    Map<String, dynamic> _result =
        await api.importarPersonagens(pagePersonagens);
    pagePersonagens = _result['next'];
    listPersonagens.add(_result['results']);
    apiLoading = false;
    allLoaded = true;
  }

  @observable
  List<dynamic> listFilmes = [];
  @action
  importaFilmes() async {
    final List<dynamic> filmes = await api.importarFilmes();
    listFilmes = filmes.reversed.toList();
  }

  @observable
  Future<Database> database = DatabaseHelper.instance.database;

  @action
  addFavorito(String nome) async {
    final Database db = await database;
    try {
      await db.insert('favoritos', {'name': nome});

      int? count = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM favoritos'));
      print(count.toString());
      print(nome + ' foi adicionado aos Favoritos');
    } catch (error) {
      print(error);
    }
  }
}
