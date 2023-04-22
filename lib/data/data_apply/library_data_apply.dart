
import 'package:book_library/data/vos/item_vo/item_vo.dart';

import '../vos/books_vo/book_vo.dart';
import '../vos/lists_vo/lists_vo.dart';
import '../vos/shelf_vo/shelf_vo.dart';

abstract class LibraryDataApply{

  // for network


  Future<List<ItemVO>?> getItemListFromNetwork(String search);


  Future<List<Lists>?> getListsListFromNetwork(String publishedDate);

  // for database

  Stream<List<Lists>?> getListsFromDataBaseStream();
  
  Stream<List<ShelfVO>?> getShelfFromDataBaseStream();

  Stream<List<Books>?> getBookFromDatabaseStream();

  void saveSearchHistory(String query);

  void createShelf(String shelfName,List<Books> bookList);

  List<String>? getSearchHistoryList();

  void saveBook(List<Books> bookList);

  void clearBookBox();
}