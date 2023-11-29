import 'package:e_commerce_app/Constant/Colors.dart';
import 'package:e_commerce_app/Constant/Styles.dart';
import 'package:e_commerce_app/Pages/home/widget/heart_button_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../home/Product/product_provider.dart';
import '../model/cart_model.dart';
import '../model/cart_provider.dart';
import 'qty_sheet.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});
  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.findByProdId(cartModelProvider.productId);
    final cartProvider = Provider.of<CartProvider>(context);

    Size size =MediaQuery.of(context).size;
    return getCurrProduct == null
        ? const SizedBox.shrink():FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
           ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              imageUrl:getCurrProduct.productImage,
              height: size.height*0.2,
              width: size.height*0.2,
            ),
          ),
              const SizedBox(height: 10,),
              const SizedBox(width: 10,),
              IntrinsicWidth(
                child: Column(
                  children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width*0.6,
                        child: Text(getCurrProduct.productTitle,style: Styles.textStyle20,),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              cartProvider.removeOneItem(
                                productId: getCurrProduct.productId,
                              );
                            },
                              icon: const Icon(Icons.close,color: kColor,
                              ),
                          ),
                           HeartButtonWidget(productId: getCurrProduct.productId),
                        ],
                      ),

                    ],
                  ),
                    Row(
                     children: [
                        Text( "${getCurrProduct.productPrice}\$",style:Styles.textStyle15),
                        const Spacer(),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(width: 2,color: kColor)
                          ),
                            onPressed: ()async{
                            await showModalBottomSheet(
                              backgroundColor: kColor.withOpacity(0.5),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft:Radius.circular(16) ,
                                    topRight: Radius.circular(16),
                                  )
                                ),
                                context: context,
                                builder: (context){
                                return  OtySheet(
                                  cartModel: cartModelProvider,
                                );

                                });

                            },
                            icon: const Icon(IconlyLight.arrow_down_2,color: kColor,),
                            label:  Text("Qty: ${cartModelProvider.quantity} ",style: Styles.textStyle15,),
                        ),

                      ],
                    )

                ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
