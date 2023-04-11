
import 'package:hive/hive.dart';

import '../../../constant/dao_constant.dart';
part 'shelf_vo.g.dart';

@HiveType(typeId: kShelfTypeId)
class ShelfVO {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? bookName;

  ShelfVO(this.id, this.bookName);
}