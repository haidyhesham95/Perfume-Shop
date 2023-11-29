import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';
import '../../../Widget/custom_text.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kColor,
                border: Border.all(color: kColor, width: 3),
                image:const DecorationImage(
                  image: AssetImage('assets/images/profile.gif'),
                )),
          ),
          const SizedBox(width: 10),
           const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Haidy hesham',
                style:Styles.textStyle22,
              ),
              CustomText(label: 'hh7234699@gmail.com'),

            ],
          ),
        ],
      ),
    );
  }
}
