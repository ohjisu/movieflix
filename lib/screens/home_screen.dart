import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> movies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        title: const Text("Today's Toons"),
      ),
      */
      body: Row(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: movies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        "Popular Movies",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Expanded(
                        child: makeList(snapshot),
                      ),
                      Text(
                        "Now in Cinemas",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        // return Text(movie.title);
        return Movie(
          path: movie.poster_path,
          id: movie.id,
          title: movie.title,
          overview: movie.overview,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }
}
