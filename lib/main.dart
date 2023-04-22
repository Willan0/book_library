
import 'package:book_library/constant/dao_constant.dart';
import 'package:book_library/data/vos/buy_links_vo/buy_link_vo.dart';
import 'package:book_library/data/vos/lists_vo/lists_vo.dart';
import 'package:book_library/pages/bottom_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/vos/books_vo/book_vo.dart';
import 'data/vos/result_vo/result_vo.dart';
import 'data/vos/shelf_vo/shelf_vo.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BooksAdapter());
  Hive.registerAdapter(BuyLinksAdapter());
  Hive.registerAdapter(ListsAdapter());
  Hive.registerAdapter(ResultsAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<Lists>(kBoxNameForLists);
  await Hive.openBox<Books>(kBoxNameForBook);
  await Hive.openBox<String>(kBoxNameForSearchHistoryVO);
  await Hive.openBox<ShelfVO>(kShelfBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Book Library',
      home:  BottomNavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

