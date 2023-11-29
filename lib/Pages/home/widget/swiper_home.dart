import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/const.dart';
class SwiperHome extends StatelessWidget {
  const SwiperHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.24,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12) ),
        child: Swiper(
          itemBuilder: (BuildContext context, int index)
          {
            return Image.asset(
              PhotoSwiper.SwiperImages[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: PhotoSwiper.SwiperImages.length,
          pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color:Colors.white,
                activeColor: kColor,
              )
          ),

        ),
      ),
    );
  }
}
