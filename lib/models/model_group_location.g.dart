// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_group_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelGroupLocation _$ModelGroupLocationFromJson(Map<String, dynamic> json) =>
    ModelGroupLocation(
      json['id'] as int,
      json['name'] as String,
      json['address'] as String,
    );

Map<String, dynamic> _$ModelGroupLocationToJson(ModelGroupLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };
