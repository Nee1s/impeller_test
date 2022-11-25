import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

abstract class Model {
  abstract final String name;
  abstract final int age;
  abstract final double fingers;
  abstract final List<String> nicknames;
}

@JsonSerializable()
class DTO implements Model {
  const DTO({
    required this.age,
    required this.fingers,
    required this.name,
    required this.nicknames,
  });

  factory DTO.fromJson(Map<String, dynamic> json) => _$DTOFromJson(json);

  Map<String, dynamic> toJson() => _$DTOToJson(this);

  @override
  @JsonKey(name: 'age')
  final int age;

  @override
  @JsonKey(name: 'fingers')
  final double fingers;

  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  @JsonKey(name: 'nicknames')
  final List<String> nicknames;
}
