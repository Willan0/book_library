import 'package:book_library/data/data_apply/library_data_apply.dart';
import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/data/vos/item_vo/item_vo.dart';
import 'package:book_library/data/vos/result_vo/result_vo.dart';
import 'package:book_library/persistent/dao/book_dao/book_dao.dart';
import 'package:book_library/persistent/dao/book_dao/book_dao_impl.dart';
import 'package:book_library/persistent/dao/result_dao/result_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../network/data_agent/library_data_agent.dart';
import '../../network/data_agent/library_data_agent_impl.dart';
import '../../persistent/dao/result_dao/result_dao.dart';
import '../../persistent/dao/search_dao/search_dao.dart';
import '../../persistent/dao/search_dao/search_dao_impl.dart';

class LibraryDataApplyImpl extends LibraryDataApply{
  LibraryDataApplyImpl._();
  static final LibraryDataApplyImpl _singleton = LibraryDataApplyImpl._();
  factory LibraryDataApplyImpl() => _singleton;

  final LibraryDataAgent _libraryDataAgent = LibraryDataAgentImpl();
  final ResultDAO _resultDAO = ResultDAOImpl();
  final BookDAO _bookDAO = BookDAOImpl();
  final SearchHistoryDAO _searchDao = SearchHistoryDAOImpl();

  @override
  Stream<Results?> getResultFromDataBase(String publishedDate)=>
      _resultDAO
          .watchBox()
          .startWith(_resultDAO.getResultsFromStream(publishedDate))
          .map((event) => _resultDAO.getResults(publishedDate));




  @override
  Future<Results?> getResultFromNetwork(String publishedDate) => _libraryDataAgent.getResult(publishedDate).then((value) {
    var temp = value;
    if(temp!= null){
      _resultDAO.save(temp);
    }
    return temp;
  });

  @override
  Future<List<ItemVO>?> getItemListFromNetwork(String search) =>
    _libraryDataAgent.getItemList(search).then((value) => value);

  @override
  List<String>? getSearchHistoryList() => _searchDao.getSearchHistory();

  @override
  void saveSearchHistory(String query) {
    _searchDao.save(query);
  }

  @override
  Future<List<Books>?> getBookList(String publishedDate)=> _libraryDataAgent.getBooks(publishedDate).then((value) {
   return value;
  });

  @override
  Stream<List<Books>?> getBookFromDataBase() => _bookDAO.watchBookBox().startWith(_bookDAO.getBookFromStream()).map((event) => _bookDAO.getBooks());






  
}