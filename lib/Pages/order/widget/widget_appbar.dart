import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar({super.key, required this.data});
final String data;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: kColor,
      leading: Image.asset('assets/images/logo.png'),
      title:Text(
        data,
        style: Styles.textStyle22,
      ) ,
    );
  }
}
