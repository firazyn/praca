import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praca/view_main/current_tile.dart';

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
      body: Column(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: GoogleFonts.montserrat(color: Colors.white),
                        child: Text(
                          //Temperature
                          "25°C",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      DefaultTextStyle(
                        style: GoogleFonts.raleway(color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            //Location
                            "Way Kanan",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Image.asset(
                          "weather_status_icons/Sunny.png",
                          height: 75,
                          width: 75,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: DefaultTextStyle(
                          style: GoogleFonts.montserrat(color: Colors.white),
                          child: Text(
                            //Weather Status
                            "Sunny",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xff00539c),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Tile("Thermo.png", "Feels Like", "35"),
                  Tile("Humid.png", "Humidity", "71%"),
                  Tile("Percipitation.png", "Percipitation", "17%"),
                  Tile("Wind.png", "Wind Speed", "5 km/h"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
