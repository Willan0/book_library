
import 'package:book_library/data/vos/volume_info/volume_series.dart';
import 'package:json_annotation/json_annotation.dart';
part 'series_info.g.dart';
@JsonSerializable()
class SeriesInfo {

  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'bookDisplayNumber')
  String? bookDisplayNumber;

  @JsonKey(name: 'volumeSeries')
  List<VolumeSeries>? volumeSeries;

  SeriesInfo({this.kind, this.bookDisplayNumber, this.volumeSeries});

  factory SeriesInfo.fromJson(Map<String,dynamic> json)=> _$SeriesInfoFromJson(json);
}