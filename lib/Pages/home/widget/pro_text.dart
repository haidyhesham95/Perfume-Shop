import 'package:flutter/material.dart';
import '../../../Constant/Styles.dart';

class ProText extends StatelessWidget {
  const ProText({super.key});

  @override
  Widget build(BuildContext context) {
    // return  Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     height: size.height*0.05,
    //     width: size.width*0.35,
    //     decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(15)),
    //       color: kColor,
    //     ),
    //     alignment: Alignment.center,
    //     child: Text('Products:',style: Styles.textStyle25,),),
    // );
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Products:-',
        style: Styles.textStyle25,


      ),
    );
  }
}
