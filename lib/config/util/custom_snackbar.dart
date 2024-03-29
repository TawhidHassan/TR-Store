
import 'package:TrStore/FeaturesModule/cart/controller/CartController.dart';
import 'package:TrStore/FeaturesModule/home/controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'dimensions.dart';


class CustomSnackBar {
  static success(String message) {
    return Get.snackbar(
      'Success',
      message,
      overlayColor: Colors.green,
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: Dimensions.heightSize * 2.6,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
    );
  }

  static error(String message) {
    return Get.snackbar(
      'Alert',
      message,
      icon: Icon(
        Icons.error,
        color: Colors.redAccent,
        size: Dimensions.heightSize * 2.6,
      ),
      margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
