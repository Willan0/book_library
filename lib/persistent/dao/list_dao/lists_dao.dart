import '../../../data/vos/lists_vo/lists_vo.dart';

abstract class ListDAO {
  void saveLists(List<Lists> lists);

  Stream watchListsBox();

  Stream<List<Lists>?> getListsFromDatabaseStream();

  List<Lists>? getListsFromDatabase();
}