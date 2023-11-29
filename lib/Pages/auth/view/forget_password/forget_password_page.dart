import 'package:e_commerce_app/Constant/Styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../Constant/Colors.dart';

import '../../../home/widget/custom_appbar.dart';
import '../../widget/custom_button.dart';
import '../../widget/widget formfield.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar:const CustomAppBar(),
      body: Stack(
        children:[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
               kColor,
                  kPink,
                ],

              ),
            ),
          ),


          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
                Image.asset('assets/images/password.png',
                  height: size.height*0.4,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Text('Forget Password',style: Styles.textStyle22,),
                const Text('Please enter your email address you \`d like your password reset information sent to',
                  style: TextStyle(fontSize: 15,fontFamily: 'Courgette'),),
                const SizedBox(height: 20,),
                const WidgetFormField(
                  hintText: '***@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icon(IconlyLight.message,color: kColor,),
                  obscureText: false,
                ),
                const SizedBox(height: 50,),

                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    onPressed: (){},
                    data: 'Submit',

                  ),
                ),
              ],
            ),
          ),
        ),
    ],
      ),


    );
  }
}
