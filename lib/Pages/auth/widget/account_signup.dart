import 'package:e_commerce_app/Pages/auth/view/register/register_page.dart';
import 'package:flutter/material.dart';

import '../../../Constant/Styles.dart';

class AccountSignUp extends StatelessWidget {
  const AccountSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\`t have an account ?',style: Styles.textStyle18,),
        const SizedBox( width: 10, ),
        GestureDetector(
            onTap:() {
              Navigator.of(context).pushNamed("register");

    },
            child: const Text('Sign Up',
              style:Styles.textStyle5,))
      ],
    );
  }
}
