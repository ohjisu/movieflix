import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieflix/screens/home_screen.dart';
import 'package:movieflix/services/api_service.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  // Flutter는 위젯을 식별하기 위서 key를 사용함
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Colors.white,
          ),
          displayLarge: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15,
            color: Colors.white,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontFeatures: [FontFeature.tabularFigures()],
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
