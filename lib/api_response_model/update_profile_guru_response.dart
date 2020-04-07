// To parse this JSON data, do
//
//     final updateProfileGuruResponse = updateProfileGuruResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileGuruResponse updateProfileGuruResponseFromJson(String str) => UpdateProfileGuruResponse.fromJson(json.decode(str));

String updateProfileGuruResponseToJson(UpdateProfileGuruResponse data) => json.encode(data.toJson());

class UpdateProfileGuruResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<dynamic> data;

  UpdateProfileGuruResponse({
    this.app,
    this.version,
    this.release,
    this.datetime,
    this.timestamp,
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory UpdateProfileGuruResponse.fromJson(Map<String, dynamic> json) {
    if(json["data"]==null){
      return UpdateProfileGuruResponse(
        app: json["app"],
        version: json["version"],
        release: json["release"],
        datetime: DateTime.parse(json["datetime"]),
        timestamp: json["timestamp"],
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );
    }else{
      return UpdateProfileGuruResponse(
        app: json["app"],
        version: json["version"],
        release: json["release"],
        datetime: DateTime.parse(json["datetime"]),
        timestamp: json["timestamp"],
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "app": app,
    "version": version,
    "release": release,
    "datetime": datetime.toIso8601String(),
    "timestamp": timestamp,
    "status": status,
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
