import 'package:dio/dio.dart';
import 'package:exam_provider/src/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // final Dio _dio = Dio();
  static ApiService _instance;
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '6a0cc9a60becfce662345daa7adebcec';

  ApiService._();

  static ApiService get instance {
    if (_instance == null) {
      _instance = ApiService._();
    }
    return _instance;
  }
  // ************ Now Playing ************ //

// Future<List<Movie>> getNowPlayingMovie() async {
//     try {
//       final url = '$baseUrl/movie/now_playing?api_key=$apiKey';
//       print('Api Call: $url');
//       final response = await _dio.get(url);
//       var movies = response.data['results'] as List;
//       List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
//       return movieList;
//     } catch (error, stacktrace) {
//       print(error);
//       throw Exception(
//           'Exception accoured: $error with stacktrace: $stacktrace');
//     }
//   }
  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      final url = '$baseUrl/movie/now_playing?api_key=$apiKey';
      print('Api Call: $url');
      final response = await http.get(url);
      var movies = json.decode(response.body)['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      print(error);
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

    Future<List<Movie>> getPopularMovie() async {
    try {
      final url = '$baseUrl/movie/popular?api_key=$apiKey';
      print('Api Call: $url');
      final response = await http.get(url);
      var movies = json.decode(response.body)['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      print(error);
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getMovieByGenre(int movieId) async {
    try {
      final url =
          '$baseUrl/discover/movie?with_genres=$movieId&api_key=$apiKey';
      print('Api Call: $url');
      final response = await http.get(url);
      var movies = json.decode(response.body)['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
