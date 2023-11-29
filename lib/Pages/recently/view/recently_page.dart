import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce_app/Pages/order/widget/widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Widget/custom_page_empty.dart';
import '../../home/Product/ProductWidget.dart';
import '../model/viewed_prod_provider.dart';

class RecentlyPage extends StatelessWidget {
  const RecentlyPage({super.key});
  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProvider.getviewedProdItems.isEmpty
        ? const Scaffold(
          body: CustomEmpty(
        imagePath: 'assets/images/nosee.png',
        label: 'oops,',
        title: 'there is no result for your search 😔',
        buttonText: 'Shop Now',
      ) ,
    ):Scaffold(
      appBar:  WidgetAppBar(
        data: 'Viewed Recently (${viewedProvider.getviewedProdItems.length})',
      ),
      body: DynamicHeightGridView(
        itemCount: viewedProvider.getviewedProdItems.length,
        builder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductWidget(
                productId: viewedProvider.getviewedProdItems.values
                    .toList()[index]
                    .productId,
              ),
            ),
          );
        }),
        crossAxisCount: 2,
      ),
    );
  }
}
