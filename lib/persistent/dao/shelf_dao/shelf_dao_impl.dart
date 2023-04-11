import 'package:book_library/data/vos/shelf_vo/shelf_vo.dart';
import 'package:book_library/persistent/dao/shelf_dao/shelf_dao.dart';
import 'package:hive/hive.dart';

import '../../../constant/dao_constant.dart';

class ShelfDAOImpl extends ShelfDAO{

  ShelfDAOImpl._();
  static final ShelfDAOImpl _singleton = ShelfDAOImpl._();
  factory ShelfDAOImpl ()=> _singleton;
  @override
  List<ShelfVO>? getShelf() => _shelfBox.values.toList();

  @override
  Stream<List<ShelfVO>?> getShelfFromStream() => Stream.value(getShelf());

  @override
  void saveShelf(ShelfVO shelf) {
    _shelfBox.put(shelf.id, shelf);
  }

  @override
  Stream watchShelfBox() => _shelfBox.watch();

  final Box<ShelfVO> _shelfBox = Hive.box<ShelfVO>(kShelfBoxName);


}