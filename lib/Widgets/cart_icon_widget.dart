
import 'package:TrStore/FeaturesModule/cart/controller/CartController.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import '../config/util/text_style.dart';
import '../routes/route_path.dart';

class CartIconCount extends StatelessWidget {
  final double? padidng;
  final double? top;
  final double? start;


  const CartIconCount(
      {Key? key, this.padidng = 7, this.top = -2, this.start = 15,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().onInit();
    return GetBuilder<CartController>(
      builder: (controller) {
        return Obx(() {
          return Container(
            width: 33,
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.symmetric(vertical: 6),
            child:
            badges.Badge(
              stackFit: StackFit.passthrough,
              badgeContent: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(controller.productList!.value.length.toString(),
                  style: boldText(10, color: Colors.white),),
              ),
              position: BadgePosition.custom(top: top, start: start),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Color(0xFFB3261E),
                padding: EdgeInsets.all(padidng!),
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.white, width: 2.5),
                // badgeGradient: badges.BadgeGradient.linear(
                //   colors: [Colors.blue, Colors.yellow],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                elevation: 0,
              ),
              child: InkWell(
                onTap: () {
                  context.pushNamed(Routes.CartPage);
                },
                child: Icon(Icons.shopping_cart),
              ),
            )
          );
        });
      },
    );
  }
}
