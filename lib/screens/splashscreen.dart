import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:weather_flutter_rest_api/screens/home.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
        
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home(),)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.cover,
              opacity: 0.6)
              ),
          child: Center(child: Text("DarkSky",style: TextStyle( fontFamily: 'Rubik Dirt' ,color: Color.fromARGB(255, 4, 50, 96), fontSize: 60, fontWeight: FontWeight.w700,)))),
    );
  }
}
