// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 4;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      bestsellersDate: fields[0] as String?,
      publishedDate: fields[1] as String?,
      publishedDateDescription: fields[2] as String?,
      previousPublishedDate: fields[3] as String?,
      nextPublishedDate: fields[4] as String?,
      lists: (fields[5] as List?)?.cast<Lists>(),
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bestsellersDate)
      ..writeByte(1)
      ..write(obj.publishedDate)
      ..writeByte(2)
      ..write(obj.publishedDateDescription)
      ..writeByte(3)
      ..write(obj.previousPublishedDate)
      ..writeByte(4)
      ..write(obj.nextPublishedDate)
      ..writeByte(5)
      ..write(obj.lists);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      bestsellersDate: json['bestsellers_date'] as String?,
      publishedDate: json['published_date'] as String?,
      publishedDateDescription: json['published_date_description'] as String?,
      previousPublishedDate: json['previous_published_date'] as String?,
      nextPublishedDate: json['next_published_date'] as String?,
      lists: (json['lists'] as List<dynamic>?)
          ?.map((e) => Lists.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'previous_published_date': instance.previousPublishedDate,
      'next_published_date': instance.nextPublishedDate,
      'lists': instance.lists,
    };
