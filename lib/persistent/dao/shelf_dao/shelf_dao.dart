import 'package:book_library/data/vos/shelf_vo/shelf_vo.dart';

abstract class ShelfDAO{

  void saveShelf(ShelfVO shelf);

  List<ShelfVO>? getShelfFromDatabase();

  ShelfVO? getShelfByName(String shelfName);

  Stream watchShelfBox();

  Stream<List<ShelfVO>?> getShelfFromDatabaseStream();
}