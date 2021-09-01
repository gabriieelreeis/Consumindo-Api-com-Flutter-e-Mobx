import 'package:app/app/pages/home/components/card_default.dart';
import 'package:app/app/pages/home/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

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
                  if (_homeController.listPersonagens.isNotEmpty) {
                    return DefaultCardWidget(
                        item: _homeController.listPersonagens[index]);
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.cyanAccent,
                    ),
                  );
                },
              ),
              if (_homeController.apiLoading)
                CircularProgressIndicator(
                  color: GlobalConfiguration().get('primaryColor'),
                ),
              if (_homeController.pagePersonagens != null &&
                  !_homeController.apiLoading)
                GestureDetector(
                  onTap: _homeController.importaPersonagens,
                  child: Container(
                    decoration: BoxDecoration(
                        color: GlobalConfiguration().get('primaryColor'),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        'Ver Mais',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
