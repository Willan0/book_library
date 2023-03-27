

import 'package:book_library/constant/dao_constant.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: kSearchHistoryTypeId)
class SearchHistoryVO{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? query;
}