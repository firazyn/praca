import 'package:flutter/material.dart';
import 'package:praca/view_main/menu_item.dart';

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
