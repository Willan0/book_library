// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_link_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuyLinksAdapter extends TypeAdapter<BuyLinks> {
  @override
  final int typeId = 2;

  @override
  BuyLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuyLinks(
      name: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BuyLinks obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyLinks _$BuyLinksFromJson(Map<String, dynamic> json) => BuyLinks(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BuyLinksToJson(BuyLinks instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
