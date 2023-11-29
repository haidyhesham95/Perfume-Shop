import 'package:e_commerce_app/Pages/home/widget/heart_button_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';
import '../../cart/model/cart_provider.dart';
import '../../home/Product/product_provider.dart';
import '../../order/widget/widget_appbar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context,listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProduct = productProvider.findByProdId(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: const WidgetAppBar(data: 'Details',),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: getCurrProduct == null? const SizedBox.shrink():
        SingleChildScrollView(
          child: Column(
            children: [
              FancyShimmerImage(imageUrl:getCurrProduct.productImage ,
              height: size.height*0.38,
              width: double.infinity,
                boxFit: BoxFit.fill,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 2,child: Text(getCurrProduct.productTitle,style: Styles.textStyle20,),),
                  Flexible(child: Text("${getCurrProduct.productPrice}\$",style:Styles.textStyle15)),

                ],
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HeartButtonWidget(
                      productId: getCurrProduct.productId,
                      color:Colors.teal.shade50 ,
                    ),

                    const SizedBox(width: 20,),
                    Expanded(
                        child: SizedBox(
                          height: kBottomNavigationBarHeight-10,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )
                            ),

                              onPressed: () {
                                if (cartProvider.isProductInCart(
                                    productId:
                                    getCurrProduct.productId)) {
                                  return;
                                }
                                cartProvider.addProductToCart(
                                    productId: getCurrProduct.productId);
                              },
                              icon: Icon(
                                cartProvider.isProductInCart(
                                    productId:
                                    getCurrProduct.productId)
                                    ? Icons.check
                                    : IconlyLight.bag_2,color: kColor,
                              ),
                              label: Text(
                                cartProvider.isProductInCart(
                                    productId:
                                    getCurrProduct.productId)
                                    ? "In Cart"
                                    : "ADD TO CART",style: const TextStyle(color: kColor,fontSize: 17)
                              ),),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('DETAILS:-',style: Styles.textStyle25,),
                  Text(getCurrProduct.productSize,style: Styles.textStyle20,),
                ],
              ),
              const SizedBox(height: 22,),
              Text(getCurrProduct.productDescription),
              



            ],
          ),
        ),
      ),
    );
  }
}
