import 'package:app/app/models/item_model.dart';
import 'package:app/app/utils/api.dart';
import 'package:app/app/utils/db_helper.dart';
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
  List<ItemModel> listPersonagens = [];
  @observable
  String pagePersonagens = 'https://swapi.dev/api/people/?page=1';
  @observable
  bool apiLoading = false;

  @action
  Future importaPersonagens() async {
    Database db = await database;
    apiLoading = true;
    Map<String, dynamic> _result =
        await api.importarPersonagens(pagePersonagens);
    pagePersonagens = _result['next'];

    for (int i = 0; i <= (_result['results'].length - 1); i++) {
      bool _check =
          await checkFavorito(_result['results'][i]['name'], 'personagem');
      listPersonagens
          .add(ItemModel(_result['results'][i]['name'], _check, 'personagem'));
    }
    apiLoading = false;
    allLoaded = true;
  }

  @observable
  List<ItemModel> listFilmes = [];
  @action
  importaFilmes() async {
    final Map<String, dynamic> _filmes = await api.importarFilmes();
    for (int i = 0; i <= (_filmes['results'].length - 1); i++) {
      bool _check =
          await checkFavorito(_filmes['results'][i]['title'], 'filme');
      listFilmes
          .add(ItemModel(_filmes['results'][i]['title'], _check, 'filme'));
    }
  }

  @observable
  List<ItemModel> listFavoritos = [];

  final Future<Database> database = DatabaseHelper.instance.database;

  @action
  addFavorito(ItemModel item) async {
    Database db = await database;
    try {
      int? _count = Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM favoritos WHERE name = ? LIMIT 1',
          [item.title]));
      if (_count! == 0) {
        await item.setFavorito(true);

        await db.insert('favoritos', {'name': item.title});
        listFavoritos.add(ItemModel(item.title, item.favorito, item.tipo));
      }
    } catch (error) {
      print(error);
    }
  }

  @action
  removeFavorito(ItemModel item) async {
    Database db = await database;
    try {
      int? _count = Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM favoritos WHERE name = ? LIMIT 1',
          [item.title]));
      if (_count! > 0) {
        await db
            .delete('favoritos', where: 'name = ?', whereArgs: [item.title]);
        listPersonagens[listPersonagens
                .indexWhere((element) => element.title == item.title)] =
            ItemModel(item.title, false, 'personagem');

        listFilmes[listFilmes
                .indexWhere((element) => element.title == item.title)] =
            ItemModel(item.title, false, 'personagem');
      }
    } catch (error) {
      print(error);
    }

    await item.setFavorito(false);
    listFavoritos.removeWhere((_fav) => _fav.title == item.title);
  }

  @action
  limpaFavoritos() async {
    Database db = await database;

    try {
      await db.delete('favoritos', where: '1=1');
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<bool> checkFavorito(String nome, String tipo) async {
    Database db = await database;
    try {
      int? count = Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM favoritos WHERE name = ? LIMIT 1', [nome]));
      if (count! > 0) {
        listFavoritos.add(ItemModel(nome, true, tipo));
        return true;
      }
    } catch (error) {
      print(error);
    }

    return false;
  }
}
