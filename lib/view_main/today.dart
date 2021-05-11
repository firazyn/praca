import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Today extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Today();
  }
}

class _Today extends State<Today> {
  final listItem = [
    {
      "time": "07.00 AM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "27°C"
    },
    {
      "time": "09.00 AM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "27,5°C"
    },
    {
      "time": "10.30 AM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "26°C"
    },
    {
      "time": "01.00 PM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "26,1°C"
    },
    {
      "time": "02.30 PM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "26,4°C"
    },
    {
      "time": "09.00 PM",
      "image": "Sunny.png",
      "weather": "Sunny",
      "temperature": "27,1°C"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listItem.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Category(
            time: listItem[index]['time'],
            image: listItem[index]['image'],
            weather: listItem[index]['weather'],
            temperature: listItem[index]['temperature'],
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
                  children: [
                    Text(
                      this.time,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/weather_status_icons/" + this.image,
                      height: 75,
                      width: 75,
                    ),
                    Text(
                      this.weather,
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      this.temperature,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
