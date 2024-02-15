import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class CustomeSimmer extends StatelessWidget {
  final double? height,width,marging,radius;
  const CustomeSimmer({Key? key, this.height=100, this.width=100,this.marging, this.radius=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey.shade100.withOpacity(0.48),
      highlightColor: Colors.blueGrey.shade300.withOpacity(0.48),
      direction: ShimmerDirection.ltr,
      enabled: true,
      period: Duration(seconds: 4),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4,horizontal:marging==null?0: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: Colors.grey,
        ),
        height: height,
        width: 1.0.sw,
      ),
    );
  }
}
