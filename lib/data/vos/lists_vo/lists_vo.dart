import 'package:book_library/constant/dao_constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../books_vo/book_vo.dart';
part 'lists_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kListTypeId)
class Lists {
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int? listId;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String? listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String? displayName;

  @JsonKey(name: 'updated')
  @HiveField(4)
  String? updated;

  @JsonKey(name: 'list_image')
  @HiveField(5)
  Object? listImage;

  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  Object? listImageWidth;

  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  Object? listImageHeight;

  @JsonKey(name: 'books')
  @HiveField(8)
  List<Books>? books;

  Lists(
      {this.listId,
        this.listName,
        this.listNameEncoded,
        this.displayName,
        this.updated,
        this.listImage,
        this.listImageWidth,
        this.listImageHeight,
        this.books});
  factory Lists.fromJson(Map<String,dynamic> json)=> _$ListsFromJson(json);
}