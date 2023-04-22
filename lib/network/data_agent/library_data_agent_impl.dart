import 'package:book_library/data/vos/item_vo/item_vo.dart';
import 'package:book_library/network/api/library_api/library_api.dart';
import 'package:book_library/network/api/search_api/search_api.dart';
import 'package:book_library/network/data_agent/library_data_agent.dart';
import 'package:dio/dio.dart';

import '../../constant/api_constant.dart';
import '../../data/vos/lists_vo/lists_vo.dart';
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
  Future<List<Lists>?> getLists(String publishedDate) {
    return getResult(publishedDate).then((value) {
      return value?.lists;
    });
  }
}