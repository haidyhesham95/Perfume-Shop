
import 'package:flutter/material.dart';

import '../../order/widget/widget_appbar.dart';
import '../widget/search_view.dart';
import '../widget/t_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        appBar: WidgetAppBar(data: 'Search',),

        body: Padding(
          padding: EdgeInsets.all(8.0),
          child:TSearch(),
        ),
      ),
    );
  }
}
