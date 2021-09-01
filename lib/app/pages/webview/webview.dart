import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage(this.title, this.url);

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: url,
          ),
        ],
      ),
    );
  }
}
