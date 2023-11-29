import 'package:flutter/material.dart';
import '../../search/widget/search_view.dart';
import '../widget/custom_appbar.dart';
import '../widget/pro_text.dart';
import '../widget/swiper_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwiperHome(),
              SizedBox(height: 15,),
              ProText(),
              SizedBox(height: 10,),
              SearchView(),

        ],
    ),
      ),
    );
  }
}
