// To parse this JSON data, do
//
//     final updateProfileSiswaResponse = updateProfileSiswaResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileSiswaResponse updateProfileSiswaResponseFromJson(String str) => UpdateProfileSiswaResponse.fromJson(json.decode(str));

String updateProfileSiswaResponseToJson(UpdateProfileSiswaResponse data) => json.encode(data.toJson());

class UpdateProfileSiswaResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<dynamic> data;

  UpdateProfileSiswaResponse({
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

  factory UpdateProfileSiswaResponse.fromJson(Map<String, dynamic> json){
    if(json["data"]==null){
      return UpdateProfileSiswaResponse(
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
      return UpdateProfileSiswaResponse(
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
