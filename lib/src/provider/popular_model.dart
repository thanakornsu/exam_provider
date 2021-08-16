import 'package:exam_provider/src/model/movie.dart';
import 'package:exam_provider/src/services/api_services.dart';
import 'package:flutter/widgets.dart';

enum PopularState {
  Initail,
  Loading,
  Loaded,
  Error,
}

class PopularModel extends ChangeNotifier {
  PopularState _popularState = PopularState.Initail;

  List<Movie> movies = [];
  String message = '';

  PopularModel() {
    _fetchMovie();
  }

  PopularState get popularState => _popularState;

  Future<void> _fetchMovie() async {
    _popularState = PopularState.Loading;
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
      final apimovie = await ApiService.instance.getPopularMovie();
      movies = apimovie;
      _popularState = PopularState.Loaded;
    } catch (e) {
      message = '$e';
      _popularState = PopularState.Error;
    }
    notifyListeners();
  }
}
