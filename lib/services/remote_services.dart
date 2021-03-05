import 'dart:convert';
import 'dart:io';
import 'package:movie_info/model/movie.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<Movie> fetchMovies(var currentUrl) async {
    var response = await client.get(currentUrl);
    if (response.statusCode == 200) //success
    {
      var jsonString = response.body;
      return movieFromJson(jsonString);
    } else {
      print('Failed to get data from server.');
      return null;
    }
  }
}
