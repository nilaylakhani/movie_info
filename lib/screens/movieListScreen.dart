import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_info/components/movieTile.dart';
import 'package:movie_info/controller/moviecontroller.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Aller',
                fontSize: 30,
                color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Obx(() {
          if (MovieController.isLoading.value)
            return Center(child: RefreshProgressIndicator());
          else
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: MovieController.movieList.length,
              itemBuilder: (context, index) {
                return MovieTile(MovieController.movieList[index], index);
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            );
        }),
      ),
    );
  }
}
