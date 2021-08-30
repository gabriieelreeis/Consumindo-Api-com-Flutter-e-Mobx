import 'package:flutter/material.dart';

class FavoritesWidget extends StatelessWidget {
  String title = 'Favoritos';

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
