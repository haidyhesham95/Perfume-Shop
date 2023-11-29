import 'package:e_commerce_app/Pages/Profile/widget/custom_visibilty.dart';
import 'package:flutter/material.dart';
import '../../home/widget/custom_appbar.dart';
import '../widget/profile_details.dart';
import '../widget/widget_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            CustomVisibilty(),
              SizedBox(height: 20),
             CustomProfile(),
            SizedBox(height: 5),
             Divider(thickness: 1.5,),
             SizedBox(height: 15),
             WidgetListTile(),
          ],
        ),
      ),
    );
  }
}
