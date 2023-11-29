import 'package:flutter/material.dart';
import '../../../Constant/Styles.dart';



class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, this.onPressed});
final  void Function()?onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
            onPressed: onPressed,
            child: const Text('Sign In With Google',
              style: Styles.textStyle21,)),
        const SizedBox(width: 10,),
        Image.asset('assets/images/google.png',height: 30,),
      ],
    );
  }
}
