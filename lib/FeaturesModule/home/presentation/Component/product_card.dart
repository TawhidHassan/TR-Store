import 'package:TrStore/FeaturesModule/cart/controller/CartController.dart';
import 'package:TrStore/data/model/Product/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../Widgets/Simmer/custom_simmer.dart';
import '../../../../config/color/custom_color.dart';
import '../../../../config/util/text_style.dart';
import '../../../../routes/route_path.dart';



class ProductCard extends StatelessWidget {
  final Color? iconColor;
  final Product? product;

  ProductCard({Key? key,  this.iconColor, this.product}) : super(key: key);
 var controller= Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.ProductDetailsPage,extra: product!);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Theme.of(context).brightness==Brightness.dark?CustomColor.primaryColor:CustomColor.textFieldBorder,
          )
        ),
        width: 1.0.sw,
        margin: EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.only(top: 0,left: 0,right: 0,bottom: 12),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: product!.image??"",
              imageBuilder: (context, imageProvider) => Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6)),
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) => CustomeSimmer(height: 150,width: 120,radius: 8,),
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
                          product!.title??"",
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

                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Text(
                          product!.publishedAt??"",
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
      ),
    );
  }
}
