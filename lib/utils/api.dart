import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiUtil {
  Future<List<dynamic>> importarPersonagens() async {
    List<dynamic> listPersonagens = [];

    for (int i = 1; i <= 1000; i++) {
      final response = await http
          .get(Uri.parse('https://swapi.dev/api/people/?page=' + i.toString()));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        listPersonagens.add(result['results']);
        if (result['next'] == null) {
          break;
        }
      } else {
        throw Exception('Erro ao carregar personagens');
      }
    }

    return listPersonagens;
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
