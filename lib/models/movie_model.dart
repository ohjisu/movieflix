class Popular {
  int page;
  List<MovieModel> results;
  int total_page;
  int total_results;

  Popular({
    required this.page,
    required this.results,
    required this.total_page,
    required this.total_results,
  });
}

class MovieModel {
  bool adult = false, video = false;
  String backdrop_path = "", original_language = "";
  String original_title = "", overview = "";
  String poster_path, release_date = "";
  String title = "";
  double popularity = 0, vote_average = 0;
  List<int> genre_ids = [];
  int id, vote_count = 0;

  MovieModel({
    required this.title,
    required this.poster_path,
    required this.id,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        poster_path = json['poster_path'],
        id = json['id'];
}
