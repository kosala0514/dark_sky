class WeatherModel {
  final String city;
  final TemperInfo temperInfo;
  final WeatherInfo weatherInfo;
  final CountryInfo countryInfo;
  final WindInfo windInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherModel(
      {required this.windInfo, required this.countryInfo,
      required this.weatherInfo,
      required this.temperInfo,
      required this.city});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final city = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final countryInfoJson = json['sys'];
    final countryInfo = CountryInfo.fromJson(countryInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);
    return WeatherModel(
        city: city,
        temperInfo: tempInfo,
        weatherInfo: weatherInfo,
        countryInfo: countryInfo, windInfo: windInfo,
        );
  }
}

class TemperInfo {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  TemperInfo(
      {required this.pressure,
      required this.humidity,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max,
      required this.temp});
  factory TemperInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final feels_like = json['feels_like'];
    final temp_min = json['temp_min'];
    final temp_max = json['temp_max'];
    final pressure = json['pressure'];
    final humidity = json['humidity'];
    return TemperInfo(
        temp: temp,
        feels_like: feels_like,
        temp_max: temp_max,
        temp_min: temp_min,
        pressure: pressure,
        humidity: humidity);
  }
}

class WindInfo {
  final double speed;

  WindInfo({required this.speed});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    return WindInfo(speed: speed);
  }
}

class CountryInfo {
  final String country;

  CountryInfo({required this.country});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    final country = json['country'];
    return CountryInfo(country: country);
  }
}

class WeatherInfo {
  final String desc;
  final String icon;

  WeatherInfo({required this.desc, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final desc = json['description'];
    final icon = json['icon'];
    return WeatherInfo(desc: desc, icon: icon);
  }
}
