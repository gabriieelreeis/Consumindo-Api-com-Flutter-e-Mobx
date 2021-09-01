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

  Future<List<dynamic>> importarFilmes() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/films/'));

    if (response.statusCode == 200) {
      final listFilmes = jsonDecode(response.body);
      return listFilmes['results'];
    } else {
      throw Exception('Erro ao carregar personagens');
    }
  }
}
