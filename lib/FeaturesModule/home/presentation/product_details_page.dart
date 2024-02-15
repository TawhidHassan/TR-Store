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
import '../../../Widgets/Button/custom_button.dart';
import '../../../Widgets/Simmer/custom_simmer.dart';
import '../../../Widgets/cart_icon_widget.dart';
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
   ProductDetailsPage({super.key, this.product});

  static final controller = Get.find<HomeController>();
  var cartController= Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    controller.getProductsDetails(context,product!.id);
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
                  context.pushNamed(Routes.CartPage);
                },
                child:CartIconCount(top: -16,start: 16,)),
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
                 const CustomScrollView(
                  slivers: [
                  SliverToBoxAdapter(
                   child: Column(
                     children: [
                       CustomeSimmer(height: 120,width: 120,radius: 8,),
                       SizedBox(height: 12,),
                       CustomeSimmer(height: 10,width: 120,radius: 8,),
                       SizedBox(height: 4,),
                       CustomeSimmer(height: 12,width: 10,radius: 8,),
                       SizedBox(height: 4,),
                       CustomeSimmer(height: 200,width: 10,radius: 8,),
                       SizedBox(height: 4,),
                       CustomeSimmer(height: 400,width: 10,radius: 8,),

                     ],
                   )
                    ),
                  ]
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
                                placeholder: (context, url) => CustomeSimmer(height: 120,width: 120,radius: 8,),
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

                                              cartController.checkProductExist(product!.id!)
                                                  ?
                                              SizedBox()
                                                  :
                                              CustomButton(
                                                onTap: (){
                                                  cartController.saveProduct(id: product!.id!,image: product!.image!,title: product!.title!,userId:product!.userId!);
                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                    content: Text("Product successfully added to cart"),
                                                    duration: Duration(milliseconds: 3000),
                                                  ));
                                                },
                                                title: "Add To Cart",
                                                color: Colors.orange,
                                                height: 42,
                                                width:85.w,
                                                textSize: 12,
                                                textColor: CustomColor.kPrimaryColorx,
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            "Price: ${controller.product.value!.userId}\$",
                                            style: regularText(16.sp,color: Colors.orange),
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

