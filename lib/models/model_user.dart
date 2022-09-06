import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

part 'model_user.g.dart';

@JsonSerializable()
class ModelUser extends PropertyChangeNotifier<String> {
  int? _groupLocationId = null;
  int? blokId = null;
  String email = "";
  String username = "";
  String password = "";
  String confirmPassword = "";

  ModelUser();

  int? get groupLocationId => _groupLocationId;

  set groupLocationId(int? value) {
    _groupLocationId = value;
    notifyListeners('groupLocationId');
  }

  factory ModelUser.fromJson(Map<String, dynamic> json) => _$ModelUserFromJson(json);

  Map<String, dynamic> toJson() => _$ModelUserToJson(this);
}