import 'package:flutter/material.dart';
import 'package:praca/view_main/current_body.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

Future<WeatherInfo> fetchWeather() async {
  final geo = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  final latitude = geo.latitude.toString();
  final longitude = geo.longitude.toString();
  final apiKey = "87a9eb26f966eaff02e14fd9598d6862&";
  final apiUrl =
      "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey";
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading request URL info.");
  }
}

class WeatherInfo {
  final location;
  final weather;
  final temp;
  final tempFeels;
  final humidity;
  final pressure;
  final windSpeed;

  WeatherInfo({
    this.location,
    this.weather,
    this.temp,
    this.tempFeels,
    this.humidity,
    this.pressure,
    this.windSpeed,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      location: json['name'],
      temp: json['main']['temp'],
      tempFeels: json['main']['feels_like'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: json['wind']['speed'],
      weather: json['weather'][0]['main'],
    );
  }
}

class Current extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Current();
  }
}

class _Current extends State<Current> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CurrentBody(
              location: snapshot.data.location,
              weather: snapshot.data.weather,
              temp: snapshot.data.temp,
              tempFeels: snapshot.data.tempFeels,
              humidity: snapshot.data.humidity,
              pressure: snapshot.data.pressure,
              windSpeed: snapshot.data.windSpeed,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Container(
            color: Color(0xff00539c),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
