
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier{
  final String productSize, productId , productTitle , productPrice , productImage , productQuantity , productDescription ;

  ProductModel(  {required this.productSize,required this.productId, required this.productTitle, required this.productPrice, required this.productImage, required this.productQuantity, required this.productDescription});
}