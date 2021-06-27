import 'package:flutter/material.dart';

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
      );
}
