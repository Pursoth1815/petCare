import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    // Initialize screenWidth using MediaQuery
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
