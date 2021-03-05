import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/controller/moviecontroller.dart';

class MovieDetailScreen extends StatefulWidget {
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  int index = MovieController.currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Movie Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aller',
                  fontSize: 30,
                  color: Colors.white))),
      backgroundColor: Colors.white,
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Hero(
                      tag: 'movieImage_${MovieController.currentIndex}',
                      child: CachedNetworkImage(
                        fit: BoxFit.fitWidth,
                        // height: 400,
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.4,
                        imageUrl: MovieController
                            .movieList[MovieController.currentIndex].thumbnail,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: RefreshProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                TextData(
                    MovieController
                            .movieList[MovieController.currentIndex].name +
                        '(' +
                        MovieController
                            .movieList[MovieController.currentIndex].year +
                        ')',
                    35),
                if (MovieController
                        .movieList[MovieController.currentIndex].genres.length >
                    0)
                  TextData(getGenres(), 15),
                SizedBox(height: 10),
                if (MovieController.movieList[MovieController.currentIndex]
                        .director.length >
                    0)
                  TextData(
                      'Directed By: ${MovieController.movieList[MovieController.currentIndex].director}',
                      20),
                SizedBox(height: 10),
                if (MovieController.movieList[MovieController.currentIndex]
                        .mainStar.length >
                    0)
                  TextData(
                      'Main Star: ${MovieController.movieList[MovieController.currentIndex].mainStar}',
                      20),
                SizedBox(height: 10),
                if (MovieController.movieList[MovieController.currentIndex]
                        .description.length >
                    0)
                  TextData(
                      'About: ${MovieController.movieList[MovieController.currentIndex].description}',
                      20),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  String getGenres() {
    String allGenres = '';
    for (String g in MovieController.movieList[MovieController.currentIndex]
        .genres) allGenres = allGenres + '\n' + g;
    return allGenres;
  }
}

class TextData extends StatelessWidget {
  String data;
  double size;
  TextData(this.data, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(data,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Aller',
            fontSize: size,
            color: Colors.black));
  }
}
