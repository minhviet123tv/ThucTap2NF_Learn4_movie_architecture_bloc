import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/repositories.dart';
import 'movie_list_page.dart';

class MyMovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SafeArea(
        child: RepositoryProvider(
          create: (context) => ListMovieRepository(),
          child: MovieHomePage(),
        ),
      ),
    );
  }
}
