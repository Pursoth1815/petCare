import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_care/common/app_theme.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/pages/splash_screen/bloc/splash_bloc.dart';
import 'package:pet_care/pages/splash_screen/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Screenwidth initialize
    AppConstants.init(context);

    return BlocProvider(
      create: (context) => SplashBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lighThemeData,
        home: Splash(),
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          );
        },
      ),
    );
  }
}
