// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

BannerResponse bannerResponseFromJson(String str) => BannerResponse.fromJson(json.decode(str));

String bannerResponseToJson(BannerResponse data) => json.encode(data.toJson());

class BannerResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Banner> data;

  BannerResponse({
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

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: List<Banner>.from(json["data"].map((x) => Banner.fromJson(x))),
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

class Banner {
  int id;
  String nama_banner;
  String gambar;
  int status;
  DateTime created_date;

  Banner({
    this.id,
    this.nama_banner,
    this.gambar,
    this.status,
    this.created_date,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    nama_banner: json["nama_banner"],
    gambar: json["gambar"],
    status: json["status"],
    created_date: DateTime.parse(json["created_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_banner": nama_banner,
    "gambar": gambar,
    "status": status,
    "created_date": created_date.toIso8601String(),
  };
}
