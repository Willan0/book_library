import 'package:book_library/data/vos/lists_vo/lists_vo.dart';
import 'package:book_library/persistent/dao/list_dao/lists_dao.dart';
import 'package:hive/hive.dart';

import '../../../constant/dao_constant.dart';

class ListDAOImpl extends ListDAO{
  ListDAOImpl._();
  static final ListDAOImpl _singleton = ListDAOImpl._();
  factory ListDAOImpl() => _singleton;

  Box<Lists> _listBox() =>Hive.box<Lists>(kBoxNameForLists);

  Box<Lists> get listBox => _listBox();


  @override
  List<Lists>? getListsFromDatabase() => _listBox().values.toList();

  @override
  Stream<List<Lists>?> getListsFromDatabaseStream() => Stream.value(getListsFromDatabase());

  @override
  void saveLists(List<Lists> lists) {
    for(var list in lists){
      _listBox().put(list.listName, list);
    }
  }

  @override
  Stream watchListsBox() => _listBox().watch();

}