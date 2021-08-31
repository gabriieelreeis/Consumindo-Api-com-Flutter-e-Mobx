import 'package:app/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final navigatorKey = GlobalKey<NavigatorState>();

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
  @action
  Future importaPersonagens() async {
    listPersonagens = await api.importarPersonagens();
    allLoaded = true;
  }

  @observable
  List<dynamic> listFilmes = [];
  @action
  Future importaFilmes() async {
    final List<dynamic> filmes = await api.importarFilmes();
    listFilmes = filmes.reversed.toList();
  }
}
