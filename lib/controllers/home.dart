import 'package:app/utils/personagens.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final navigatorKey = GlobalKey<NavigatorState>();

  @observable
  int selectedTab = 0;

  @observable
  GlobalKey<ScaffoldState> skaffoldKey = new GlobalKey<ScaffoldState>();

  @action
  changeTab(int i) {
    selectedTab = i;
  }

  final Personagens personagens = Personagens();

  @observable
  List<dynamic> listPersonagens = [];
  @action
  Future importaPersonagens() async {
    listPersonagens = await personagens.importarPersonagens();
  }
}
