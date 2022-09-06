import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart/models/model_group_location.dart';

import '../models/model_group_location.dart';

class ServiceGroupLocation {
  Future<List<ModelGroupLocation>> get() async {
    var apiUrl = Uri(
      scheme: 'http',
      host: 'localhost',
      port: 30001,
      path: '/v1/master-group-location/get',
    );

    var dio = Dio();

    var result = await dio.get(
        apiUrl.toString()
    );



    if (result.statusCode != 200) {
      Fluttertoast.showToast(
          msg: "Oopps something wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      return List.empty();
    } else {


      Iterable i = json.decode(result.toString())['data'];

      print(i);

      return List<ModelGroupLocation>.from(i.map((e) => ModelGroupLocation.fromJson(e)));
    }

  }
}