import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/util/text_style.dart';


class ChoiceChatButton extends StatelessWidget {
  final String? title;
  final String? icon;
  final String? description;
  const ChoiceChatButton({Key? key, this.title, this.icon, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).primaryColor)
      ),
      height: 110.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon!,height: 16.h,width: 16.w,),
              SizedBox(width: 8.w,),
              Text(title!,style: boldText(13.sp,color: Theme.of(context).textTheme.bodyMedium!.color!),).tr()
            ],
          ),
          SizedBox(height: 7.h,),
          Text(description!,style: boldText(10.sp,color: Theme.of(context).textTheme.bodySmall!.color!),).tr()
        ],
      ),
    );
  }
}
