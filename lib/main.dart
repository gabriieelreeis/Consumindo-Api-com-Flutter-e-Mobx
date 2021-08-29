// @dart=2.9
import 'package:app/controllers/main.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

import 'components/route_generator.dart';
import 'components/app_configs.dart';

void main() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<MainController>(MainController());

  GlobalConfiguration().loadFromMap(appConfigs);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
