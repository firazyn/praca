import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:praca/l10n/locale_provider.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
        centerTitle: true,
        backgroundColor: Color(0xff00539c),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff00539c)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                AppLocalizations.of(context).select_language,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LanguageButton(languageName: 'EN', locale: Locale('en')),
                LanguageButton(languageName: 'ID', locale: Locale('id')),
                LanguageButton(languageName: 'JP', locale: Locale('ja')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatefulWidget {
  final languageName;
  final Locale locale;

  LanguageButton({@required this.languageName, @required this.locale});
  _LanguageButtonState createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  double _elevation = 1;
  Color _textColor = Color(0xff00539c);
  Color _bgColor = Colors.white;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);

    return FloatingActionButton(
      child: Text(
        widget.languageName,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: _textColor,
          ),
        ),
      ),
      backgroundColor: _bgColor,
      elevation: _elevation,
      onPressed: () {
        provider.setLocale(widget.locale);
        setState(() {
          _isSelected = !_isSelected;
          _textColor = Colors.white;
          _bgColor = Color(0xff00539c);
          _elevation = 0;
        });
      },
    );
  }
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
                          Text("Firaztori Yusuf Nurwanto",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                                "Firaztori Yuzuf Nurwanto adalah mahasiswa jurusan Ilmu Komputer angkatan 2018",
                                style: GoogleFonts.montserrat(fontSize: 12
                                    // fontWeight: FontWeight.bold,
                                    ),
                                textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    ),
                  ),
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
                      ),
                    ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
