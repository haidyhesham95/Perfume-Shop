import 'package:e_commerce_app/Constant/Styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.imagePath, required this.text, required this.onTap});
final String imagePath,text;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap;
      },
      leading: Image.asset(imagePath,height: 30,),
      title: Text(
        text,
        style:Styles.textStyle22,
      ),
      trailing:const Icon(IconlyLight.arrow_right_2),

    );
  }
}
