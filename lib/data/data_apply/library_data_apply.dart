
import 'package:book_library/data/vos/item_vo/item_vo.dart';

import '../vos/books_vo/book_vo.dart';
import '../vos/result_vo/result_vo.dart';

abstract class LibraryDataApply{

  // for network

  Future<Results?> getResultFromNetwork(String publishedDate);

  Future<List<ItemVO>?> getItemListFromNetwork(String search);

  Future<List<Books>?> getBookList(String publishedDate);

  // for database
  Stream<Results?> getResultFromDataBase(String publishedDate);

  Stream<List<Books>?> getBookFromDataBase();

  void saveSearchHistory(String query);

  List<String>? getSearchHistoryList();
}