import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../Constant/Colors.dart';
import '../../favorite/model/favorite_provider.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({super.key, this.color=Colors.transparent,this.size = 22, required this.productId,});
final Color? color;
  final double size;
  final String productId;


  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<FavoriteProvider>(context);
    return  Container(
     decoration: BoxDecoration(
       shape: BoxShape.circle,
       color: widget.color,
     ),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
        onPressed: (){
          wishlistProvider.addOrRemoveFromFavorite(productId: widget.productId);

        },
        icon: Icon(
          wishlistProvider.isProductInFavorite(productId: widget.productId)
              ? IconlyBold.heart
              : IconlyLight.heart,
           size: widget.size,
          color:
          wishlistProvider.isProductInFavorite(productId: widget.productId)
              ?  kPink
              : kPink,
        ),
      ),
    );
  }
}
