import 'dart:io';
import 'package:TrStore/FeaturesModule/cart/controller/CartController.dart';
import 'package:TrStore/Widgets/EmptyCard/empty_widget.dart';
import 'package:TrStore/config/Strings/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../home/presentation/Component/product_card.dart';
import 'Component/cart_product_card.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().onInit();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  const Text(Strings.CartPage).tr(),
      ),
      body: GetBuilder<CartController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: EdgeInsets.all(16),
                child:controller.productList!.value.isEmpty?EmptyWidget(): CustomScrollView(
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
                                CartProductCard(
                                  product: controller.productList!
                                      .value[index],
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

