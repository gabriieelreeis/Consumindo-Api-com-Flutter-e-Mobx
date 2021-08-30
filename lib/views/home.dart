import 'package:app/controllers/home.dart';
import 'package:app/widgets/home/favoritos.dart';
import 'package:app/widgets/home/filmes.dart';
import 'package:app/widgets/home/personagens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final _homeController = GetIt.I.get<HomeController>();
  final List _tabs = [
    new Tabs(title: "Personagens"),
    new Tabs(title: "Filmes"),
    new Tabs(title: "Favoritor")
  ];

  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_controller.index].title),
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
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Text(_tabs[0].title)),
            Tab(icon: Text(_tabs[1].title)),
            Tab(icon: Text(_tabs[2].title))
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
    );
  }
}

class Tabs {
  final String title;
  Tabs({required this.title});
}
