import 'package:flutter/material.dart';

class ListaPersonagensWidget extends StatelessWidget {
  ListaPersonagensWidget(this.list);
  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length == 0 ? 0 : list.length,
      itemBuilder: (BuildContext context, int index) {
        if (list != null) {
          return new Card(
            child: new Text(list[index]["name"]),
          );
        }
        return Container();
      },
    );
  }
}
