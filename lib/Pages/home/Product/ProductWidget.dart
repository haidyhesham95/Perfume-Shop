import 'package:e_commerce_app/Pages/home/Product/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';
import '../../cart/model/cart_provider.dart';
import '../../recently/model/viewed_prod_provider.dart';
import '../widget/heart_button_widget.dart';


class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.productId});

  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.findByProdId(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedProvider = Provider.of<ViewedProdProvider>(context);

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(7),
            child: GestureDetector(
              onTap: () async {
                viewedProvider.addProductToHistory(
                    productId: getCurrProduct.productId);
                await Navigator.of(context)
                    .pushNamed("details", arguments: getCurrProduct.productId);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(getCurrProduct.productTitle),
                      ),
                       Flexible(
                        child: HeartButtonWidget(
                            productId: getCurrProduct.productId
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text("${getCurrProduct.productPrice}\$",
                              style: Styles.textStyle15)),
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            if (cartProvider.isProductInCart(
                                productId: getCurrProduct.productId)) {
                              return;
                            }
                            cartProvider.addProductToCart(
                                productId: getCurrProduct.productId);
                          },
                          child: Icon(
                            cartProvider.isProductInCart(
                                    productId: getCurrProduct.productId)
                                ? Icons.check
                                : IconlyLight.bag_2,
                            color: kColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
  }
}
