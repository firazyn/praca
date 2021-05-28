import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather() async {
  final city = "Bandarlampung";
  final apiKey = "152da546ee82e86ad057e09fa718fd85";
  final requestUrl =
      "http://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=${apiKey}";

  final response = await http.get(Uri.parse(requestUrl));
  return WeatherInfo.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception("Error loading request URL info.");
  // }
}

class WeatherInfo {
  final time;
  final weather;
  final image;
  final tempMin;
  final tempMax;
  final temperature;

  WeatherInfo(
      {this.time,
      this.image,
      this.weather,
      this.tempMin,
      this.tempMax,
      this.temperature});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        time: json['time'],
        image: json['main']("icon"),
        weather: json['weather'][0]['description'],
        temperature: json['main']['temperature'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max']);
  }
}

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  Future<WeatherInfo> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<WeatherInfo>(
        future: futureWeather,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: GridTile(
                  child: Card(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(snapshot.data['main']['icon']),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Title(
                            color: Colors.black,
                            child: Text(snapshot.data['main']['temperature']),
                          ),
                        ),
                        Text(snapshot.data['weather'][0]['description']),
                        Text("Min : " + snapshot.data['main']['temp_min']),
                        Text("Max : " + snapshot.data['main']['temp_max']),
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
        },
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class Today extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _Today();
//   }
// }

// class _Today extends State<Today> {
//   final listItem = [
//     {
//       "time": "07.00 AM",
//       "image": "Sunny.png",
//       "weather": "Sunny",
//       "temperature": "27°C"
//     },
//     {
//       "time": "09.00 AM",
//       "image": "Sunny.png",
//       "weather": "Sunny",
//       "temperature": "27,5°C"
//     },
//     {
//       "time": "10.30 AM",
//       "image": "Sunny.png",
//       "weather": "Sunny",
//       "temperature": "26°C"
//     },
//     {
//       "time": "01.00 PM",
//       "image": "Sunny.png",
//       "weather": "Sunny",
//       "temperature": "26,1°C"
//     },
//     {
//       "time": "02.30 PM",
//       "image": "Sunny.png",
//       "weather": "Sunny",
//       "temperature": "26,4°C"
//     },
//     {
//       "time": "09.00 PM",
//       "image": "Sunny.png",
//       "weather": "Sunny",
//       "temperature": "27,1°C"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: listItem.length,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return Category(
//             time: listItem[index]['time'],
//             image: listItem[index]['image'],
//             weather: listItem[index]['weather'],
//             temperature: listItem[index]['temperature'],
//           );
//         });
//   }
// }

// class Category extends StatelessWidget {
// final time;
// final weather;
// final image;
// final temperature;

// Category({this.time, this.image, this.weather, this.temperature});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff00539c),
//       child: Card(
//         elevation: 0,
//         color: Color(0xff00539c),
//         child: Hero(
//           tag: time,
//           child: Material(
//             color: Color(0xff00539c),
//             child: InkWell(
//               onTap: () {},
//               child: GridTile(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       this.time,
//                       style: GoogleFonts.montserrat(
//                         textStyle: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 15,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Image.asset(
//                       "assets/weather_status_icons/" + this.image,
//                       height: 75,
//                       width: 75,
//                     ),
//                     Text(
//                       this.weather,
//                       style: GoogleFonts.raleway(
//                         textStyle: TextStyle(
//                           fontWeight: FontWeight.w300,
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       this.temperature,
//                       style: GoogleFonts.montserrat(
//                         textStyle: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
