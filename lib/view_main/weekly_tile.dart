import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tile extends StatelessWidget {
  final String image;
  final String title;
  final String info;
  final String temp;

  Tile(this.image, this.title, this.info, this.temp);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color(0xff00539c),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/weather_status_icons/" + image,
              width: 40,
              height: 40,
            ),
          ],
        ),
        title: Text(
          //Date and Day
          title,
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Color(0xffffd662),
            ),
          ),
        ),
        subtitle: GridTile(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    //Weather Status
                    info,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    //Temperature
                    temp,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
