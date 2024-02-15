import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Cart Page"),
      ),
      body: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          padding: EdgeInsets.all(16),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 15.h,),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20.h,),
                ),


                SliverToBoxAdapter(
                  child: SizedBox(height: 10.h,),
                ),
              ],
            ),
          )
      ),
    );
  }
}

