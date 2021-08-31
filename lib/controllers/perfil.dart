import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'perfil.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  @action
  updateAvatar() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString('fluttermoji'));
  }
}
