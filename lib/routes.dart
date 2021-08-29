import 'package:flutter/material.dart';

import 'package:app/views/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
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
