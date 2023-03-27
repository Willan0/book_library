
import 'package:book_library/data/vos/item_vo/item_vo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/search_bloc.dart';
import '../constant/dimen.dart';
import '../view_item/search_page_view_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_)=> SearchBloc(),
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: kWh30x,),
            const SearchItemView(),
            Selector<SearchBloc,List<ItemVO>?>(
              selector: (_,selector)=> selector.getItemList,
                builder:(_,itemList,__)=> Expanded(child: SearchListView(items: itemList??[])) ,
            ),
          ],
        ),
      ),
    );
  }
}



