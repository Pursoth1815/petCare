import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/colors.dart';

class AppTheme {
  static ThemeData lighThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.white),
      titleMedium: TextStyle(color: AppColors.white),
      labelLarge: TextStyle(color: AppColors.colorPrimaryDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        animationDuration: Duration(milliseconds: 500),
        elevation: MaterialStateProperty.all(3),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
        backgroundColor: MaterialStateProperty.all(AppColors.white),
      ),
    ),
  );
}
