import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.label, this.textAlign, });
final String label;
final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return  Text(
      label,
      textAlign: textAlign,
      style: const TextStyle(
          fontFamily: 'Courgette',
          fontWeight: FontWeight.w500,

      ),
    );
  }
}
