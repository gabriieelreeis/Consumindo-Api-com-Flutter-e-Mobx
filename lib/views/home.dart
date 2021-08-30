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
    new Tabs(title: "Favoritos")
  ];

  // Informo que o _controller nao é nullo
  // e só sera iniciado após declarado um valor
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: 3, vsync: this);
    _controller.addListener(_changeTab);
  }

  _changeTab() {
    _homeController.changeTab(_controller.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/WebView'),
                child: Container(
                  decoration: BoxDecoration(
                      color: GlobalConfiguration().get('primaryColor'),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Site Oficial',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _tabs[_homeController.selectedTab].title,
                  ),
                ),
              ),
            ],
          );
        }),
        backgroundColor: GlobalConfiguration().get('secondColor'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/Perfil'),
            child: Container(
              width: 58,
              child: FluttermojiCircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 100,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          indicatorColor: GlobalConfiguration().get('primaryColor'),
          labelColor: GlobalConfiguration().get('primaryColor'),
          unselectedLabelColor: Colors.white,
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
        child: Center(
          child: TabBarView(
            controller: _controller,
            children: [
              new PleapleWidget(),
              new FilmsWidget(),
              new FavoritesWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class Tabs {
  final String title;
  Tabs({required this.title});
}
