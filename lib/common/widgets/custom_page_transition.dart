import 'package:flutter/material.dart';

class MyCustomAnimatedRoute extends PageRouteBuilder {
  final Widget route;

  MyCustomAnimatedRoute({required this.route})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => route,
          transitionDuration: Duration(milliseconds: 1500),
          reverseTransitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(alignment: Alignment(0.0, 0.59), scale: animation, child: child);
          },
        );
}
