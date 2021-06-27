import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    this.text,
    this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> itemFirst = [
    itemSettings,
    itemAbout,
  ];

  static const itemSettings = MenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );

  static const itemAbout = MenuItem(
    text: 'About',
    icon: Icons.info,
  );
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          centerTitle: true,
          backgroundColor: Color(0xff00539c),
        ),
      );
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('About'),
          centerTitle: true,
          backgroundColor: Color(0xff00539c),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                // color: Color(0xff00539c),
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.info,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("About Developers",
                          style: GoogleFonts.raleway(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        // color: Colors.cyan,
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 40,
                                  child: Icon(Icons.people),
                                ),
                              ),
                              Text("Firaztori Yuzuf Nurwanto",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                    "Firaztori Yuzuf Nurwanto adalah mahasiswa jurusan Ilmu Komputer angkatan 2018",
                                    style: GoogleFonts.montserrat(fontSize: 12
                                        // fontWeight: FontWeight.bold,
                                        ),
                                    textAlign: TextAlign.center),
                              )
                            ]))),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      // color: Colors.orange,
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: Icon(Icons.people),
                            ),
                          ),
                          Text("Gema Annisa Hermastuti",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                                "Gema Annisa Hermastuti adalah mahasiswa jurusan Ilmu Komputer angkatan 2018",
                                style: GoogleFonts.montserrat(fontSize: 12
                                    // fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center),
                          )
                        ],
                      )),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      // color: Colors.lime,
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: Icon(Icons.people),
                            ),
                          ),
                          Text("Embu Banjar Kusuma",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                                "Embu Banjar Kusuma adalah mahasiswa jurusan Ilmu Komputer angkatan 2018",
                                style: GoogleFonts.montserrat(fontSize: 12
                                    // fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              );
            }),
      );
}
