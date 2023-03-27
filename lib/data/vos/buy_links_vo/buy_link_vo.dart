import 'package:book_library/constant/dao_constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'buy_link_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kBuyBookVOTypeId)
class BuyLinks {

  @JsonKey(name: 'name')
  @HiveField(0)
  String? name;

  @JsonKey(name: 'url')
  @HiveField(1)
  String? url;

  BuyLinks({this.name, this.url});

  factory BuyLinks.fromJson(Map<String,dynamic> json) => _$BuyLinksFromJson(json);
}