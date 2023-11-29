import 'package:flutter/material.dart';

import '../../../Constant/Styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.data, this.onPressed});
final String data;
final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white70,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      child:  SizedBox(
        height: size.height*0.07,
        width: size.width*0.6,
        child: Center(
          child: Text(
              data,
              style: Styles.textStyle21
          ),
        ),
      ),
    );
  }
}
