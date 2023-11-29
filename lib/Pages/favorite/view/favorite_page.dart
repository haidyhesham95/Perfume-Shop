import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Constant/Colors.dart';
import '../../../../Constant/Styles.dart';
import '../../../../Widget/custom_page_empty.dart';
import '../../home/Product/ProductWidget.dart';
import '../model/favorite_provider.dart';
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return favoriteProvider.getFavoriteItems.isEmpty
        ? const Scaffold(
     body: CustomEmpty(
    imagePath: 'assets/images/nofav.png',
    label: 'There\`s nothing in here',
    title: 'Fill me up buttercup 😜',
    buttonText: 'Shop Now',
    ) ,
    ):Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        leading: Image.asset('assets/images/logo.png'),
        title:const Text(
          'Favorite',
          style: Styles.textStyle22,
        ) ,
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8,),
                          const Text('Clear !',style: Styles.textStyle28,),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed:(){
                                  favoriteProvider.clearLocalFavorite();
                                  Navigator.of(context).pop();
                                },
                                child:  Text(
                                  "OK",style: Styles.textStyle20.copyWith(color: kColor), ),
                              ),
                              TextButton(
                                onPressed:() {
                                  Navigator.of(context).pop();
                                },
                                child:  Text(
                                  "Cancel",style: Styles.textStyle20.copyWith(color: kPink),),
                              ),

                            ],
                          )
                        ],

                      ),
                    );
                  }
              );
            },
        icon:const Icon(Icons.delete_forever_outlined,color: Colors.black,size: 30,) )
        ],
      ),
      body: DynamicHeightGridView(
        itemCount: favoriteProvider.getFavoriteItems.length,
        builder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductWidget(
              productId: favoriteProvider.getFavoriteItems.values
                  .toList()[index]
                  .productId,
            ),
          );
        }),
        crossAxisCount: 2,
      ),
    );
  }
}
