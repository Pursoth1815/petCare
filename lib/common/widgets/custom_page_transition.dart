import 'package:flutter/material.dart';

class MyCustomAnimatedRoute extends PageRouteBuilder {
  final Widget route;

  MyCustomAnimatedRoute({required this.route})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => route,
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(alignment: Alignment(0.0, 0.59), scale: animation, child: child);
          },
        );
}
