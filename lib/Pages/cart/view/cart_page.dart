import 'package:e_commerce_app/Pages/cart/widget/cart_app_bar.dart';
import 'package:e_commerce_app/Widget/custom_page_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_provider.dart';
import '../widget/bottom_check_out.dart';
import '../widget/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key,});
final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty? const Scaffold(
      body: CustomEmpty(
        imagePath: 'assets/images/empty_cart.png',
        label: 'Your cart is empty',
        title: 'Add something to make me happy ☺️',
        buttonText: 'Shop Now',
      ) ,
    ):
    Scaffold(
      appBar: const CartAppBar(),

        bottomSheet: const CartBottomCheckOut(),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.getCartItems.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: cartProvider.getCartItems.values.toList().reversed.toList()[index],
                  child: const CartItem(),
                );
              },
            ),
          ),
          const SizedBox(
            height: kBottomNavigationBarHeight + 10,
          )

        ],
      )


    );
  }
}