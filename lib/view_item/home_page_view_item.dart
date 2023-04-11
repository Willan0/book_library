

import 'package:flutter/material.dart';


import '../data/vos/lists_vo/lists_vo.dart';
import '../widgets/book_view_list.dart';

class BookView extends StatelessWidget {
  const BookView({
    Key? key, required this.lists,
  }) : super(key: key);
  final Lists lists;


  @override
  Widget build(BuildContext context) {
    return  BookListView(listName: lists.listName?? '',books:lists.books ?? []);
  }
}



