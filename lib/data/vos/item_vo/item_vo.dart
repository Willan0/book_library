import 'package:json_annotation/json_annotation.dart';

import '../access_info/access_info.dart';
import '../sale_info/sale_info.dart';
import '../search_info/search_info.dart';
import '../volume_info/volume_info.dart';

part 'item_vo.g.dart';
@JsonSerializable()
class ItemVO {
  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'etag')
  String? etag;

  @JsonKey(name: 'selfLink')
  String? selfLink;

  @JsonKey(name: 'volumeInfo')
  VolumeInfoVO? volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfo? saleInfo;

  @JsonKey(name: 'accessInfo')
  AccessInfo? accessInfo;

  @JsonKey(name: 'searchInfo')
  SearchInfo? searchInfo;

  ItemVO({this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo});

  factory ItemVO.fromJson(Map<String,dynamic> json)=> _$ItemVOFromJson(json);
}