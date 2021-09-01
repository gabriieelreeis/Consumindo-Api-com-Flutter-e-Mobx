// @dart=2.9
import 'package:app/app/components/app_configs.dart';

import 'app/pages/home/controllers/home.dart';
import 'app/pages/perfil/controllers/perfil.dart';
import 'app/utils/db_helper.dart';
import 'package:app/app/pages/home/home.dart';
import 'package:app/app/pages/perfil/perfil.dart';
import 'package:app/app/pages/splash_screen/splash_screen.dart';
import 'app/pages/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  //permite carregar dados dados assincronos no main()
  WidgetsFlutterBinding.ensureInitialized();

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<PerfilController>(PerfilController());

  GlobalConfiguration().loadFromMap(appConfigs);

  await DatabaseHelper.instance.database;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _homeController.navigatorKey,
      title: 'Star Wars',
      debugShowCheckedModeBanner: false,
      initialRoute: '/Splash',
      routes: {
        '/Splash': (context) => SplashScreen(),
        '/Home': (context) => HomeView(),
        '/Perfil': (context) => PerfilView(),
        '/Site': (context) =>
            WebViewPage('Site Oficial', 'https://www.starwars.com/community'),
      },
    );
  }
}
