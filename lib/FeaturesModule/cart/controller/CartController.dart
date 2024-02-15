import 'dart:developer';
import 'dart:io';
import 'package:TrStore/config/util/logger.dart';
import 'package:TrStore/data/Local/ProductLocal.dart';
import 'package:TrStore/data/model/Product/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:logger/logger.dart';
import '../../../Service/local_storage/database_manager.dart';

class CartController extends GetxController implements GetxService{

  CartController();



  final selectedShopImage = "".obs;
  // Rx<LocationModel?>  location=Rx<LocationModel?>(null);




  final dataLoad = false.obs;
  final detailDataLoad = false.obs;
  RxList<ProductLocal>? productList=RxList<ProductLocal>();
  Rx<Product?> product = Rx<Product?>(null);



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  @override
  void onInit() {
    // TODO: implement onInit

    var dbHelper = DBHelper();
    dbHelper.fetchAllProducts().then((value){
      Logger().i(value!.length);
      productList!.value=value;
    });
    super.onInit();
  }




  void saveProduct({int? id, userId, String? title, image}) {
    dataLoad.value=true;
    var dbHelper = DBHelper();
    dbHelper.addProduct(ProductLocal(
            userId: userId,
            title: title,
            image:image ,
            id: id
        )
    );    // _showSnackBar("Data saved successfully");
  }

  void deleteProduct({int? id}) {
    dataLoad.value=true;
    var dbHelper = DBHelper();
    dbHelper.deleteProduct(id!);
    dbHelper.fetchAllProducts().then((value){
      Logger().i(value!.length);
      productList!.value=value;
    });// _showSnackBar("Data saved successfully");
  }





}