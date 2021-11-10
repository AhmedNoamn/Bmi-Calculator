import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
            //for number
            headline1: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            //for title
            headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            //for result
            headline3: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: Colors.blueGrey,
            ),
            //for cm
            bodyText1: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
      title: 'BMI Clac',
      home: MyHomePage(),
    );
  }
}
