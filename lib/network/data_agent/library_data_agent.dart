import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/data/vos/item_vo/item_vo.dart';

import '../../data/vos/lists_vo/lists_vo.dart';
import '../../data/vos/result_vo/result_vo.dart';

abstract class LibraryDataAgent{

  // library api
  Future<Results?> getResult(String publishedDate);


  Future<List<Lists>?> getLists(String publishedDate);

  // search api
  Future<List<ItemVO>?> getItemList(String search);

}