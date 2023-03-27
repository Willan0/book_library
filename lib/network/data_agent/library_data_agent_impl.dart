import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/data/vos/item_vo/item_vo.dart';
import 'package:book_library/network/api/library_api/library_api.dart';
import 'package:book_library/network/api/search_api/search_api.dart';
import 'package:book_library/network/data_agent/library_data_agent.dart';
import 'package:dio/dio.dart';

import '../../constant/api_constant.dart';
import '../../data/vos/result_vo/result_vo.dart';

class LibraryDataAgentImpl extends LibraryDataAgent{

  LibraryDataAgentImpl._();
  static final LibraryDataAgentImpl _singleton = LibraryDataAgentImpl._();
  factory LibraryDataAgentImpl() => _singleton;

  final LibraryApi _libraryApi = LibraryApi(Dio());

  final SearchAPI _searchAPI = SearchAPI(Dio());
  @override
  Future<Results?> getResult(String publishedDate) {
    return _libraryApi
        .getLibraryResponse(kApiToken, publishedDate)
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<ItemVO>?> getItemList(String search) {
   return _searchAPI.getSearchResponse(search)
       .asStream()
       .map((event) => event.items).first;
  }

  @override
  Future<List<Books>?> getBooks(String publishedDate) =>
    getResult(publishedDate).then((value) {
      var lists = value?.lists;
      List<Books>? books;
      lists?.forEach((element) {
        books = element.books ??[];
      });
      return books;
    });


  // @override
  // Future<List<Books>?> getBookList(String publishedDate) {
  // return getLists(publishedDate).then((value) {
  //   List<Books>? temp ;
  //   value?.forEach((element) {
  //     temp = element.books;
  //   });
  //
  //   return temp;
  // });
  // }
  //
  // @override
  // Future<List<Lists>?> getLists(String publishedDate) {
  //   return getResult(publishedDate).then((value) {
  //     var temp =value?.lists;
  //     return temp;
  //   });
  // }
}