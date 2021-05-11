import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tile extends StatelessWidget {
  final String image;
  final String title;
  final String info;

  Tile(this.image, this.title, this.info);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/tile_icons/" + image,
            width: 35,
            height: 35,
          ),
        ],
      ),
      title: Text(
        title,
        style: GoogleFonts.raleway(
          textStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xffffd662),
          ),
        ),
      ),
      subtitle: Text(
        info,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
