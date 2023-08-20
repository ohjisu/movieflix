import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> movies = [];
  bool isLoading = true;

  void waitForPopularMovies() async {
    movies = await ApiService.getPopularMovies();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    waitForPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    print("$movies, $isLoading");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        title: const Text("Today's Toons"),
      ),
      body: const Flexible(
        flex: 1,
        child: Row(
          children: [
            Text("dd"),
          ],
        ),
      ),
    );
  }
}
