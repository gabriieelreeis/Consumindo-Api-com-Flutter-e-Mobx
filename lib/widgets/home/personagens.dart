import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PleapleWidget extends StatefulWidget {
  @override
  _PleapleWidgetState createState() => _PleapleWidgetState();
}

class _PleapleWidgetState extends State<PleapleWidget> {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _homeController.importaPersonagens();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: _homeController.listPersonagens.length == 0
            ? 0
            : _homeController.listPersonagens.length,
        itemBuilder: (BuildContext context, int index) {
          if (_homeController.listPersonagens != null) {
            return new Card(
              child: new Text(_homeController.listPersonagens[index]["name"]),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyanAccent,
            ),
          );
        },
      );
    });
  }
}
