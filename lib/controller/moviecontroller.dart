import 'package:movie_info/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:movie_info/model/movie.dart';

class MovieController extends GetxController {
  static var isLoading = true.obs;
  static var movieList = List<MovieElement>();
  static var currentIndex = 0;
  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    isLoading(true);
    try {
      var moviesObj =
          await RemoteServices.fetchMovies('http://165.22.75.82/v1/movies');
      if (moviesObj != null) {
        movieList.addAll(moviesObj.data.movies);
        replaceAllThumbsWithMedium();
      }
    } catch (error) {
      print('$error');
      if (movieList.isEmpty) {
        isLoading(true);
        fetchMovies();
      } // executed for errors of all types other than Exception
    } finally {
      isLoading(false);
    }
  }

  void replaceAllThumbsWithMedium() {
    for (MovieElement mv in movieList) {
      mv.thumbnail = mv.thumbnail.replaceFirst('/thumb/', '/medium/');
    }
  }
}
