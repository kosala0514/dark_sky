import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter_rest_api/screens/day.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {Key? key,
      required this.background,
      required this.day,
      required this.image,
      required this.temp})
      : super(key: key);
  final String background;
  final String day;
  final String image;
  final double temp;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: width * 0.3,
          margin: EdgeInsets.only(bottom: 8, left: 10),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(4, 4), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15),
                  ),
        ),
        Container(
          width: width * 0.3,
          margin: EdgeInsets.only(bottom: 8, left: 10),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 4, 50, 96).withOpacity(0.6),
          ),
            child: Column(
              children: [
                Container(

                    child:day == "Sat" || day == "Wed" ?  Image.network(
                  image,
                  color: Colors.white,
                  scale: 0.9,
                ) :
                Image.network(
                  image,
                  scale: 0.9,
                )
                ),
                Text(
                  temp.toString()+"°C",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(day,
                  style: TextStyle(color: Colors.white)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DayWeather(background: background, temp: temp,day: day,image: image,)),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top:2, left: 70),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded
                        , color: Colors.white
                      ),
                    ))
              ],
            )),
      ],
    );
  }
}
