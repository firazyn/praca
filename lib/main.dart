import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praca/view_main/current.dart';
import 'package:praca/view_main/weekly.dart';
import 'package:praca/view_main/7days.dart';
import 'package:praca/view_main/todayver2.dart';
import 'package:praca/drawer.dart';

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
    return DefaultTabController(
        // child: Stack(
        //   children: [
        //     Current(),
        //     Container(
        //       child: Row(
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(top: 25),
        //             child: DefaultTextStyle(
        //               style: GoogleFonts.raleway(color: Colors.white),
        //               child: Text(
        //                 "CURRENT",
        //                 style: TextStyle(fontSize: 10),
        //               ),
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(top: 25, left: 10, right: 10),
        //             child: DefaultTextStyle(
        //               style: GoogleFonts.raleway(color: Colors.white),
        //               child: Text(
        //                 "TODAY",
        //                 style: TextStyle(fontSize: 10),
        //               ),
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(top: 25),
        //             child: DefaultTextStyle(
        //               style: GoogleFonts.raleway(color: Colors.white),
        //               child: Text(
        //                 "WEEKLY",
        //                 style: TextStyle(fontSize: 10),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              width: 100,
              child: Text(
                "PRACA",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff00539c),
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Setting Icon',
                onPressed: () {},
              ), //IconButton
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.white30,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent),
              tabs: [
                Text(
                  "CURRENT",
                  style: GoogleFonts.raleway(fontSize: 12),
                ),
                Text(
                  "TODAY",
                  style: GoogleFonts.raleway(fontSize: 12),
                ),
                /*Text(
                "WEEKLY",
                style: GoogleFonts.raleway(fontSize: 12),
              ),*/
                Text(
                  "7-DAYS-FORWARD",
                  style: GoogleFonts.raleway(fontSize: 12),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Current(),
              Today(),
              //Weekly(),
              SevenDays(),
            ],
          ),
          drawer: Container(
            child: DrawerWidget(),
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
