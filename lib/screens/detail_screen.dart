import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';

class DetailScreen extends StatelessWidget {
  final String path, title, overview;
  final int id;

  DetailScreen({
    super.key,
    required this.path,
    required this.id,
    required this.title,
    required this.overview,
  });

  late final Future<MovieDetailModel> detailInfo = ApiService.getDetails(id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        title: const Text("Back to list"),
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Hero(
              tag: id,
              child: Container(
                child: Image.network(
                  "https://image.tmdb.org/t/p/w400$path",
                  height: 250,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Text("별점"),
                    FutureBuilder(
                      future: detailInfo,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                              "${(snapshot.data!.runtime / 60).floor()}h ${snapshot.data!.runtime % 60}min");
                        }
                        print(snapshot);
                        return Text("상영시간 | 장르");
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Storyline",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      overview,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xfff8d84a),
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                foregroundColor: Colors.black,
              ),
              child: const Text(
                "Buy ticket",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
