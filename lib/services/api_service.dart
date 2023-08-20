import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  final String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  final String popular = "popular";
  final String now = "now-playing";
  final String comming = "coming-soon";

  void getPopularMovies() async {
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> popular = jsonDecode(response.body);
      // print(popular);
      // print(popular['results']);
      for (var result in popular['results']) {
        print(result);
      }
    } else {
      throw Error();
    }
  }
}
