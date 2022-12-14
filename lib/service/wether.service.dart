import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_flutter_rest_api/models/wether.model.dart';

class WeatherService {
// https:api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  Future<WeatherModel> getWeather(String lat, String lon) async {
    const apiKey = 'API_Key';

    final uri = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    final res = await http.get(uri);
    print(res.body);
    final json = jsonDecode(res.body);
    return WeatherModel.fromJson(json);
  }
}
