import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String now = "now-playing";
  static const String comming = "coming-soon";
  static const String detail = "movie?id=";

  static Future<MovieDetailModel> getDetails(int id) async {
    var url = Uri.parse('$baseUrl/$detail$id');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> res = jsonDecode(response.body);
      var detail = MovieDetailModel.fromJson(res);
      return detail;
    } else {
      throw Error();
    }
  }

  static Future<List<MovieModel>> getMovies(String type) async {
    List<MovieModel> movieInstances = [];
    var url = Uri();
    if (type == "popular") {
      url = Uri.parse('$baseUrl/$popular');
    } else if (type == "now") {
      url = Uri.parse('$baseUrl/$now');
    } else if (type == "soon") {
      url = Uri.parse('$baseUrl/$comming');
    }

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> popular = jsonDecode(response.body);
      for (var result in popular['results']) {
        movieInstances.add(MovieModel.fromJson(result));
      }
      return movieInstances;
    } else {
      throw Error();
    }
  }
}
