import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather() async {
  final latitude = "-5.3745746";
  final longitude = "105.2303276";
  final apiKey = "152da546ee82e86ad057e09fa718fd85";
  final requestUrl =
      "http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey";

  final response = await http.get(Uri.parse(requestUrl));
  return WeatherInfo.fromJson(jsonDecode(response.body));
}

class WeatherInfo {
  final time;
  final weather;
  final image;
  final tempMin;
  final tempMax;
  final temperature;
  List<int> index = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  WeatherInfo(
      {this.time,
      this.image,
      this.weather,
      this.tempMin,
      this.tempMax,
      this.temperature});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        time: json['dt_txt'],
        weather: json['list'][0]['weather'][0]['main'],
        temperature: json['list'][0]['main']['temp'],
        tempMin: json['list'][0]['main']['temp_min'],
        tempMax: json['list'][0]['main']['temp_max']);
    // time: json['time'],
    // weather: json['list'][0]['weather'][0]['main'],
    // temperature: json['list'][0]['main']['temp'],
    // tempMin: json['list'][0]['main']['temp_min'],
    // tempMax: json['list'][0]['main']['temp_max']);
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
      color: Color(0xff00539c),
      child: FutureBuilder<WeatherInfo>(
        future: futureWeather,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: EdgeInsets.all(10),
              // itemCount: snapshot.data.length,
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
                              snapshot.data.time.toString(),
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ),
                            Image.asset(
                              "assets/weather_status_icons/${snapshot.data.weather}.png",
                              height: 60,
                              width: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Title(
                                color: Colors.black,
                                child: Text(
                                  snapshot.data.temperature.toInt().toString() +
                                      "°C",
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
                            Text(
                              snapshot.data.weather.toString(),
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ),
                            Text(
                              "Min : ${snapshot.data.tempMin.toInt().toString()} °C",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Max : ${snapshot.data.tempMax.toInt().toString()} °C",
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:weather/weather.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'today_model.dart';

// class WeatherInfo {
//   final time;
//   final weather;
//   final image;
//   final tempMin;
//   final tempMax;
//   final temperature;

//   WeatherInfo(Set set,
//       {this.time,
//       this.image,
//       this.weather,
//       this.tempMin,
//       this.tempMax,
//       this.temperature});
// }

// class Today extends StatefulWidget {
//   @override
//   _TodayState createState() => _TodayState();
// }

// class _TodayState extends State<Today> {
//   List<List> weatherInfo = [];
//   var loading = false;
//   Future<Null> fetchWeather() async {
//     final latitude = "-5.3745746";
//     final longitude = "105.2303276";
//     final apiKey = "152da546ee82e86ad057e09fa718fd85";
//     final requestUrl =
//         "http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey";

//     setState(() {
//       loading = true;
//     });
//     final response = await http.get(Uri.parse(requestUrl));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         for (Map i in data) {
//           weatherInfo.add(List.fromJson(i));
//         }
//         loading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchWeather();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff00539c),
//       child: FutureBuilder(
//         future: fetchWeather(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return GridView.builder(
//               gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               padding: EdgeInsets.all(10),
//               itemCount: weatherInfo.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final item = weatherInfo[i];
//                 return Container(
//                     color: Color(0xff00539c),
//                     child: GridTile(
//                       child: Card(
//                         elevation: 0,
//                         color: Color(0xff00539c),
//                         child: Column(
//                           children: [
//                             Text(
//                               item.dt_txt,
//                               style: GoogleFonts.raleway(
//                                   textStyle: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       fontSize: 18,
//                                       color: Colors.white)),
//                             ),
//                             Image.asset(
//                               "assets/weather_status_icons/${item.weather.main}.png",
//                               height: 60,
//                               width: 60,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(8),
//                               child: Title(
//                                 color: Colors.black,
//                                 child: Text(
//                                   item.main.temp + "°C",
//                                   style: GoogleFonts.montserrat(
//                                     textStyle: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 13,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               item.weather.main,
//                               style: GoogleFonts.raleway(
//                                   textStyle: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       fontSize: 18,
//                                       color: Colors.white)),
//                             ),
//                             Text(
//                               "Min : ${item.main.temp_min} °C",
//                               style: GoogleFonts.montserrat(
//                                 textStyle: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 11.8,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "Max : ${item.main.temp_max} °C",
//                               style: GoogleFonts.montserrat(
//                                 textStyle: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 11.8,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ));
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("${snapshot.error}"),
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }

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