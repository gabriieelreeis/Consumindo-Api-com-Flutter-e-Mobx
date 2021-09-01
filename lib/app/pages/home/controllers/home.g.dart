// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$allLoadedAtom = Atom(name: '_HomeControllerBase.allLoaded');

  @override
  bool get allLoaded {
    _$allLoadedAtom.reportRead();
    return super.allLoaded;
  }

  @override
  set allLoaded(bool value) {
    _$allLoadedAtom.reportWrite(value, super.allLoaded, () {
      super.allLoaded = value;
    });
  }

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
  List<ItemModel> get listPersonagens {
    _$listPersonagensAtom.reportRead();
    return super.listPersonagens;
  }

  @override
  set listPersonagens(List<ItemModel> value) {
    _$listPersonagensAtom.reportWrite(value, super.listPersonagens, () {
      super.listPersonagens = value;
    });
  }

  final _$pagePersonagensAtom =
      Atom(name: '_HomeControllerBase.pagePersonagens');

  @override
  String get pagePersonagens {
    _$pagePersonagensAtom.reportRead();
    return super.pagePersonagens;
  }

  @override
  set pagePersonagens(String value) {
    _$pagePersonagensAtom.reportWrite(value, super.pagePersonagens, () {
      super.pagePersonagens = value;
    });
  }

  final _$apiLoadingAtom = Atom(name: '_HomeControllerBase.apiLoading');

  @override
  bool get apiLoading {
    _$apiLoadingAtom.reportRead();
    return super.apiLoading;
  }

  @override
  set apiLoading(bool value) {
    _$apiLoadingAtom.reportWrite(value, super.apiLoading, () {
      super.apiLoading = value;
    });
  }

  final _$listFilmesAtom = Atom(name: '_HomeControllerBase.listFilmes');

  @override
  List<ItemModel> get listFilmes {
    _$listFilmesAtom.reportRead();
    return super.listFilmes;
  }

  @override
  set listFilmes(List<ItemModel> value) {
    _$listFilmesAtom.reportWrite(value, super.listFilmes, () {
      super.listFilmes = value;
    });
  }

  final _$listFavoritosAtom = Atom(name: '_HomeControllerBase.listFavoritos');

  @override
  List<ItemModel> get listFavoritos {
    _$listFavoritosAtom.reportRead();
    return super.listFavoritos;
  }

  @override
  set listFavoritos(List<ItemModel> value) {
    _$listFavoritosAtom.reportWrite(value, super.listFavoritos, () {
      super.listFavoritos = value;
    });
  }

  final _$importaPersonagensAsyncAction =
      AsyncAction('_HomeControllerBase.importaPersonagens');

  @override
  Future<dynamic> importaPersonagens() {
    return _$importaPersonagensAsyncAction
        .run(() => super.importaPersonagens());
  }

  final _$importaFilmesAsyncAction =
      AsyncAction('_HomeControllerBase.importaFilmes');

  @override
  Future importaFilmes() {
    return _$importaFilmesAsyncAction.run(() => super.importaFilmes());
  }

  final _$addFavoritoAsyncAction =
      AsyncAction('_HomeControllerBase.addFavorito');

  @override
  Future addFavorito(ItemModel item) {
    return _$addFavoritoAsyncAction.run(() => super.addFavorito(item));
  }

  final _$removeFavoritoAsyncAction =
      AsyncAction('_HomeControllerBase.removeFavorito');

  @override
  Future removeFavorito(ItemModel item) {
    return _$removeFavoritoAsyncAction.run(() => super.removeFavorito(item));
  }

  final _$limpaFavoritosAsyncAction =
      AsyncAction('_HomeControllerBase.limpaFavoritos');

  @override
  Future limpaFavoritos() {
    return _$limpaFavoritosAsyncAction.run(() => super.limpaFavoritos());
  }

  final _$checkFavoritoAsyncAction =
      AsyncAction('_HomeControllerBase.checkFavorito');

  @override
  Future<bool> checkFavorito(String nome, String tipo) {
    return _$checkFavoritoAsyncAction
        .run(() => super.checkFavorito(nome, tipo));
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
allLoaded: ${allLoaded},
selectedTab: ${selectedTab},
skaffoldKey: ${skaffoldKey},
listPersonagens: ${listPersonagens},
pagePersonagens: ${pagePersonagens},
apiLoading: ${apiLoading},
listFilmes: ${listFilmes},
listFavoritos: ${listFavoritos}
    ''';
  }
}
