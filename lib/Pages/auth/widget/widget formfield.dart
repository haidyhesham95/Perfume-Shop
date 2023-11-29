import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';

class WidgetFormField extends StatelessWidget {
  const WidgetFormField({super.key,  this.textInputAction, this.keyboardType, this.prefixIcon, this.suffixIcon, required this.obscureText, this.onPressed, this.hintText, this.controller, this.validator});
final String? Function(String?)? validator;
 final String? hintText;
final TextInputAction? textInputAction;
final TextInputType? keyboardType;
final TextEditingController? controller;
final bool obscureText ;
final Widget? prefixIcon;
final Widget? suffixIcon;
 final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.5),
        hintText: hintText,

        labelStyle: const TextStyle(
          color: kColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        contentPadding:  const EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(12),
          borderSide: const BorderSide(
            color:kColor,
            width: 1.5,
          ),
        ),
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(12),
          borderSide: const BorderSide(
            color:kColor,
            width: 1.5,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(12),
          borderSide: const BorderSide(
            color:kColor ,
            width: 1.5,
          ),

        ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(12),
            borderSide: const BorderSide(
              color:kColor ,
              width: 1.5,
            ),
          ),
        errorBorder:OutlineInputBorder(
          borderRadius:  BorderRadius.circular(12),
          borderSide: const BorderSide(
            color:Colors.red ,
            width: 1.5,
          ),
        )

      ),
    );
  }
}
