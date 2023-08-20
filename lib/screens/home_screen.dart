import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> movies = ApiService.getMovies("popular");
  final Future<List<MovieModel>> nowList = ApiService.getMovies("now");
  final Future<List<MovieModel>> soonList = ApiService.getMovies("soon");

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
                child: FutureBuilder(
                  future: movies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Text(
                            "Popular Movies",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(height: 30),
                          Expanded(
                            child: makeList(
                              snapshot,
                              400,
                              false,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: Text("Loading.."),
                      // child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 280,
                child: FutureBuilder(
                  future: nowList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Now in Cinemas",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: makeList(
                              snapshot,
                              200,
                              true,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: Text("Loading.."),
                      // child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 280,
                child: FutureBuilder(
                  future: soonList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Comming soon",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: makeList(
                              snapshot,
                              200,
                              true,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: Text("Loading.."),
                      // child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot, double imgWidth,
      bool showTitle) {
    return ListView.separated(
      // padding: const EdgeInsets.symmetric(
      //   vertical: 10,
      //   horizontal: 20,
      // ),
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
            imgWidth: imgWidth,
            showTitle: showTitle);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }
}
