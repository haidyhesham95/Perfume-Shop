import 'package:e_commerce_app/Constant/Colors.dart';
import 'package:e_commerce_app/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppNameText extends StatelessWidget {
  const AppNameText({super.key, });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period:const Duration(seconds: 10),
      baseColor:Colors.white ,
      highlightColor:kPink,
      child:const CustomText(
        label: 'Perfume Shop',
        textAlign: TextAlign.center,
      ),
    );
  }
}
