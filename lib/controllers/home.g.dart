// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$selectedTabAtom = Atom(name: '_HomeControllerBase.selectedTab');

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  final _$skaffoldKeyAtom = Atom(name: '_HomeControllerBase.skaffoldKey');

  @override
  GlobalKey<ScaffoldState> get skaffoldKey {
    _$skaffoldKeyAtom.reportRead();
    return super.skaffoldKey;
  }

  @override
  set skaffoldKey(GlobalKey<ScaffoldState> value) {
    _$skaffoldKeyAtom.reportWrite(value, super.skaffoldKey, () {
      super.skaffoldKey = value;
    });
  }

  final _$listPersonagensAtom =
      Atom(name: '_HomeControllerBase.listPersonagens');

  @override
  List<dynamic> get listPersonagens {
    _$listPersonagensAtom.reportRead();
    return super.listPersonagens;
  }

  @override
  set listPersonagens(List<dynamic> value) {
    _$listPersonagensAtom.reportWrite(value, super.listPersonagens, () {
      super.listPersonagens = value;
    });
  }

  final _$importaPersonagensAsyncAction =
      AsyncAction('_HomeControllerBase.importaPersonagens');

  @override
  Future<dynamic> importaPersonagens() {
    return _$importaPersonagensAsyncAction
        .run(() => super.importaPersonagens());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeTab(int i) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeTab');
    try {
      return super.changeTab(i);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTab: ${selectedTab},
skaffoldKey: ${skaffoldKey},
listPersonagens: ${listPersonagens}
    ''';
  }
}
