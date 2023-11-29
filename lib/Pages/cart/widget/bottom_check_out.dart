import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';
import '../../home/Product/product_provider.dart';
import '../model/cart_provider.dart';

class CartBottomCheckOut extends StatelessWidget {
  const CartBottomCheckOut({super.key});
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(width: 0.5, color: Colors.black26),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 125,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: Text(
                            "Total (${cartProvider.getCartItems
                                .length} products/${cartProvider
                                .getQty()} Items)",style: Styles.textStyle20,)),
                    Text(
                      "${cartProvider.getTotal(
                          productProvider: productProvider)}\$",
                      style: Styles.textStyle15,


                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    elevation: 3
                ),
                onPressed: (){

                },
                child: Text("Checkout",
                  style: Styles.textStyle20.copyWith(color: kColor),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
