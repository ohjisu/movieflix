class Genre {
  int id;
  String name;
  Genre({
    required this.id,
    required this.name,
  });
}

class MovieDetailModel {
  List<Genre> genres = [];
  int runtime = 0;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : runtime = json['runtime'];
}
