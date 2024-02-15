import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/color/custom_color.dart';
import '../../../../config/util/text_style.dart';



class ActionButton extends StatelessWidget {
  final Color? iconColor;
  final String? title;
  final String? date;
  final String? svg;
  const ActionButton({Key? key, this.title, this.svg, this.iconColor, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  width: 1.0.sw,
                  padding: const EdgeInsets.only(top: 12,left: 16,right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title!,
                              style: mediumText(14.sp,color: Theme.of(context).textTheme.bodySmall!.color!),
                            ),
                            SizedBox(height: 4.h,),
                            Text(
                              date??"",
                              style: regularText(10.sp,color: Theme.of(context).textTheme.bodyMedium!.color!),
                            ),
                          ],
                        ),
                      ),

                     Expanded(
                         flex: 1,
                         child:  Icon(Icons.arrow_forward_ios_outlined,size: 14.sp,color: Color(0XFF514888),))

                    ],
                  ),
                )
            )
          ],
        ),
        Divider(height: 1.0,color: Theme.of(context).brightness==Brightness.dark?CustomColor.primaryColor:CustomColor.textFieldBorder,thickness: 1,),
      ],
    );
  }
}
