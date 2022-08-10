import 'dart:math' as math;
import 'package:flutter/material.dart';

class DayWeather extends StatefulWidget {
  const DayWeather(
      {Key? key,
      required this.day,
      required this.image,
      required this.temp,
      required this.background})
      : super(key: key);

  final String background;
  final String day;
  final String image;
  final double temp;
  @override
  State<DayWeather> createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.background),
              fit: BoxFit.cover,
              opacity: 0.8)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(4, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 4, 50, 96),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: height * 0.1, left: width * 0.2, right: width * 0.2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 4, 50, 96).withOpacity(0.8),
                ),
                child: Stack(
                  children: [
                    Text(
                      widget.temp.toString() + "°C",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.w800),
                    ),
                    widget.day == "Sat" || widget.day == "Wed"
                        ? Image.network(
                            widget.image,
                            color: Colors.white,
                            scale: 0.5,
                          )
                        : Image.network(
                            widget.image,
                            scale: 0.5,
                          )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: width * 0.1, horizontal: width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset:
                                  Offset(4, 4), // changes position of shadow
                            ),
                          ],
                          color:
                              Color.fromARGB(255, 4, 50, 96).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Max : " + widget.temp.toString() + "°C",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Min : " + widget.temp.toString() + "°C",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Feels like : 84°F",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset:
                                  Offset(4, 4), // changes position of shadow
                            ),
                          ],
                          color:
                              Color.fromARGB(255, 4, 50, 96).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Humidity : 85%",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Pressure : 102",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Wind speed : 0.78mph",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(4, 4), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 4, 50, 96).withOpacity(0.8)),
                height: height * 0.2,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2022",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "May",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            child: Text(
                              "27",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      VerticalDivider(
                        color: Color.fromARGB(255, 109, 163, 216),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "overcast clouds",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          Text(
                            "Rathnapura",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Sri Lanka",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
