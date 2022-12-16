import 'package:flutter/material.dart';

final themeNotice = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
  ),
);