import 'package:flutter/material.dart';
import './screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String title = 'The Movie DB';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primaryContainer: const Color(0xFF10C6E7),
          seedColor: const Color(0xFF10C6E7),
        ),
        fontFamily: 'MadeTommy',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: title),
    );
  }
}
