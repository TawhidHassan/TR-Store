import 'dart:developer';
import 'dart:io';
import 'package:TrStore/data/model/Product/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Service/local_storage/local_storage.dart';
import '../Repository/home_repository.dart';

class HomeController extends GetxController implements GetxService{
  final HomeRepository? homeRepository;

  HomeController({this.homeRepository});



  final selectedShopImage = "".obs;
 // Rx<LocationModel?>  location=Rx<LocationModel?>(null);




  final dataLoad = false.obs;
  final detailDataLoad = false.obs;
  RxList<Product>? productList=RxList<Product>();
  Rx<Product?> product = Rx<Product?>(null);



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

 @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  // function to switch between themes
  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    LocalStorage.saveAppTheme(themeMode: currentTheme.value);
    //


  }

  void getProducts() {
    dataLoad.value=true;
    homeRepository!.getProducts().then((value) {
      dataLoad.value=false;
      if(value!=null){
        productList!.value = (value as List)
            .map((item) => Product.fromJson(item))
            .toList();
      }
    });
  }

  void getProductsDetails(int? id) {
    detailDataLoad.value=true;
    homeRepository!.getProductsDetails(id).then((value) {
      detailDataLoad.value=false;
      if(value!=null){
        product.value = Product.fromJson(value);
      }
    });
  }



}