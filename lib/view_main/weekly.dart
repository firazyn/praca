import 'package:flutter/material.dart';
import 'package:praca/view_main/weekly_tile.dart';

class Weekly extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Weekly();
  }
}

class _Weekly extends State<Weekly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xff00539c),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    vertical: 75.0, horizontal: 75.0),
                children: [
                  Tile("Sunny.png", "Monday, May 10", "Sunny 27°C/35°C"),
                  Tile(
                      "Sunny.png", "Tuesday, May 11", "Thunderstorm 18°C/25°C"),
                  Tile("Sunny.png", "Wednesday, May 12", "Cloudy 23°C/30°C"),
                  Tile("Sunny.png", "Thursday, May 13", "Light Rain 20°C/29°C"),
                  Tile("Sunny.png", "Friday, May 14", "Heavy Rain 17°C/26°C"),
                  Tile("Sunny.png", "Saturday, May 15", "Sunny 29°C/40°C"),
                  Tile("Sunny.png", "Sunday, May 16", "Cloudy 25°C/30°C"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
