import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.25,
              width: size.width * 0.25,
             imageUrl:'https://tse4.mm.bing.net/th?id=OIP.JaqzqJg1p99t481I8jRjzwHaHZ&pid=Api&P=0&h=180' ,

            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Flexible(
                        child: Text('perfume',style: Styles.textStyle20,),
                      ),
                      IconButton(
                          onPressed: () {},
                        icon: Icon(Icons.close,color: kColor,
                        ),),
                    ],
                  ),
                   Row(
                    children: [
                     Text('Price:',style: Styles.textStyle18,),
                      SizedBox(width: 5,),
                      Flexible(
                        child: Text('16\$',style:Styles.textStyle15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Qty:6',style: Styles.textStyle15,),

                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
