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
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
