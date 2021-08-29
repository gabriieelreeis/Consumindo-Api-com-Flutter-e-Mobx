import 'package:flutter/material.dart';

import 'package:app/views/splash_screen.dart';
import 'package:app/views/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Home':
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: SafeArea(
              child: Text('Nenhuma rota informada'),
            ),
          ),
        );
    }
  }
}
