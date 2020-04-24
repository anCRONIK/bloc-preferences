import 'package:flutter/material.dart';

/// Application light theme
ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xff1f655d),
    accentColor: const Color(0xff40bf7a),
    dividerColor: const Color(0xff1f655d),
    appBarTheme: AppBarTheme(color: Colors.blue));

/// Application dark theme
ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color(0xfff5f5f5),
    accentColor: const Color(0xff40bf7a),
    dividerColor: const Color(0xff1f655d),
    appBarTheme: AppBarTheme(color: const Color(0xff1f655d), actionsIconTheme: IconThemeData(color: Colors.white)));
