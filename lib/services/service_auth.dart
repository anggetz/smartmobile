import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart/models/config_api.dart';
import 'package:smart/models/model_user.dart';
import 'package:smart/utils/helpers/readconfig.dart';

class ServiceAuth {

  ConfigApi api;

  ServiceAuth(this.api);

  Future<dynamic> Login(String username, String password) async {
    var apiUrl = Uri(
        scheme: this.api.schema,
        host:  this.api.host,
        port: 30001,
        path: '/v1/token/',
        );
    try {
      var dio = Dio();
      dio.options.contentType = "application/json;charset=UTF-8";

      Response result = await dio.post(apiUrl.toString(), data: { "username": username, "password": password});

      if (result.statusCode != 200) {
        Fluttertoast.showToast(
            msg: "Username atau password salah",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

        return List.empty();
      } else {
        return json.decode(result.toString())['data'];
      }

    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future<dynamic> Register(ModelUser user) async {
    var apiUrl = Uri(
      scheme: this.api.schema,
      host:  this.api.host,
      port: this.api.port,
      path: '/v1/register',
    );


    var result = await http.post(
        apiUrl,
        headers: {"Content-type": "application/json"},
        body: jsonEncode(user.toJson())
    );

    return json.decode(result.body)['data'];
  }
}