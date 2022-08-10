import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:weather_flutter_rest_api/models/wether.model.dart';
import 'package:weather_flutter_rest_api/service/wether.service.dart';
import 'package:weather_flutter_rest_api/widgets/weather_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weatherService = WeatherService();
  WeatherModel? _res;
  double? temp, max_temp, min_temp, feels;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWeatherDetaiks();
  }

  _getWeatherDetaiks() async {
    final res = await _weatherService.getWeather("1.95", "15.86");
    setState(() {
      _res = res;
      temp = double.parse((res.temperInfo.temp - 273.15).toStringAsFixed(1));
      max_temp =
          double.parse((res.temperInfo.temp_max - 273.15).toStringAsFixed(1));
      min_temp =
          double.parse((res.temperInfo.temp_min - 273.15).toStringAsFixed(1));
      feels = double.parse(((res.temperInfo.feels_like - 273.15) * (9 / 5) + 32)
          .toStringAsFixed(1));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/main_day.jpg"),
              fit: BoxFit.cover,
              opacity: 0.6)),
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: _res == null
                  ? Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        Container(
                          height: height * 0.2,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 4, 50, 96).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network(
                                  _res!.iconUrl,
                                  fit: BoxFit.contain,
                                  scale: 0.5,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      temp.toString() + "°C",
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      _res!.city +
                                          " | " +
                                          _res!.countryInfo.country,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      _res!.weatherInfo.desc,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height * 0.35, left: width * 0.3),
                          height: 100,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 4, 50, 96).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.white.withOpacity(0.5),
                            //     spreadRadius: 1,
                            //     blurRadius: 3,
                            //     offset:
                            //         Offset(6, 3), // changes position of shadow
                            //   ),
                            //   BoxShadow(
                            //     color: Color(0xff2980B9).withOpacity(0.5),
                            //     spreadRadius: 1,
                            //     blurRadius: 3,
                            //     offset:
                            //         Offset(6, 6), // changes position of shadow
                            //   ),
                            //   BoxShadow(
                            //     color: Color(0xff6DD5FA).withOpacity(0.5),
                            //     spreadRadius: 1,
                            //     blurRadius: 3,
                            //     offset:
                            //         Offset(3, 6), // changes position of shadow
                            //   ),
                            // ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Max : " + max_temp.toString() + "°C",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Min : " + min_temp.toString() + "°C",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Feels like : " + feels.toString() + "°F",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(25),
                          margin: EdgeInsets.only(
                              left: 35, right: 35, top: height * 0.5),
                          height: height * 0.2,
                          width: width,
                          decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 4, 50, 96).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Humidity",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    _res!.temperInfo.humidity.toString() + " %",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Pressure",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    _res!.temperInfo.pressure.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Wind speed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    _res!.windInfo.speed.toString() + "mph",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.3,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                            top: height * 0.7,
                          ),
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[
                              WeatherCard(
                                  background: "assets/images/heavy_rain.jpg",
                                  day: "Sun",
                                  image:
                                      "http://openweathermap.org/img/wn/10d@2x.png",
                                  temp: 26.1),
                              WeatherCard(
                                  background: "assets/images/sun_cloud.jpg",
                                  day: "Mon",
                                  image:
                                      "http://openweathermap.org/img/wn/02d@2x.png",
                                  temp: 28.1),
                              WeatherCard(
                                  background: "assets/images/rainy.jpg",
                                  day: "Tue",
                                  image:
                                      "http://openweathermap.org/img/wn/09d@2x.png",
                                  temp: 24.1),
                              WeatherCard(
                                  background: "assets/images/mist.jpg",
                                  day: "Wed",
                                  image:
                                      "http://openweathermap.org/img/wn/50d@2x.png",
                                  temp: 21.1),
                              WeatherCard(
                                  background: "assets/images/thunder.jpg",
                                  day: "Thu",
                                  image:
                                      "http://openweathermap.org/img/wn/11d@2x.png",
                                  temp: 20.1),
                              WeatherCard(
                                  background: "assets/images/sunny.jpg",
                                  day: "Fri",
                                  image:
                                      "http://openweathermap.org/img/wn/01d@2x.png",
                                  temp: 29.1),
                              WeatherCard(
                                  background: "assets/images/snow.jpg",
                                  day: "Sat",
                                  image:
                                      "http://openweathermap.org/img/wn/13d@2x.png",
                                  temp: -9.1),
                            ],
                          ),
                        ),
                      ],
                    ))),
    );

    // child: Column(
    //   children: [
    //     GestureDetector(
    //       onTap: () async {
    //         final res = await _weatherService.getWeather("6.70", "80.38");
    //         setState(() {
    //           _res = res;
    //         });
    //       },
    //       child: Text("Welcome to Home"),
    //     ),
    //     Column(
    //       children: [
    //         _res == null ? Text("data") : Image.network(_res!.iconUrl),
    //         Text(_res == null? "No data" : _res!.city),

    //         Text(_res == null? "No data" : _res!.temperInfo.temp.toString()),

    //         Text(_res == null? "No data" : _res!.weatherInfo.desc),
    //       ],
    //     )
    //   ],
    // ),
  }
}
