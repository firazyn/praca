import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  Future<List<dynamic>> fetchWeather() async {
    final geo = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final latitude = geo.latitude.toString();
    final longitude = geo.longitude.toString();
    final apiKey = "152da546ee82e86ad057e09fa718fd85";
    final requestUrl =
        "http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey";

    final response = await http.get(Uri.parse(requestUrl));
    return json.decode(response.body)['list'];
  }

  _time(dynamic data) {
    return data['dt_txt'];
  }

  _weather(dynamic data) {
    return data['weather'][0]['main'];
  }

  _temperature(dynamic data) {
    return data['main']['temp'];
  }

  _tempMin(dynamic data) {
    return data['main']['temp_min'];
  }

  _tempMax(dynamic data) {
    return data['main']['temp_max'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff00539c),
      child: FutureBuilder<List<dynamic>>(
        future: fetchWeather(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: Color(0xff00539c),
                    child: GridTile(
                      child: Card(
                        elevation: 0,
                        color: Color(0xff00539c),
                        child: Column(
                          children: [
                            Text(
                              _time(snapshot.data[index])
                                  .toString()
                                  .substring(11, 16),
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ),
                            Flexible(
                              child: Image.asset(
                                "assets/weather_status_icons/${_weather(snapshot.data[index])}.png",
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Title(
                                color: Colors.black,
                                child: Text(
                                  "${_temperature(snapshot.data[index]).toInt().toString()} °C",
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
                            WeatherStatus(
                                status:
                                    _weather(snapshot.data[index]).toString()),
                            Text(
                              "Min: ${_tempMin(snapshot.data[index]).toInt().toString()} °C",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Max: ${_tempMax(snapshot.data[index]).toInt().toString()} °C",
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
