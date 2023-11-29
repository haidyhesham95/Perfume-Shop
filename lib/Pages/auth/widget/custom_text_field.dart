import 'package:e_commerce_app/Constant/Colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
const CustomTextField({super.key,
  required this.hintText,
  required this.prefixIcon,
  required this.keyboardType,
  this.controller,
  this.onSubmitted,
  this.suffixIcon, this.onChanged
});
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
final Function(String)? onChanged;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(

      onChanged: onChanged,
      onSubmitted: onSubmitted,
      controller:controller ,
      keyboardType:keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
       fillColor: Colors.grey.withOpacity(0.1),
        focusedBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: kColor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: kColor,
              width:1.5,
            )
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(20),
      ),
    );

  }
}