// To parse this JSON data, do
//
//     final searchAreaResponse = searchAreaResponseFromJson(jsonString);

import 'dart:convert';

SearchAreaV2Response searchAreaV2ResponseFromJson(String str) => SearchAreaV2Response.fromJson(json.decode(str));

String searchAreaV2ResponseToJson(SearchAreaV2Response data) => json.encode(data.toJson());

class SearchAreaV2Response {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Area> data;

  SearchAreaV2Response({
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

  factory SearchAreaV2Response.fromJson(Map<String, dynamic> json) => SearchAreaV2Response(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: List<Area>.from(json["data"].map((x) => Area.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "app": app,
    "version": version,
    "release": release,
    "datetime": datetime.toIso8601String(),
    "timestamp": timestamp,
    "status": status,
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Area {
  String nama;
  String type;
  String launched;
  String listKecamatanId;

  Area({
    this.nama,
    this.type,
    this.launched,
    this.listKecamatanId,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    nama: json["nama"],
    type: json["type"],
    launched: json["launched"],
    listKecamatanId: json["list_kecamatan_id"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "type": type,
    "launched": launched,
    "list_kecamatan_id": listKecamatanId,
  };
}
