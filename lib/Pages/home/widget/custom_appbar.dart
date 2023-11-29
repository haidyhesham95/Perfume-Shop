import 'package:flutter/material.dart';
import '../../../Constant/Colors.dart';
import '../../../widget/app_name_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar ({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kColor,
      title: const AppNameText(),
      leading: Image.asset(
        'assets/images/logo.png',

      ),
    );
  }
}
