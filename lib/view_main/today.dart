import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Today extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Today();
  }
}

class _Today extends State<Today> {
  final list_item = [
    {
      "time": "07.00 AM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "27'C"
    },
    {
      "time": "09.00 AM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "27,5'C"
    },
    {
      "time": "10.30 AM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "26'C"
    },
    {
      "time": "01.00 PM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "26,1'C"
    },
    {
      "time": "02.30 PM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "26,4'C"
    },
    {
      "time": "09.00 PM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "27,1'C"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: list_item.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Category(
            time: list_item[index]['time'],
            image: list_item[index]['image'],
            weather: list_item[index]['weather'],
            temperature: list_item[index]['temperature'],
          );
        });
  }
}

class Category extends StatelessWidget {
  final time;
  final weather;
  final image;
  final temperature;

  Category({this.time, this.image, this.weather, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff00539c),
      child: Card(
        elevation: 0,
        color: Color(0xff00539c),
        child: Hero(
            tag: time,
            child: Material(
              color: Color(0xff00539c),
              child: InkWell(
                onTap: () {},
                child: GridTile(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(this.time,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                      Container(
                        child: Image.asset(
                            "assets/weather_status_icons/" + this.image),
                        height: 38,
                        width: 38,
                      ),
                      Text(this.weather,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(this.temperature,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
