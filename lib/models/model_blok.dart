import 'package:json_annotation/json_annotation.dart';

part 'model_blok.g.dart';

@JsonSerializable()
class ModelBlok {
  int id = 0;
  String name = "";
  int? id_group_location = 0;

  ModelBlok();

  factory ModelBlok.fromJson(Map<String, dynamic> json) => _$ModelBlokFromJson(json);

  Map<String, dynamic> toJson() => _$ModelBlokToJson(this);
}