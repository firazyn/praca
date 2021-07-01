import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praca/l10n/locale_provider.dart';
import 'package:praca/view_main/current.dart';
import 'package:praca/view_main/menu_item.dart';
import 'package:praca/view_main/rating_page.dart';
import 'package:provider/provider.dart';
import 'package:praca/view_main/7days.dart';
import 'package:praca/view_main/todayver2.dart';
import 'package:praca/drawer.dart';
import 'package:praca/l10n/L10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
          title: 'Praca',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: HomePage(),
        );
      });
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
            title: Center(
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
              PopupMenuButton<MenuItem>(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  ...MenuItems.itemFirst.map(buildItem).toList(),
                ],
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.white30,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent),
              tabs: [
                Text(
                  AppLocalizations.of(context).current,
                  style: GoogleFonts.raleway(fontSize: 12),
                ),
                Text(
                  AppLocalizations.of(context).today,
                  style: GoogleFonts.raleway(fontSize: 12),
                ),
                /*Text(
                "WEEKLY",
                style: GoogleFonts.raleway(fontSize: 12),
              ),*/
                Text(
                  AppLocalizations.of(context).week,
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

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Color(0xff00539c), size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      // case MenuItems.itemSettings:
      //   Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => SettingsPage()),
      //   );
      //   break;
      case MenuItems.itemHelp:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HelpPage()),
        );
        break;
      case MenuItems.itemRate:
        Utils.openLink(url: 'https://youtube.com');
        break;
    }
  }
}
