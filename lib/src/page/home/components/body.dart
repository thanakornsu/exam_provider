import 'package:exam_provider/component/mysizedbox.dart';
import 'package:exam_provider/src/page/home/components/popular.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import 'titleheader.dart';

class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleHeader(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mySizebox(),
                      Popular(),
                      // MovieNowPlaying(),
                      // TvRated(),
                      // MovieUpComing(),
                      // MovieTopRated(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
