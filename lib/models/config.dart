import 'package:smart/models/config_api.dart';

class Config {
  ConfigApi api = ConfigApi();

  Config fromJson(Map<String, dynamic> json) {

    this.api = this.api.fromJson(json["api"]);

    return this;
  }

  Map<String, dynamic> toJson() => {
    "api": api,
  };
}
