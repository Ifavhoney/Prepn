import 'package:flutter/material.dart';
import 'package:prepn/ui/home.dart';
import 'package:prepn/ui/Food/FoodOptions.dart';
//import 'package:prepn/ui/studentPortal/register2.dart';

void main() {
  runApp(Prepn());
}

class Prepn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.pink.shade300,
          accentColor: Colors.cyan.shade100,
          cardColor: Colors.teal.shade200,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.lightBlue.shade200,
              textTheme: ButtonTextTheme.accent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          textTheme: TextTheme(
              button: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              headline: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50))),
      title: "Prep'n",
      // home: Home(),
      home: FoodOptions(),
    );
  }
}
