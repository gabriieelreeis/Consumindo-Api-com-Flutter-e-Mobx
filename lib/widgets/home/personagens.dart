import 'package:app/controllers/home.dart';
import 'package:app/widgets/home/personagens_lista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PleapleWidget extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _homeController.listPersonagens.length == 0
                    ? 0
                    : _homeController.listPersonagens.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_homeController.listPersonagens != null) {
                    return ListaPersonagensWidget(
                        _homeController.listPersonagens[index]);
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.cyanAccent,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
