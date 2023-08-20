import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String path, title, overview;
  final int id;
  final double imgWidth;
  final bool showTitle;

  const Movie({
    super.key,
    required this.path,
    required this.id,
    required this.title,
    required this.overview,
    required this.imgWidth,
    required this.showTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: id,
              child: Container(
                width: imgWidth,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w400$path",
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          if (showTitle)
            SizedBox(
              width: imgWidth,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
        ],
      ),
    );
  }
}
