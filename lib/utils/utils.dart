import 'dart:convert';

// rootBundle possui todo o conteudo importado na renderização do app.
import 'package:flutter/services.dart' show rootBundle;

// Função responsável por converter arquivos locais JSON para um mapa
Future<Map<String, dynamic>> jsonConverter(String file) async {
  return rootBundle.loadString(file).then((jsonStr) => jsonDecode(jsonStr));
}
