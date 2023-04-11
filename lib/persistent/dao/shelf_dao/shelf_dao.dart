import 'package:book_library/data/vos/shelf_vo/shelf_vo.dart';

abstract class ShelfDAO{

  void saveShelf(ShelfVO shelf);

  List<ShelfVO>? getShelf();

  Stream watchShelfBox();

  Stream<List<ShelfVO>?> getShelfFromStream();
}