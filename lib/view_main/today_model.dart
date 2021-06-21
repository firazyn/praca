class List {
  final String dt_txt;
  final Main main;
  final Weather weather;

  List({this.dt_txt, this.main, this.weather});

  factory List.fromJson(Map<String, dynamic> json) {
    return new List(
        dt_txt: json['dt_txt'],
        main: Main.fromJson(json['main']),
        weather: Weather.fromJson(json['weather']));
  }
}

class Main {
  final String temp;
  // ignore: non_constant_identifier_names
  final String temp_min;
  // ignore: non_constant_identifier_names
  final String temp_max;

  Main({this.temp, this.temp_min, this.temp_max});

  factory Main.fromJson(Map<String, dynamic> json) {
    return new Main(
        temp: json['temp'],
        temp_min: json['temp_min'],
        temp_max: json['temp_max']);
  }
}

class Weather {
  final String main;

  Weather({this.main});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return new Weather(main: json['main']);
  }
}
