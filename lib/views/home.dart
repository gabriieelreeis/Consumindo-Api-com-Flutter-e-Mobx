import 'package:app/controllers/main.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import '../components/utils.dart';

class HomeView extends StatelessWidget {
  final _mainController = GetIt.I.get<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      key: _mainController.skaffoldKey,
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
            ],
          ),
        ),
      ),
    );
  }
}
