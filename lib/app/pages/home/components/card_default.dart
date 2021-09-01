import 'package:app/app/models/item_model.dart';
import 'package:app/app/pages/home/controllers/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

class DefaultCardWidget extends StatelessWidget {
  final ItemModel? item;

  const DefaultCardWidget({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController = GetIt.I.get<HomeController>();

    return Observer(
      builder: (_) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: GlobalConfiguration().get('secondColor'),
            border: Border.all(
              color: _homeController.selectedTab == 2
                  ? (item!.tipo == 'filme' ? Colors.green : Colors.red)
                  : Colors.white,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    '${item!.title}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: (item!.favorito == true
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_outline)),
                    color: Colors.red,
                    onPressed: () => (item!.favorito == false
                        ? _homeController.addFavorito(item!)
                        : _homeController.removeFavorito(item!)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
