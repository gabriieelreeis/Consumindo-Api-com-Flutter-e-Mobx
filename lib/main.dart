// @dart=2.9
import 'package:app/controllers/home.dart';
import 'package:app/controllers/splash_screen.dart';
import 'package:app/views/home.dart';
import 'package:app/views/perfil.dart';
import 'package:app/views/splash_screen.dart';
import 'package:app/views/webview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import 'components/app_configs.dart';

void main() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<SplashScreenController>(SplashScreenController());

  GlobalConfiguration().loadFromMap(appConfigs);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _homeController.navigatorKey,
      title: 'Star Wars',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/Splash',
      routes: {
        '/Splash': (context) => SplashScreen(),
        '/Home': (context) => HomeView(),
        '/Perfil': (context) => PerfilView(),
        '/WebView': (context) => WebViewPage()
      },
    );
  }
}
