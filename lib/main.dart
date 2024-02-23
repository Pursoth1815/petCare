import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_care/common/app_theme.dart';
import 'package:pet_care/pages/splash_screen/bloc/splash_bloc.dart';
import 'package:pet_care/pages/splash_screen/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lighThemeData,
        home: Splash(),
      ),
    );
  }
}
