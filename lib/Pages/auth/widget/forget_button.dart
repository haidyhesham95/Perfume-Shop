import 'package:flutter/material.dart';

import '../../../Constant/Styles.dart';
import '../view/forget_password/forget_password_page.dart';

class ForgetButton extends StatelessWidget {
  const ForgetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgetPasswordPage(),
                ),
              );
            },
            child: const Text(
              'forget your password ?',
              style: Styles.textStyle5,
            )));
  }
}
