import 'package:app/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class HomeView extends StatelessWidget {
  final _homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color(int.parse(GlobalConfiguration().getString('secondColor'))),
        title: const Text('Home'),
        actions: [
          Container(
            width: 58,
            child: PopupMenuButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s2.glbimg.com/Vp3G23xF7uR9AoK3Z8uCz9QMi1c=/e.glbimg.com/og/ed/f/original/2019/12/10/yoda-advice-featured-1.jpg"),
                backgroundColor: Color(
                    int.parse(GlobalConfiguration().getString('primaryColor'))),
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
          color:
              Color(int.parse(GlobalConfiguration().getString('secondColor'))),
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
            ],
          ),
        ),
      ),
    );
  }
}
