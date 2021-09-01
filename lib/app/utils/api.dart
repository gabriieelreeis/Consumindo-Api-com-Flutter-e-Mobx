import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiUtil {
  Future<Map<String, dynamic>> importarPersonagens(String url) async {
    late Map<String, dynamic> _listPersonagens;

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      _listPersonagens = result;
    } else {
      throw Exception('Erro ao carregar personagens');
    }

    return _listPersonagens;
  }

  Future<Map<String, dynamic>> importarFilmes() async {
    late Map<String, dynamic> _listFilmes;

    final response = await http.get(Uri.parse('https://swapi.dev/api/films/'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      _listFilmes = result;
    } else {
      throw Exception('Erro ao carregar personagens');
    }

    return _listFilmes;
  }
}
