import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String now = "now-playing";
  static const String comming = "coming-soon";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> popular = jsonDecode(response.body);
      // print(popular);
      // print(popular['results']);
      for (var result in popular['results']) {
        movieInstances.add(MovieModel.fromJson(result));
      }
      return movieInstances;
    } else {
      throw Error();
    }
  }
}
