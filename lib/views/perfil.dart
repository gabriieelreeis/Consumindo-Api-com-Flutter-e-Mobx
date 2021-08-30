import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class PerfilView extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: GlobalConfiguration().get('secondColor'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(context),
            child: Container(
              width: 58,
              child: FluttermojiCircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 100,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: GlobalConfiguration().get('secondColor'),
        ),
        child: Center(
          child: Text('ói'),
        ),
      ),
    );
  }
}
