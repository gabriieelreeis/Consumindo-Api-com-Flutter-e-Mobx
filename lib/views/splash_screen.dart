import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class SplashScreen extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/Home');
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color:
              Color(int.parse(GlobalConfiguration().getString('secondColor'))),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 40,
              ),
              CircularProgressIndicator(
                backgroundColor: Color(
                    int.parse(GlobalConfiguration().getString('primaryColor'))),
                valueColor: AlwaysStoppedAnimation<Color>(Color(
                    int.parse(GlobalConfiguration().getString('secondColor')))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
