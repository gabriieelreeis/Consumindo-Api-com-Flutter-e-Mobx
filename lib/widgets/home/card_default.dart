import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

class DefaultCardWidget extends StatelessWidget {
  DefaultCardWidget(this.nome);

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: GlobalConfiguration().get('secondColor'),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                nome,
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
              icon: const Icon(Icons.favorite_outline),
              color: Colors.red,
              onPressed: () => {},
            )),
          ],
        ),
      ),
    );
  }
}
