import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:praca/view_main/menu_item.dart';
import 'package:share_plus/share_plus.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text(AppLocalizations.of(context).general,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
            icon: Icons.settings,
            text: AppLocalizations.of(context).settings,
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsPage())),
            },
          ),
          _drawerItem(
            icon: Icons.share,
            text: AppLocalizations.of(context).share,
            onTap: () => {
              Share.share(
                  'check out this new weather app! https://github.com/firazyn/praca',
                  subject: 'PRACA the NEW Weather App!')
            },
          ),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text(AppLocalizations.of(context).information,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
            icon: Icons.info,
            text: AppLocalizations.of(context).about,
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutPage())),
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          //   child: Text("Labels",
          //       style: TextStyle(
          //         fontSize: 16,
          //         color: Colors.black54,
          //       )),
          // ),
          // _drawerItem(
          //     icon: Icons.settings,
          //     text: AppLocalizations.of(context).settings,
          //     onTap: () => print('Tap Settings')),
          // _drawerItem(
          //     icon: Icons.file_copy,
          //     text: AppLocalizations.of(context).about,
          //     onTap: () => print('Tap About')),
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
