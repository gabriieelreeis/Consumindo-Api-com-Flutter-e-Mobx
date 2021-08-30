import 'package:flutter/material.dart';

class PleapleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/logo.png',
          width: 10,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
