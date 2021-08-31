import 'package:mobx/mobx.dart';
part 'splash_screen.g.dart';

class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  @observable
  bool allLoaded = false;

  @action
  loaded() {
    allLoaded = true;
  }
}
