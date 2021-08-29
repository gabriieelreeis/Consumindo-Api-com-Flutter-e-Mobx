// @dart=2.9
import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

import 'routes.dart';
import 'configs/app_configs.dart';

void main() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HomeController>(HomeController());

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
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
