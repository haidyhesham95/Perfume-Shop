import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/Product/ProductWidget.dart';
import '../../home/Product/product_provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Expanded(
      child: DynamicHeightGridView(
        itemCount: productProvider.getProducts.length,
        crossAxisCount: 2,
          builder: ((context,index)
          {
            return ChangeNotifierProvider.value (
              value:  productProvider.getProducts[index],
                child:  ProductWidget(
                  productId:productProvider.getProducts[index].productId ,
                ));
          }),

      ),
    );
  }
}
