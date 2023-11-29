import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';

class VisibilityIcon extends StatelessWidget {
  const VisibilityIcon({super.key, this.onTap, required this.visible});
final void Function()? onTap;
final bool visible ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Visibility(
        visible: visible,
        replacement: const Icon(
          Icons.visibility_off,
          color: kColor,
        ),
        child: const Icon(
          Icons.visibility,
          color: kColor,
        ),
      ),
    );
  }
}
