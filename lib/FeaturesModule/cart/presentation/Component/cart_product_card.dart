import 'package:TrStore/FeaturesModule/cart/controller/CartController.dart';
import 'package:TrStore/data/Local/ProductLocal.dart';
import 'package:TrStore/data/model/Product/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../Widgets/Simmer/custom_simmer.dart';
import '../../../../config/color/custom_color.dart';
import '../../../../config/util/text_style.dart';
import '../../../../routes/route_path.dart';



class CartProductCard extends StatelessWidget {
  final Color? iconColor;
  final ProductLocal? product;

  const CartProductCard({Key? key,  this.iconColor, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Theme.of(context).brightness==Brightness.dark?CustomColor.primaryColor:CustomColor.textFieldBorder,
        )
      ),
      width: 1.0.sw,
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: CachedNetworkImage(
              imageUrl: product!.image??"",
              imageBuilder: (context, imageProvider) => Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6)),

                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) => CustomeSimmer(height: 100,width: 120,radius: 8,),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
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
                          product!.title!.length>8?product!.title!.substring(8)+"..":product!.title!,
                          style: mediumText(12.sp,color: Theme.of(context).textTheme.bodyMedium!.color!),
                        ),
                        SizedBox(height: 4.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price: ${product!.userId}\$",
                              style: mediumText(12.sp,color: Theme.of(context).textTheme.bodyMedium!.color!),
                            ),

                            InkWell(
                                onTap: (){
                                  Get.find<CartController>().deleteProduct(id: product!.id!);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Product successfully added to cart"),
                                    duration: Duration(milliseconds: 3000),
                                  ));

                                  },
                                child: Icon(Icons.delete))
                          ],
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
