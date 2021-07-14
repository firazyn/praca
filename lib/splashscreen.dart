import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praca/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00539c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/praca_icons/praca_logo.png",
              height: 150.0,
              width: 150.0,
              color: Colors.white,
            ),
            SizedBox(height: 24.0),
            Text("PRACA",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  color: Colors.white,
                ))),
          ],
        ),
      ),
    );
  }
}
