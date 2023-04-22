import 'package:book_library/data/data_apply/library_data_apply.dart';
import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/data/vos/item_vo/item_vo.dart';
import 'package:book_library/data/vos/lists_vo/lists_vo.dart';
import 'package:book_library/persistent/dao/book_dao/book_dao.dart';
import 'package:book_library/persistent/dao/book_dao/book_dao_impl.dart';
import 'package:book_library/persistent/dao/list_dao/lists_dao.dart';
import 'package:book_library/persistent/dao/shelf_dao/shelf_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../network/data_agent/library_data_agent.dart';
import '../../network/data_agent/library_data_agent_impl.dart';
import '../../persistent/dao/list_dao/list_dao_impl.dart';
import '../../persistent/dao/search_dao/search_dao.dart';
import '../../persistent/dao/search_dao/search_dao_impl.dart';
import '../../persistent/dao/shelf_dao/shelf_dao.dart';
import '../vos/shelf_vo/shelf_vo.dart';

class LibraryDataApplyImpl extends LibraryDataApply{
  LibraryDataApplyImpl._();
  static final LibraryDataApplyImpl _singleton = LibraryDataApplyImpl._();
  factory LibraryDataApplyImpl() => _singleton;

  final LibraryDataAgent _libraryDataAgent = LibraryDataAgentImpl();

  final ShelfDAO _shelfDAO = ShelfDAOImpl();
  final BookDAO _bookDAO = BookDAOImpl();
  final ListDAO _listDAO = ListDAOImpl();
  final SearchHistoryDAO _searchDao = SearchHistoryDAOImpl();

  @override
  Future<List<ItemVO>?> getItemListFromNetwork(String search) =>
    _libraryDataAgent.getItemList(search).then((value) => value);

  @override
  Future<List<Lists>?> getListsListFromNetwork(String publishedDate) =>
      _libraryDataAgent.getLists(publishedDate).then((value) {
        var temp = _listDAO.getListsFromDatabase() ?? [];
        if(temp.isEmpty){
          _listDAO.saveLists(value!);
        }
        return value;
      }
  );

  //database
  @override
  Stream<List<Lists>?> getListsFromDataBaseStream() {
    return _listDAO
        .watchListsBox()
        .startWith(_listDAO.getListsFromDatabaseStream())
        .map((event) => _listDAO.getListsFromDatabase()
    );
  }
  @override
  List<String>? getSearchHistoryList() => _searchDao.getSearchHistory();

  @override
  void saveSearchHistory(String query) => _searchDao.save(query);

  @override
  void createShelf(String shelfName,List<Books> bookList){
    ShelfVO shelfVO = ShelfVO(DateTime.now().toString(), shelfName, bookList);
     return _shelfDAO.saveShelf(shelfVO);
  }

  @override
  Stream<List<ShelfVO>?> getShelfFromDataBaseStream() {
    return _shelfDAO.watchShelfBox().startWith(_shelfDAO.getShelfFromDatabaseStream()).map((event) => _shelfDAO.getShelfFromDatabase());
  }

  @override
  void saveBook(List<Books> bookList) => _bookDAO.saveBook(bookList);

  @override
  void clearBookBox() => _bookDAO.clearBookBox();

  @override
  Stream<List<Books>?> getBookFromDatabaseStream() {
    return _bookDAO.watchBookBox().startWith(_bookDAO.getBookFromDatabaseStream())
        .map((event) => _bookDAO.getBookFromDatabase());
  }

  







  
}