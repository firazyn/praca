import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praca/view_main/current.dart';
import 'package:praca/view_main/weekly.dart';
import 'package:praca/view_main/today.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff00539c),
            elevation: 0,
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffffd662)),
              tabs: [
                DefaultTextStyle(
                  style: GoogleFonts.raleway(color: Colors.white),
                  child: Text(
                    "CURRENT",
                  ),
                ),
                DefaultTextStyle(
                  style: GoogleFonts.raleway(color: Colors.white),
                  child: Text(
                    "TODAY",
                  ),
                ),
                DefaultTextStyle(
                  style: GoogleFonts.raleway(color: Colors.white),
                  child: Text(
                    "WEEKLY",
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Current(),
              Today(),
              // Center(
              //   child: DefaultTextStyle(
              //     style: GoogleFonts.raleway(color: Colors.black),
              //     child: Text(
              //       "TODAY",
              //     ),
              //   ),
              // ),
              Weekly(),
            ],
          ),
        ),
      ),
    );
  }
}
