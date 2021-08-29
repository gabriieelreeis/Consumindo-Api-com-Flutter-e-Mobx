import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final navigatorKey = GlobalKey<NavigatorState>();

  @observable
  bool allLoaded = false;

  @observable
  GlobalKey<ScaffoldState> skaffoldKey = new GlobalKey<ScaffoldState>();
}
