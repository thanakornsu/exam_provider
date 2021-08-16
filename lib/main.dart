import 'package:exam_provider/src/page/home/homescreen.dart';
import 'package:exam_provider/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: HomeScreen(),
    );
  }
}
