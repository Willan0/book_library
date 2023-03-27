import 'package:book_library/persistent/dao/search_dao/search_dao.dart';
import 'package:hive/hive.dart';

import '../../../constant/dao_constant.dart';

class SearchHistoryDAOImpl extends SearchHistoryDAO {
  SearchHistoryDAOImpl._();

  static final SearchHistoryDAOImpl _singleton = SearchHistoryDAOImpl._();

  factory SearchHistoryDAOImpl() => _singleton;

  @override
  List<String>? getSearchHistory() => _getSearchHistoryBox().values.toList();

  @override
  void save(String query) {
    _getSearchHistoryBox().put(DateTime.now().toString(), query);
  }

  Box<String> _getSearchHistoryBox() =>
      Hive.box<String>(kBoxNameForSearchHistoryVO);
}