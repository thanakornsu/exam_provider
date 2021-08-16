import 'package:exam_provider/component/mysizedbox.dart';
import 'package:exam_provider/component/square_card.dart';
import 'package:exam_provider/src/model/movie.dart';
import 'package:exam_provider/src/provider/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class Popular extends StatefulWidget {
  Popular({Key key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PopularModel(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          sectiontitle(context, "ยอดนิยม", () {}),
          mySizebox(),
          Builder(
            builder: (context) {
              final model = Provider.of<PopularModel>(context);
              if (model.popularState == PopularState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (model.popularState == PopularState.Error) {
                return Center(
                  child: Text('Error ${model.message}'),
                );
              }
              final movies = model.movies;
              return mySizeboxSquareCard(
                ListView.separated(
                  separatorBuilder: (context, index) => VerticalDivider(
                    color: Colors.transparent,
                    width: getProportionateScreenWidth(15),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length == 0 ? 0 : 16,
                  itemBuilder: (context, index) {
                    Movie movie = movies[index];
                    return SquareCard(
                      image:
                          'https://image.tmdb.org/t/p/original/${movie.posterPath}',
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
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
