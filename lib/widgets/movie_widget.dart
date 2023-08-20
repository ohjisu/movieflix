import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String path, title, overview;
  final int id;

  const Movie({
    super.key,
    required this.path,
    required this.id,
    required this.title,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('take me homeee');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              path: path,
              id: id,
              title: title,
              overview: overview,
            ),
            fullscreenDialog: false,
          ),
        );
      },
      child: Container(
        width: 400,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Image.network(
          "https://image.tmdb.org/t/p/w400$path",
          height: 250,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
