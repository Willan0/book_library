import 'package:json_annotation/json_annotation.dart';

part 'search_info.g.dart';
@JsonSerializable()
class SearchInfo {
  @JsonKey(name: 'textSnippet')
  String? textSnippet;

  SearchInfo({this.textSnippet});
  factory SearchInfo.fromJson(Map<String,dynamic> json)=> _$SearchInfoFromJson(json);

}
