import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:smart/models/config.dart';
Future<Config> getConfiguration() async {
  final response = await rootBundle.loadString('config.json');
  final dynamic jsonMap = jsonDecode(response);

  var config = Config().fromJson(jsonMap);

  return Future.value(config);
}