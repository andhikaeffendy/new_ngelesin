// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

KategoriResponse kategoriResponseFromJson(String str) => KategoriResponse.fromJson(json.decode(str));

String kategoriResponseToJson(KategoriResponse data) => json.encode(data.toJson());

class KategoriResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Kategori> data;

  KategoriResponse({
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

  factory KategoriResponse.fromJson(Map<String, dynamic> json) => KategoriResponse(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: List<Kategori>.from(json["data"].map((x) => Kategori.fromJson(x))),
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

class Kategori {
  int id;
  String nama;
  String gambar;
  String desc;
  int status;
  int is_delete;

  Kategori({
    this.id,
    this.nama,
    this.gambar,
    this.desc,
    this.status,
    this.is_delete,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
    id: json["id"],
    nama: json["nama"],
    gambar: json["gambar"],
    desc: json["desc"],
    status: json["status"],
    is_delete: json["is_delete"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "gambar": gambar,
    "desc": desc,
    "status": status,
    "is_delete": is_delete,
  };
}
