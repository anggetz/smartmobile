import 'package:json_annotation/json_annotation.dart';

part 'model_group_location.g.dart';

@JsonSerializable()
class ModelGroupLocation {
  final int id;
  final String name;
  final String address;

  ModelGroupLocation(this.id, this.name, this.address);

  factory ModelGroupLocation.fromJson(Map<String, dynamic> json) => _$ModelGroupLocationFromJson(json);

  Map<String, dynamic> toJson() => _$ModelGroupLocationToJson(this);
}