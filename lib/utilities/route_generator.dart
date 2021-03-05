import 'package:flutter/material.dart';
import 'package:movie_info/screens/movieDetailScreen.dart';
import 'package:movie_info/screens/movieListScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MovieListScreen());
      case '/moviedetail':
        return MaterialPageRoute(builder: (_) => MovieDetailScreen());
      default:
        return MaterialPageRoute(builder: (_) => MovieListScreen());
    }
  }
}
