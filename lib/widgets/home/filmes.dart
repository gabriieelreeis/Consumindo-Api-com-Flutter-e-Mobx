import 'package:app/controllers/home.dart';
import 'package:app/widgets/home/card_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FilmsWidget extends StatelessWidget {
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
                itemCount: _homeController.listFilmes.length == 0
                    ? 0
                    : _homeController.listFilmes.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_homeController.listFilmes.length > 0) {
                    return DefaultCardWidget(
                        _homeController.listFilmes[index]["title"]);
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
