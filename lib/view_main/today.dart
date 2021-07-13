import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';

Future<List<WeatherInfo>> _fetchWeather() async {
  List<WeatherInfo> weatherInfo = [];
  final geo = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  final latitude = geo.latitude.toString();
  final longitude = geo.longitude.toString();
  final apiKey = "87a9eb26f966eaff02e14fd9598d6862&";
  final apiUrl =
      "http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey";
  final response = await http.get(Uri.parse(apiUrl));
  var jsonInfo = json.decode(response.body)['list'];

  for (Map i in jsonInfo) {
    weatherInfo.add(WeatherInfo.fromJson(i));
  }

  if (response.statusCode == 200) {
    return weatherInfo;
  } else {
    throw Exception("Error loading request URL info.");
  }
}

class WeatherInfo {
  final weather;
  final time;
  final temp;
  final tempMin;
  final tempMax;

  WeatherInfo({
    this.weather,
    this.time,
    this.temp,
    this.tempMin,
    this.tempMax,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      time: json['dt_txt'],
      temp: json['main']['temp'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      weather: json['weather'][0]['main'],
    );
  }
}

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff00539c),
      child: FutureBuilder<List<WeatherInfo>>(
        future: _fetchWeather(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: EdgeInsets.all(10),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                var weatherName = snapshot.data[index + 1].weather;
                var time =
                    snapshot.data[index + 1].time.toString().substring(11, 16);
                var temperature =
                    snapshot.data[index + 1].temp.toInt().toString();
                var tempMin =
                    snapshot.data[index + 1].tempMin.toInt().toString();
                var tempMax =
                    snapshot.data[index + 1].tempMax.toInt().toString();

                return Container(
                    color: Color(0xff00539c),
                    child: GridTile(
                      child: Card(
                        elevation: 0,
                        color: Color(0xff00539c),
                        child: Column(
                          children: [
                            Text(
                              time,
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ),
                            WeatherImage(image: weatherName),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Title(
                                color: Colors.black,
                                child: Text(
                                  "$temperature °C",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            WeatherStatus(status: weatherName.toString()),
                            Text(
                              "Min: $tempMin °C",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Max: $tempMax °C",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class WeatherImage extends StatefulWidget {
  final image;

  WeatherImage({this.image});

  @override
  _WeatherImageState createState() => _WeatherImageState();
}

class _WeatherImageState extends State<WeatherImage> {
  @override
  Widget build(BuildContext context) {
    String weatherImage;
    if (widget.image == 'Rain') {
      setState(() {
        weatherImage = "Rain";
      });
    } else if (widget.image == 'Sunny') {
      setState(() {
        weatherImage = "Sunny";
      });
    } else if (widget.image == 'Clouds') {
      setState(() {
        weatherImage = "Clouds";
      });
    } else if (widget.image == 'Snow') {
      setState(() {
        weatherImage = "Snow";
      });
    } else if (widget.image == 'Thunderstorm') {
      setState(() {
        weatherImage = "Thunderstorm";
      });
    } else if (widget.image == 'Drizzle') {
      setState(() {
        weatherImage = "Drizzle";
      });
    } else {
      weatherImage = "Unknown";
    }

    return Flexible(
      child: Image.asset(
        "assets/weather_status_icons/$weatherImage.png",
        height: 60,
        width: 60,
      ),
    );
  }
}

class WeatherStatus extends StatefulWidget {
  final status;

  WeatherStatus({this.status});

  @override
  _WeatherStatusState createState() => _WeatherStatusState();
}

class _WeatherStatusState extends State<WeatherStatus> {
  @override
  Widget build(BuildContext context) {
    String weatherStatus;
    if (widget.status == 'Rain') {
      setState(() {
        weatherStatus = AppLocalizations.of(context).rain;
      });
    } else if (widget.status == 'Sunny') {
      setState(() {
        weatherStatus = AppLocalizations.of(context).sunny;
      });
    } else if (widget.status == 'Clouds') {
      setState(() {
        weatherStatus = AppLocalizations.of(context).clouds;
      });
    } else {
      weatherStatus = widget.status;
    }

    return Text(
      weatherStatus,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
