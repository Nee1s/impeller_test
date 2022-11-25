// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTO _$DTOFromJson(Map<String, dynamic> json) => DTO(
      age: json['age'] as int,
      fingers: (json['fingers'] as num).toDouble(),
      name: json['name'] as String,
      nicknames:
          (json['nicknames'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DTOToJson(DTO instance) => <String, dynamic>{
      'age': instance.age,
      'fingers': instance.fingers,
      'name': instance.name,
      'nicknames': instance.nicknames,
    };
