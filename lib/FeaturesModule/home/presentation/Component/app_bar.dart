import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/Strings/strings.dart';
import '../../../../config/util/text_style.dart';
import '../../../../custom_assets/assets.gen.dart';


class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      padding: const EdgeInsets.only(top: 12,),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              context.pushNamed("news", pathParameters: {
                "id": "dwirandyh",
                "path": "flutter-deeplink-example"
              });
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColor,
              child: Assets.icons.user.image(),
            ),
          ),
          SizedBox(width: 14.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Strings.hiThere.tr(),style: boldText(15.sp,color:Theme.of(context).textTheme.bodyMedium!.color!)),
              SizedBox(height: 5.h,),
              Text(Strings.welcomeAppName.tr(),style: mediumText(12.sp,color:Theme.of(context).textTheme.bodyMedium!.color!))
            ],
          )

        ],
      ),
    );
  }
}
