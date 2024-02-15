//! HERE IS THE FADE ANIMATION USED THROUGHOUT THE APPLICATION
//! IT'S CUSTOM TWEAKED TO MEET MY REQUIREMENTS / NEEDS.
//! THE LIBRARY ARE LEGACY LIBRARIES, BUT I'M USING THEM ANYWAYS

import 'package:flutter/material.dart';

class AppFadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const AppFadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: child,
    );
  }
}
