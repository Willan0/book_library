import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../lists_vo/lists_vo.dart';
part 'result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Results {
  @JsonKey(name: 'bestsellers_date')
  @HiveField(0)
  String? bestsellersDate;

  @JsonKey(name: 'published_date')
  @HiveField(1)
  String? publishedDate;

  @JsonKey(name: 'published_date_description')
  @HiveField(2)
  String? publishedDateDescription;

  @JsonKey(name: 'previous_published_date')
  @HiveField(3)
  String? previousPublishedDate;

  @JsonKey(name: 'next_published_date')
  @HiveField(4)
  String? nextPublishedDate;

  @JsonKey(name: 'lists')
  @HiveField(5)
  List<Lists>? lists;

  Results(
      {this.bestsellersDate,
        this.publishedDate,
        this.publishedDateDescription,
        this.previousPublishedDate,
        this.nextPublishedDate,
        this.lists});
  factory Results.fromJson(Map<String,dynamic> json)=> _$ResultsFromJson(json);
}