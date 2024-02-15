import 'dart:io';

import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget implements PreferredSizeWidget {

  static const String routeName = '/auth_header';
  final double height;

  OnboardingHeader({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid?
    Container(
      height: 50,
      decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff87517),Colors.transparent ],
            stops: [5.5,.9 ],
            begin: Alignment(1.0,-1.5),
            end: Alignment(.2,5.0),
            // transform: GradientRotation(math.pi)
          )
      ),
    )
        :
    Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(1.5,-7.5),
            end: Alignment(.2,6.5),
          stops: [0.8,.10 ],
          colors:[Color(0xfff87517),Colors.transparent ],// red to yellow
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
    );




  }
}

