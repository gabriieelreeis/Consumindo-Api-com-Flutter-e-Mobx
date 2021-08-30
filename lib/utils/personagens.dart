import 'dart:convert';
import 'package:http/http.dart' as http;

class Personagens {
  Future<List<dynamic>> importarPersonagens() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people/'));

    if (response.statusCode == 200) {
      final listPersonagens = jsonDecode(response.body);
      return listPersonagens['results'];
    } else {
      throw Exception('Erro ao carregar personagens');
    }
  }
}
