import 'dart:io';


import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../config/Strings/strings.dart';
import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../home/controller/HomeController.dart';
import 'Component/action_button.dart';
import 'Component/app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static final controller=  Get.find<HomeController>();

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {




  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }






  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 77.h,
        title: const CustomeAppBar(),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: InkWell(
                onTap: () async {

                },
                child: Assets.icons.qus.svg(height: 24.h,)),
          ),
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: InkWell(
              onTap: () async {
                showMenu(
                  color: Theme.of(context).primaryColor,
                  context: context,
                  position: RelativeRect.fromLTRB(0.9.sw, 100, 50, 100),
                  items: [
                    PopupMenuItem<String>(
                      value: 'US',
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'US',
                            height: 32,
                            width: 32,
                            borderRadius: 8,
                          ),
                          SizedBox(width: 8,),
                          Text("Usa")
                        ],
                      ),
                      onTap: (){
                        context.locale=Locale('en', 'US');
                        Get.updateLocale(Locale('en', 'US'));
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'BD',
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'BD',
                            height: 32,
                            width: 32,
                            borderRadius: 8,
                          ),
                          SizedBox(width: 8,),
                          Text("Bangla")
                        ],
                      ),
                      onTap: (){
                        context.locale=Locale('bn', 'BD');
                        Get.updateLocale(Locale('bn', 'BD'));
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'ES',
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'ES',
                            height: 32,
                            width: 32,
                            borderRadius: 8,
                          ),
                          SizedBox(width: 8,),
                          Text("Spanish")
                        ],
                      ),
                      onTap: (){
                        context.locale=Locale('es', 'ES');
                        Get.updateLocale(Locale('es', 'ES'));
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'IN',
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'IN',
                            height: 32,
                            width: 32,
                            borderRadius: 8,
                          ),
                          SizedBox(width: 8,),
                          Text("Hindi")
                        ],
                      ),
                      onTap: (){
                        context.locale=Locale('hi', 'IN');
                        Get.updateLocale(Locale('hi', 'IN'));
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'SA',
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'SA',
                            height: 32,
                            width: 32,
                            borderRadius: 8,
                          ),
                          SizedBox(width: 8,),
                          Text("Arabic")
                        ],
                      ),
                      onTap: (){
                        context.locale=Locale('ar', 'SA');
                        Get.updateLocale(Locale('ar', 'SA'));
                      },
                    ),


                  ],
                  elevation: 8.0,

                );
              },
              child: Assets.icons.translate.svg(color: Color(0xFF5761F6)),),
          ),
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: InkWell(
              onTap: () async {
                // context.
                CartPage.controller.switchTheme();
                Get.changeThemeMode(CartPage.controller.currentTheme.value);
                // MediaQuery.of(context).platformBrightness == Brightness.light;

              },
              child: Icon(Theme.of(context).brightness==Brightness.dark?Icons.sunny:Icons.nightlight),),
          ),

        ],
      ),
      body: GetBuilder<HomeController>(
        assignId: true,
        builder: (controller) {
          return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.all(16),
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 15.h,),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20.h,),
                    ),


                    SliverToBoxAdapter(
                      child: SizedBox(height: 10.h,),
                    ),
                    SliverToBoxAdapter(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.popularResult.length,
                            itemBuilder: (context, index) => ActionButton(
                                        title: controller.popularResult[index]))
                    ),
                    SliverToBoxAdapter(
                        child: ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Container(width: 1.0.sw,
                              height: 40.h,
                              decoration: BoxDecoration(),
                              child: Center(
                                  child: Text(tr(Strings.Version)+" 1.0.0",
                                    style: mediumText(13.sp, color: Color(0xFF919ABD)),)),
                            )
                        )
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 10.h,),
                    ),

                    SliverToBoxAdapter(
                      child: SizedBox(height: 40.h,),
                    )
                  ],
                ),
              )
          );
        },
      ),
    );
  }
}
