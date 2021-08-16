import 'package:exam_provider/src/model/movie.dart';
import 'package:exam_provider/src/services/api_services.dart';
import 'package:flutter/widgets.dart';

enum MovieState {
  Initail,
  Loading,
  Loaded,
  Error,
}

class MovieModel extends ChangeNotifier {
  MovieState _movieState = MovieState.Initail;

  List<Movie> movies = [];
  String message = '';

  MovieModel() {
    _fetchMovie();
  }

  MovieState get movieState => _movieState;

  Future<void> _fetchMovie() async {
    _movieState = MovieState.Loading;
    // final service = ApiService.instance;
    try {
      // if (movieId == 0) {
      //   await Future.delayed(Duration(seconds: 5));
      //   movies = await service.getNowPlayingMovie();
      // } else {
      //   print(movieId);
      //   await Future.delayed(Duration(seconds: 5));
      //   movies = await service.getMovieByGenre(movieId);
      // }
      await Future.delayed(Duration(seconds: 5));
      final apimovie = await ApiService.instance.getNowPlayingMovie();
      movies = apimovie;
      _movieState = MovieState.Loaded;
    } catch (e) {
      message = '$e';
      _movieState = MovieState.Error;
    }
    notifyListeners();
  }
}
