import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './../../components/movie_list/movie_list.dart';
import './../../models/movie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': ''
    };

    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/discover/movie'),
        headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];

      setState(() {
        movies = results.map((movie) => Movie.fromJson(movie)).toList();
        isLoading = false;
      });
    } else {
      movies = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      //   title: Text(
      //     widget.title,
      //     style: TextStyle(
      //         fontFamily: 'MadeTommy', // Use the custom font
      //         fontWeight: FontWeight.w900, // Use the appropriate font weight
      //         color: Theme.of(context).colorScheme.onPrimary),
      //   ),
      // ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : MovieList(movies: movies), // Use the MovieList widget
    );
  }
}
