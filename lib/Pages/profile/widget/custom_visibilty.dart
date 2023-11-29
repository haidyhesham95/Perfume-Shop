import 'package:e_commerce_app/Constant/Styles.dart';
import 'package:flutter/material.dart';

class CustomVisibilty extends StatelessWidget {
  const CustomVisibilty({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Visibility(
      visible: false,
      child: Padding(
        padding:  EdgeInsets.all(20),
        child: Text(
          'Please login to have ultimate access',
          style: Styles.textStyle22,
        ),
      ),
    );
  }
}
