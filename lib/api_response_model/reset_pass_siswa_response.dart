// To parse this JSON data, do
//
//     final resetPassSiswaResponse = resetPassSiswaResponseFromJson(jsonString);

import 'dart:convert';

ResetPassSiswaResponse resetPassSiswaResponseFromJson(String str) => ResetPassSiswaResponse.fromJson(json.decode(str));

String resetPassSiswaResponseToJson(ResetPassSiswaResponse data) => json.encode(data.toJson());

class ResetPassSiswaResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Data data;

  ResetPassSiswaResponse({
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

  factory ResetPassSiswaResponse.fromJson(Map<String, dynamic> json) {
    if(json["data"]==null){
      return ResetPassSiswaResponse(
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
      return ResetPassSiswaResponse(
        app: json["app"],
        version: json["version"],
        release: json["release"],
        datetime: DateTime.parse(json["datetime"]),
        timestamp: json["timestamp"],
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
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
    "data": data.toJson(),
  };
}

class Data {
  int rcx;
  String zensiva;

  Data({
    this.rcx,
    this.zensiva,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    rcx: json["rcx"],
    zensiva: json["zensiva"],
  );

  Map<String, dynamic> toJson() => {
    "rcx": rcx,
    "zensiva": zensiva,
  };
}
