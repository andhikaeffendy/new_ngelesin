// To parse this JSON data, do
//
//     final resetPassGuruResponse = resetPassGuruResponseFromJson(jsonString);

import 'dart:convert';

ResetPassGuruResponse resetPassGuruResponseFromJson(String str) => ResetPassGuruResponse.fromJson(json.decode(str));

String resetPassGuruResponseToJson(ResetPassGuruResponse data) => json.encode(data.toJson());

class ResetPassGuruResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Data data;

  ResetPassGuruResponse({
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

  factory ResetPassGuruResponse.fromJson(Map<String, dynamic> json) {
    if(json["data"]==null){
      return ResetPassGuruResponse(
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
      return ResetPassGuruResponse(
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
