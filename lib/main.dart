import 'package:flutter/material.dart';
import 'package:weather_flutter_rest_api/screens/splashscreen.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}


