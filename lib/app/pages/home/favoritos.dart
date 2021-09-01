import 'package:app/app/pages/home/components/card_default.dart';
import 'package:app/app/pages/home/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FavoritesWidget extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();
  String title = 'Favoritos';

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
                itemCount: _homeController.listFavoritos.length == 0
                    ? 0
                    : _homeController.listFavoritos.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_homeController.listFavoritos.length > 0) {
                    return DefaultCardWidget(
                        item: _homeController.listFavoritos[index]);
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
