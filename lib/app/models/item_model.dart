import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase(this.title, this.favorito, this.tipo);

  @observable
  String? title;

  @observable
  bool? favorito;

  @observable
  String? tipo;

  @action
  setTitle(String val) => title = val;
  @action
  Future<bool> setFavorito(bool val) async => favorito = val;
  @action
  setTipo(String val) => tipo = val;
}
