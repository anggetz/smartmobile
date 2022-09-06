// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelUser _$ModelUserFromJson(Map<String, dynamic> json) => ModelUser()
  ..blokId = json['blokId'] as int
  ..email = json['email'] as String
  ..username = json['username'] as String
  ..password = json['password'] as String
  ..groupLocationId = json['groupLocationId'] as int;

Map<String, dynamic> _$ModelUserToJson(ModelUser instance) => <String, dynamic>{
      'blokId': instance.blokId,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'groupLocationId': instance.groupLocationId,
    };
