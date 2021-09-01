import 'package:app/app/pages/perfil/controllers/perfil.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final _perfilController = GetIt.I.get<PerfilController>();

  @override
  void initState() {
    super.initState();

    _perfilController.updateAvatar();
  }

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
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width - 50,
                child: FluttermojiCircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 100,
                ),
              ),
              FluttermojiCustomizer(
                outerTitleText: 'Customizar:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
