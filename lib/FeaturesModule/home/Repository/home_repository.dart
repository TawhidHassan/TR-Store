import 'dart:io';


import 'package:TrStore/data/model/Product/ProductResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../../config/Strings/api_endpoint.dart';
import '../../../network/api_services.dart';


class HomeRepository{

  final ApiMethod apiMethod;
  HomeRepository({required this.apiMethod});


  Future getCheck()async{
    apiMethod.get(url: ApiEndpoint.categoryUrl,isBasic: true,showResult: true);
    // apiClient.getData(uri: "target/last-sevenday-data",headers: {"xxx":"xxxx"});
  }


  Future getProducts(BuildContext context) async{

    final userRaw =await apiMethod.get(context:context ,duration:200 ,url: ApiEndpoint.GET_ALL_PRODUCTS,isBasic: true,showResult: true);
    // Logger().d(userRaw);
    return userRaw;
  }

  Future getProductsDetails(BuildContext context,int? id) async{

    final userRaw =await apiMethod.get(duration:200 ,url: ApiEndpoint.GET_ALL_PRODUCTS+"/${id}",isBasic: true,showResult: true);
    // Logger().d(userRaw);
    return userRaw;
  }








  // Future<LoginResponse>  deleteAccount() async{
  //   Map<String, String> data = {
  //
  //   };
  //   final userRaw=await  getIt<ApiClient>().deleteData(uri: "user/v1",);
  //
  //   return LoginResponse.fromJson(userRaw);
  // }





}