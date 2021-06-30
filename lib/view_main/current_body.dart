import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praca/view_main/current_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrentBody extends StatelessWidget {
  final location;
  final weather;
  final temp;
  final tempFeels;
  final humidity;
  final pressure;
  final windSpeed;

  CurrentBody({
    this.location,
    this.weather,
    this.temp,
    this.tempFeels,
    this.humidity,
    this.pressure,
    this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff00539c),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //Temperature
                        "${temp.toInt().toString()}°C",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          //Location
                          "${location.toString()}",
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Image.asset(
                          "assets/weather_status_icons/$weather.png",
                          height: 75,
                          width: 75,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        //Weather Status
                        child: WeatherStatus(status: weather.toString()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Color(0xff00539c),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Tile("Thermo.png", AppLocalizations.of(context).feels_like,
                      "${tempFeels.toInt().toString()}°C"),
                  Tile("Humid.png", AppLocalizations.of(context).humidity,
                      "${humidity.toString()}%"),
                  Tile("Pressure.png", AppLocalizations.of(context).pressure,
                      "${pressure.toString()} hPa"),
                  Tile("Wind.png", AppLocalizations.of(context).wind_speed,
                      "${windSpeed.toString()} km/h"),
                ],
              ),
            ),
          ),
        ),
      ],
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
    String weatherStatus = widget.status;
    if (weatherStatus == 'Rain') {
      setState(() {
        weatherStatus = AppLocalizations.of(context).rain;
      });
    } else if (weatherStatus == 'Sunny') {
      setState(() {
        weatherStatus = AppLocalizations.of(context).sunny;
      });
    } else if (weatherStatus == 'Clouds') {
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
          fontSize: 25.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
