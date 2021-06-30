import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.settings,
              text: AppLocalizations.of(context).settings,
              onTap: () => print('Tap Settings')),
          _drawerItem(
              icon: Icons.file_copy,
              text: AppLocalizations.of(context).about,
              onTap: () => print('Tap About')),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.settings,
              text: AppLocalizations.of(context).settings,
              onTap: () => print('Tap Settings')),
          _drawerItem(
              icon: Icons.file_copy,
              text: AppLocalizations.of(context).about,
              onTap: () => print('Tap About')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return Container(
    child: Text(
      "Welcome, User",
      style: GoogleFonts.raleway(
          textStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white)),
    ),
    color: Color(0xff00539c),
    height: 80,
    padding: EdgeInsets.all(30),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
