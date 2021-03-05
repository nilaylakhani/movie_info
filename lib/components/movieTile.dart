import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/controller/moviecontroller.dart';
import 'package:movie_info/model/movie.dart' as MovieClass;

class MovieTile extends StatelessWidget {
  final MovieClass.MovieElement movie;
  final int movieIndex;
  const MovieTile(this.movie, this.movieIndex);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MovieController.currentIndex = movieIndex;
        Navigator.of(context).pushNamed('/moviedetail');
      },
      child: Container(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
              // child: Image.network(
              //   product.images.first.src,
              //   fit: BoxFit.fitWidth,
              //   height: 200,
              //   width: 200,
              // ),

              child: Hero(
                tag: 'movieImage_${this.movieIndex}',
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  height: 200,
                  width: 200,
                  imageUrl: movie.thumbnail,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: RefreshProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text('${movie.name} (${movie.year})',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Aller', fontSize: 20, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
