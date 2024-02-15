import 'package:flutter/material.dart';

import '../../config/color/custom_color.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:CustomColor.kPrimaryColorx,
      ),

    );
  }
}
