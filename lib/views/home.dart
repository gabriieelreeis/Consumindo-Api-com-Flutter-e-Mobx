import 'package:app/controllers/home.dart';
import 'package:app/widgets/home/favoritos.dart';
import 'package:app/widgets/home/filmes.dart';
import 'package:app/widgets/home/personagens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class HomeView extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalConfiguration().get('secondColor'),
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
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Text('Personagens')),
              Tab(icon: Text('Filmes')),
              Tab(icon: Text('Favoritos'))
            ],
          ),
        ),
        key: _homeController.skaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            color: GlobalConfiguration().get('secondColor'),
          ),
          child: Observer(builder: (_) {
            return Center(
              child: TabBarView(
                children: [
                  new PleapleWidget(),
                  new FilmsWidget(),
                  new FavoritesWidget()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
