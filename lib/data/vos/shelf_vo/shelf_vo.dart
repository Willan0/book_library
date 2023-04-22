
import 'package:hive/hive.dart';

import '../../../constant/dao_constant.dart';
import '../books_vo/book_vo.dart';
part 'shelf_vo.g.dart';

@HiveType(typeId: kShelfTypeId)
class ShelfVO {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? shelfName;

  @HiveField(2)
  List<Books> bookList;

  ShelfVO(this.id, this.shelfName,this.bookList);
}