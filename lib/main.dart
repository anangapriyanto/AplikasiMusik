import 'package:flutter/material.dart';
import 'package:plant_app/homePage.dart';
import 'package:plant_app/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lagu Tradisional Suku Ketengban',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ); //MaterialApp
  }
}
