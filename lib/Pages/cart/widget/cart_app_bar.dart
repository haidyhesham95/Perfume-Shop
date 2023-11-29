import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constant/Colors.dart';
import '../../../Constant/Styles.dart';
import '../../../Services/my_app_method.dart';
import '../model/cart_provider.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key, });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override

  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return AppBar(
      actions: [
        IconButton(
            onPressed: (){
              MyAppMethod.showErrorOrWarningDialog(
                isError: false,
                context: context,
                data: 'Delete All ',
                onpressed: () async{
                  cartProvider.clearLocalCart();
                },
              );

        }, icon:const Icon(Icons.delete_forever_outlined,color: Colors.black,size: 30,) )
      ],
      backgroundColor: kColor,
      leading: Image.asset('assets/images/logo.png'),
      title:const Text(
        'My Cart',
        style: Styles.textStyle22,
      ) ,
    );
  }
}
