import 'dart:io';


import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../custom_assets/assets.gen.dart';
import '../controller/HomeController.dart';
import 'Component/app_bar.dart';
import 'Component/product_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.getProducts();
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
                showMenu(
                  color: Theme
                      .of(context)
                      .primaryColor,
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
                      onTap: () {
                        context.locale = Locale('en', 'US');
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
                      onTap: () {
                        context.locale = Locale('bn', 'BD');
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
                      onTap: () {
                        context.locale = Locale('es', 'ES');
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
                      onTap: () {
                        context.locale = Locale('hi', 'IN');
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
                      onTap: () {
                        context.locale = Locale('ar', 'SA');
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
                HomePage.controller.switchTheme();
                Get.changeThemeMode(HomePage.controller.currentTheme.value);
                // MediaQuery.of(context).platformBrightness == Brightness.light;

              },
              child: Icon(Theme
                  .of(context)
                  .brightness == Brightness.dark ? Icons.sunny : Icons
                  .nightlight),),
          ),

        ],
      ),
      body: GetBuilder<HomeController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: EdgeInsets.all(16),
                child: controller.dataLoad.value ?
                const SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 50.0,
                )
                    :
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 15.h,),
                    ),
                    SliverToBoxAdapter(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.productList!.value.length,
                            itemBuilder: (context, index) =>
                                ProductCard(
                                  product: controller.productList!.value[index],
                                )
                        )
                    ),
                  ],
                )
            );
          });
        },
      ),
    );
  }
}

