import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Harita ',
      theme: ThemeData(
        primaryColor: Color(0xff6200ee),
      ),
      home: HomePage(),
    );
  }
}