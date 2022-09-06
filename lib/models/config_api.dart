class ConfigApi {
  String host = "";
  String schema = "";
  String version = "";
  int port = 0;

  ConfigApi();

  ConfigApi fromJson(Map<String, dynamic> json) {

    this.host = json["host"];
    this.schema = json["schema"];
    this.version = json["version"];
    this.port = json["port"];

    return this;
  }

  Map<String, dynamic> toJson() => {
    "host": host,
    "schema": schema,
    "version": version
  };
}