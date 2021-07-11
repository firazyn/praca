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
    itemHelp,
    // itemSettings,
    itemRate,
  ];

  // static const itemSettings = MenuItem(
  //   text: 'Settings',
  //   icon: Icons.settings,
  // );

  static const itemHelp = MenuItem(
    text: 'Help',
    icon: Icons.help,
  );

  static const itemRate = MenuItem(
    text: 'Tutorials',
    icon: Icons.star,
  );
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
        centerTitle: true,
        backgroundColor: Color(0xff00539c),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff00539c)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
            LanguageButton(),
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatefulWidget {
  // final languageName;
  // final Locale locale;

  // LanguageButton({@required this.languageName, @required this.locale});
  _LanguageButtonState createState() => _LanguageButtonState();
}

// class _LanguageButtonState extends State<LanguageButton> {
//   int newIndex;
//   double _elevation = 0;
//   Color _textColor = Color(0xff00539c);
//   Color _bgColor = Colors.white;
//   List<bool> _isSelected = [false, false, false];

//   void changeColor() {
//     setState(() {
//       _textColor = Colors.white;
//       _bgColor = Color(0xff00539c);
//       _elevation = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LocaleProvider>(context, listen: false);

//     return FloatingActionButton(
//       // splashColor: Color(0xff00539c),
//       child: Text(
//         widget.languageName,
//         style: GoogleFonts.montserrat(
//           textStyle: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 20,
//             color: _textColor,
//           ),
//         ),
//       ),
//       backgroundColor: _bgColor,
//       elevation: _elevation,
//       onPressed: () {
//         provider.setLocale(widget.locale);
//         setState(
//           () {
//             for (int index = 0; index < _isSelected.length; index++) {
//               if (index == newIndex) {
//                 _isSelected[index] = true;
//                 FloatingActionButton.extended(
//                     onPressed: changeColor,
//                     //() {
//                     //   setState(() {
//                     //     _textColor = Colors.white;
//                     //     _bgColor = Color(0xff00539c);
//                     //     _elevation = 0;
//                     //   });
//                     // },
//                     label: Text(widget.languageName));
//               } else {
//                 _isSelected[index] = false;
//               }
//             }
//           },
//         );
//       },
//     );
//   }
// }

class _LanguageButtonState extends State<LanguageButton> {
  // double _elevation = 1;
  // Color _textColor = Color(0xff00539c);
  // Color _bgColor = Colors.white;
  Color _fillColor = Colors.white;
  List<bool> _isSelected = [true, false, false];
  List<Locale> _selectedLocale = [Locale('en'), Locale('id'), Locale('ja')];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    return ToggleButtons(
      renderBorder: true,
      borderColor: Colors.white,
      borderWidth: 0.1,
      isSelected: _isSelected,
      selectedColor: Color(0xff00539c),
      color: Colors.white,
      fillColor: _fillColor,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "EN",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "ID",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "JP",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < _isSelected.length; index++) {
            if (index == newIndex) {
              _isSelected[index] = !_isSelected[index];
              provider.setLocale(_selectedLocale[index]);
            } else {
              _isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   final provider = Provider.of<LocaleProvider>(context, listen: false);
//   return Container(
//       color: Colors.transparent,
//       child: ToggleButtons(
//           isSelected: _isSelected,
//           fillColor: _bgColor,
//           selectedColor: _textColor,
//           color: Colors.white,
//           renderBorder: false,
//           highlightColor: Colors.grey,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 widget.languageName,
//                 style: GoogleFonts.montserrat(
//                   textStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 widget.languageName,
//                 style: GoogleFonts.montserrat(
//                   textStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 widget.languageName,
//                 style: GoogleFonts.montserrat(
//                   textStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//           onPressed: (int newIndex) {
//             int newIndex;
//             provider.setLocale(widget.locale);
//             setState(() {
//               for (int index = 0; index < _isSelected.length; index++) {
//                 if (index == newIndex) {
//                   _isSelected[index] = true;
//                 } else {
//                   _isSelected[index] = false;
//                 }
//               }
//             });
//           }));
//   }
// }

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).help),
          centerTitle: true,
          backgroundColor: Color(0xff00539c),
          elevation: 0,
        ),
        body: Container(
          color: Color(0xff00539c),
          child: Center(
            child: Text(
              AppLocalizations.of(context).help_text,
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ));
    //throw UnimplementedError();
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).about),
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
                    child: Text(AppLocalizations.of(context).info_text,
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
                                "Firaztori Yusuf Nurwanto adalah mahasiswa jurusan Ilmu Komputer angkatan 2018",
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
