import 'package:e_commerce_app/Constant/Colors.dart';
import 'package:e_commerce_app/Pages/auth/view/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreenView(
        navigateRoute: LoginPage(),
        duration: 5000,
        imageSize:300,
        imageSrc: "assets/images/logo.png",

        backgroundColor: kColor,

      ),
    );
  }
}
