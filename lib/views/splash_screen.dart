import 'package:app/controllers/home.dart';
import 'package:app/controllers/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _homeController = GetIt.I.get<HomeController>();
  final _conSplash = GetIt.I.get<SplashScreenController>();

  @override
  void initState() {
    super.initState();

    _homeController.importaFilmes();
    _homeController.importaPersonagens();
  }

  @override
  Widget build(BuildContext context) {
    if (_conSplash.allLoaded) {
      Navigator.of(context).pushReplacementNamed('/Home');
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: GlobalConfiguration().get('splashBg'),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/bb-8.gif',
                width: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
