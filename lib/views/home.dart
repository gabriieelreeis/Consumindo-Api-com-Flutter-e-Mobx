import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class HomeView extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfiguration().get('secondColor'),
        title: const Text('Home'),
        actions: [
          Container(
            width: 58,
            child: PopupMenuButton(
              icon: FluttermojiCircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 100,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: '1',
                    child: Text('1'),
                  ),
                ];
              },
            ),
          )
        ],
      ),
      key: _homeController.skaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: GlobalConfiguration().get('secondColor'),
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
              FluttermojiCustomizer(
                scaffoldHeight: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
