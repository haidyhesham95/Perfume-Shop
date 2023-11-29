import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/Constant/Colors.dart';
import 'package:e_commerce_app/Pages/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'cart/model/cart_provider.dart';
import 'cart/view/cart_page.dart';
import 'home/view/home_page.dart';
import 'search/view/search_page.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List Screens = const  [
    HomePage(),
    SearchPage(),
    CartPage(),
   ProfilePage(),
  ];
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          index:_page,
          height: 55.0,
          items:  [
             const Icon(IconlyBroken.home, size: 28),
            const Icon(IconlyBroken.search, size: 28,),
            Badge(
              backgroundColor:kPink ,
              label: Text(cartProvider.getCartItems.length.toString()),
                child: const Icon(IconlyBroken.bag_2, size: 28)),
            const Icon(IconlyBroken.profile, size: 28),
          ],
          color:kColor ,
          buttonBackgroundColor:kPink ,
          backgroundColor:Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration:const Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _page=index;

            });
          },
        ),
        body: Screens[_page],
      ),
    );
  }
}
