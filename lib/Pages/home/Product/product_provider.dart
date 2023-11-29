import 'package:e_commerce_app/Pages/home/Product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _products;
  }

  ProductModel? findByProdId(String productId) {
    if (_products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> searchQuery({required String searchText}) {
    List<ProductModel> searchList = _products
        .where((element) => element.productTitle
        .toLowerCase()
        .contains(searchText.toLowerCase()))
        .toList();
    return searchList;
  }

  final List<ProductModel> _products = [
ProductModel(
    productSize:'100ml',
    productId:'Perfume 1' ,
    productTitle: 'Chanel Coco Mademoiselle',
    productPrice: '30',
    productImage: 'https://cdn.shopify.com/s/files/1/0069/4471/8937/products/Chanel-Coco-Mademoiselle-Intense-EDP-W-50ml-2_de2881cf-4ddb-4a2d-a65a-12b75ff4ec7f_2048x2048.jpg?v=1573190770',
    productQuantity: '10',
    productDescription: "Chanel Coco Mademoiselle Intense Eau de Parfum reflects another aspect of Coco Chanel’s personality. The distinctive, sensual and purely feminine fragrance composition, with its delicate warmth, represents a strongly addictive fragrance which you just can’t resist."
),
    ProductModel(
        productSize:'50ml',
        productId:'Perfume 2' ,
        productTitle: 'Perfect by Marc',
        productPrice: '25',
        productImage: 'https://fraguru.com/mdimg/secundar/o.73225.jpg',
        productQuantity: '5',
        productDescription: "Perfect by Marc Jacobs is a Amber Floral fragrance for women. Perfect was launched in 2020. The nose behind this fragrance is Domitille Michalon Bertier. Top notes are Rhubarb and Narcissus; middle note is Almond Milk; base notes are Cashmeran and Cedar."
    ),

    ProductModel(
        productSize:'80ml',
        productId:const Uuid().v4(),
        productTitle: 'Chance Eau Tendre Eau de Parfum de Chanel',
        productPrice: '40',
        productImage: 'https://tse2.mm.bing.net/th?id=OIP.Jp4fZz3cZQrrgnTnvGCN3AHaHZ&pid=Api&P=0&h=220',
        productQuantity: '7',
        productDescription: "Chance Eau Tendre Eau de Parfum de Chanel es una fragancia de la familia olfativa Floral Frutal para Mujeres. Chance Eau Tendre Eau de Parfum se lanzó en 2019. La Nariz detrás de esta fragrancia es Olivier Polge. Las Notas de Salida son membrillo y toronja (pomelo); las Notas de Corazón son rosa y jazmín; la Nota de Fondo es almizcle blanco."
    ),
];

}