
import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/constant/string.dart';
import 'package:book_library/utils/extension.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';

import '../data/vos/lists_vo/lists_vo.dart';
import '../pages/search_page.dart';
import '../widgets/book_view_list.dart';

class BookView extends StatelessWidget {
  const BookView({
    Key? key, required this.lists,
  }) : super(key: key);
  final Lists lists;


  @override
  Widget build(BuildContext context) {
    return  BookListView(lists: lists);
  }
}
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: kMp10x),
      height: kWh50x,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(kRi15x)),
        border: Border.all(
          color: cBlack
        )
      ),
      child: Row(
        children: [
          const SizedBox(width: kMp10x,),
          const Icon(Icons.search),
          const SizedBox(width: kMp20x,),
          GestureDetector(
            onTap: (){
              context.nextScreen(context,const SearchPage());
            },
              child: const EasyText(text: kSearchBook,fontColor: cSecondaryTextColor,)),
          const Spacer(),
          const CircleAvatar(radius:kRi15x,backgroundColor:cCyan,child: Text('E'),),
          const SizedBox(width: kMp10x,)
        ],
      ),
    );
  }
}
