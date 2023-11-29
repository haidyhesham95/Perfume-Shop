import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';
import '../../home/Product/ProductWidget.dart';
import '../../home/Product/product_model.dart';
import '../../auth/widget/custom_text_field.dart';
import '../../home/Product/product_provider.dart';

class TSearch extends StatefulWidget {
  const TSearch({super.key});

  @override
  State<TSearch> createState() => _TSearchState();
}

class _TSearchState extends State<TSearch> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }
  List<ProductModel> productListSearch = [];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final List<ProductModel> productList = productProvider.getProducts;
    return Column(
      children: [
        const SizedBox( height: 10,),
        CustomTextField(
          hintText: 'Search',
          prefixIcon: const Icon(
            Icons.search,
            color: kColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              searchTextController.clear();
              FocusScope.of(context).unfocus();
            },
            child: const Icon(
              Icons.close,
              color: kColor,
            ),
          ),
          keyboardType: TextInputType.text,
          controller: searchTextController,
          onChanged: (value) {
            setState(() {
              productListSearch = productProvider.searchQuery(
                  searchText: searchTextController.text);
            });
          },
          onSubmitted: (value) {
            setState(() {
              productListSearch = productProvider.searchQuery(
                  searchText: searchTextController.text);
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        if (searchTextController.text.isNotEmpty &&
            productListSearch.isEmpty) ...[
                Center(child: Text('No product found 😔',style: Styles.textStyle30.copyWith(color: kColor),)),
             ],
        Expanded(
          child: DynamicHeightGridView(
            itemCount: searchTextController.text.isNotEmpty
                ? productListSearch.length
                : productList.length,
            builder: ((context, index) {
              return ProductWidget(
                productId: searchTextController.text.isNotEmpty
                    ? productListSearch[index].productId
                    : productList[index].productId,
              );
            }),
            crossAxisCount: 2,
          ),
        ),
      ],
    );
  }
}
