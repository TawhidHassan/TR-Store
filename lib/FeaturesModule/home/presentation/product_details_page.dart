import 'dart:io';


import 'package:TrStore/data/model/Product/Product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import '../../../config/color/custom_color.dart';
import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../routes/route_path.dart';
import '../../cart/controller/CartController.dart';
import '../controller/HomeController.dart';
import 'Component/app_bar.dart';
import 'Component/product_card.dart';


class ProductDetailsPage extends StatelessWidget {
  final Product? product;
  const ProductDetailsPage({super.key, this.product});

  static final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.getProductsDetails(product!.id);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(product!.title??""),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: InkWell(
              onTap: () async {
                // context.
                // context.goNamed(Routes.CartPage);
                context.pushNamed(Routes.CartPage);
              },
              child: Icon(Icons.shopping_cart)),
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
                child: controller.detailDataLoad.value ?
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
                        child: Container(
                          width: 1.0.sw,
                          margin: EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.only(top: 12,left: 0,right: 0,bottom: 12),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.product.value!.thumbnail??"",
                                imageBuilder: (context, imageProvider) => Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                                  ),
                                ),
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 8.h,),
                                          Text(
                                            controller.product.value!.title??"",
                                            style: mediumText(16.sp,color: Theme.of(context).textTheme.bodyMedium!.color!),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Chip(
                                                label: Text(
                                                  product!.category??"",
                                                  style: regularText(12.sp,color: Theme.of(context).textTheme.bodyLarge!.color!),
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: (){
                                                    Get.find<CartController>().saveProduct(id: product!.id!,image: product!.image!,title: product!.title!,userId:product!.userId!);
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                      content: Text("Product successfully added to cart"),
                                                      duration: Duration(milliseconds: 3000),
                                                    ));
                                                  },
                                                  child: Icon(Icons.add_shopping_cart_outlined))
                                            ],
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            "Price: ${controller.product.value!.userId}\$",
                                            style: regularText(14.sp,color: Colors.orange),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            controller.product.value!.content??"",
                                            style: regularText(12.sp,color: Theme.of(context).textTheme.bodyLarge!.color!),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            controller.product.value!.publishedAt??"",
                                            style: regularText(10.sp,color: Theme.of(context).textTheme.bodySmall!.color!),
                                          ),
                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              )
                            ],
                          ),
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

