import 'package:TrStore/data/model/Product/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../config/color/custom_color.dart';
import '../../../../config/util/text_style.dart';



class ProductCard extends StatelessWidget {
  final Color? iconColor;
  final Product? product;

  const ProductCard({Key? key,  this.iconColor, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  width: 1.0.sw,
                  padding: const EdgeInsets.only(top: 12,left: 0,right: 0),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: product!.thumbnail??"",
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product!.title??"",
                                  style: mediumText(16.sp,color: Theme.of(context).textTheme.bodyMedium!.color!),
                                ),
                                SizedBox(height: 4.h,),
                                Chip(
                                  label: Text(
                                    product!.category??"",
                                    style: regularText(12.sp,color: Theme.of(context).textTheme.bodyLarge!.color!),
                                  ),
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
                      )
                    ],
                  ),
                )
            )
          ],
        ),
        SizedBox(height: 8,),
        Divider(height: 1.0,color: Theme.of(context).brightness==Brightness.dark?CustomColor.primaryColor:CustomColor.textFieldBorder,thickness: 1,),
      ],
    );
  }
}
