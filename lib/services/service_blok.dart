import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart/models/model_blok.dart';

class ServiceBlok {
  Future<List<ModelBlok>> get() async {
    var apiUrl = Uri(
      scheme: 'http',
      host: 'localhost',
      port: 30001,
      path: '/v1/master-blok/get',
    );


    var result = await http.get(
        apiUrl,
        headers: {"Content-type": "application/json"},
    );
    Iterable i = json.decode(result.body)['data'];

    return List<ModelBlok>.from(i.map((e) => ModelBlok.fromJson(e)));
  }

  Future<List<ModelBlok>> getByGroupLocation(int idGroupLocation) async {

    var apiUrl = Uri(
      scheme: 'http',
      host: 'localhost',
      port: 30001,
      path: '/v1/master-blok/get-by-group-location',
      queryParameters: { 'id_group_location': idGroupLocation.toString() }
    );

    var result = await http.get(
      apiUrl,
      headers: {"Content-type": "application/json"},
    );
    Iterable i = json.decode(result.body)['data'];

    print(json.decode(result.body)['data']);

    return List<ModelBlok>.from(i.map((e) => ModelBlok.fromJson(e)));
  }
}