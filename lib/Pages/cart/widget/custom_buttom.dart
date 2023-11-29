import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.backgroundColor, required this.data, this.style, });
final MaterialStateProperty<Color?>? backgroundColor;
final String data;
final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:backgroundColor,
        padding: MaterialStateProperty.all(const EdgeInsets.all(20),),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(30) ),),
      ),
      child: Text(
       data,
        style: style,
      ),
    );
  }
}
