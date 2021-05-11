import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tile extends StatelessWidget {
  final String image;
  final String title;
  final String info;

  Tile(this.image, this.title, this.info);

  @override
  Widget build(BuildContext context) {
    return Card(
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
        title: DefaultTextStyle(
          style: GoogleFonts.raleway(color: Color(0xffffd662)),
          child: Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
        ),
        subtitle: DefaultTextStyle(
          style: GoogleFonts.montserrat(color: Color(0xffffffff)),
          child: Text(
            info,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
