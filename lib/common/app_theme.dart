import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lighThemeData = ThemeData(
    primaryColor: Colors.teal,
    appBarTheme: const AppBarTheme(color: Colors.teal),
    brightness: Brightness.light,
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
    ),
  );
}
