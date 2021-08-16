import 'package:carousel_slider/carousel_slider.dart';
import 'package:exam_provider/component/title_card.dart';
import 'package:exam_provider/src/model/movie.dart';
import 'package:exam_provider/src/provider/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleHeader extends StatefulWidget {
  final int selectedGenre;

  TitleHeader({Key key, this.selectedGenre = 28}) : super(key: key);

  @override
  _TitleHeaderState createState() => _TitleHeaderState();
}

class _TitleHeaderState extends State<TitleHeader> {
  int selectedGenre;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieModel(),
      child: Builder(
        builder: (context) {
          final model = Provider.of<MovieModel>(context);
          if (model.movieState == MovieState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (model.movieState == MovieState.Error) {
            return Center(
              child: Text('an Error Occured ${model.message}'),
            );
          }
          final movies = model.movies;
          return CarouselSlider.builder(
            itemCount: movies.length ,
            itemBuilder: (BuildContext context, int index) {
              Movie movie = movies[index];
              return TitleCard(
                title: movie.title,
                image:
                    'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         MovieDetailScreen(movie: movie),
                  //   ),
                  // );
                },
              );
            },
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(microseconds: 500),
              pauseAutoPlayOnTouch: true,
              viewportFraction: 0.95,
              enlargeCenterPage: true,
            ),
          );
        },
      ),
    );
  }
}
