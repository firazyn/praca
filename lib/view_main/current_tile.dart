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
      title: DefaultTextStyle(
        style: GoogleFonts.raleway(color: Color(0xffffd662)),
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
      subtitle: DefaultTextStyle(
        style: GoogleFonts.montserrat(color: Color(0xffffffff)),
        child: Text(
          info,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
