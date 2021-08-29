import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'main.g.dart';

class MainController = _MainControllerBase with _$MainController;

abstract class _MainControllerBase with Store {
  @observable
  bool allLoaded = false;

  @observable
  GlobalKey<ScaffoldState> skaffoldKey = new GlobalKey<ScaffoldState>();
}
