import 'package:e_commerce_app/Pages/order/view/order_page.dart';
import 'package:e_commerce_app/Pages/recently/view/recently_page.dart';
import 'package:e_commerce_app/Services/my_app_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../../Constant/Styles.dart';
import '../../../Setting/Theme_cubit.dart';
import '../../favorite/view/favorite_page.dart';

class WidgetListTile extends StatelessWidget {
  const WidgetListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/images/order.png',height: 30,),
          title: const Text(
            'All orders',
            style:Styles.textStyle22,
          ),
          onTap: (){
            Navigator.push (
              context,
              MaterialPageRoute(
                  builder: (context) => OrderPage(

                  )),
            );
          },
          trailing:const Icon(IconlyLight.arrow_right_2),
        ),

        ListTile(
          leading: Image.asset('assets/images/viewed.png',height: 30,),
          title: const Text(
            'Viewed recently',
            style:Styles.textStyle22,
          ),
          onTap: (){
            Navigator.push (
              context,
              MaterialPageRoute(
                  builder: (context) => const RecentlyPage(

                  )),
            );
          },
          trailing:const Icon(IconlyLight.arrow_right_2),
        ),

        ListTile(
          leading: Image.asset('assets/images/love.png',height: 30,),
          title: const Text(
            'Favorites',
            style:Styles.textStyle22,
          ),
          onTap: (){
            Navigator.push (
              context,
              MaterialPageRoute(
                  builder: (context) => const FavoritePage(

                  )),
            );
          },
          trailing:const Icon(IconlyLight.arrow_right_2),
        ),

        ListTile(
          leading: Image.asset('assets/images/address.png',height: 30,),
          title: const Text(
            'Address',
            style:Styles.textStyle22,
          ),
          onTap: (){
          },
          trailing:const Icon(IconlyLight.arrow_right_2),
        ),

        ListTile(
          leading: Image.asset('assets/images/theme.png',height: 30,),
          title: const Text(
            'Theme',
            style:Styles.textStyle22,

          ),
          onTap: (){
            BlocProvider.of<ThemeCubit>(context).toggleTheme();
           //  final cubit = context.read<SettingCubit>();
           //  cubit.toggleTheme();

          },
          trailing:const Icon(IconlyLight.arrow_right_2),
        ),

        ListTile(
          leading: Image.asset('assets/images/login.png',height: 30,),
          title: const Text(
            'Logout',
            style:Styles.textStyle22,

          ),
          onTap: () {
            MyAppMethod.showErrorOrWarningDialog(
              isError: false,
              context: context,
              data: 'Are you sure? you want to logout.',
              onpressed: () async{
              await FirebaseAuth.instance.signOut();
              await Navigator.of(context).pushNamed('login');
              },
            );
          },
          trailing:const Icon(IconlyLight.arrow_right_2),
        ),
      ],
    );
  }
}
