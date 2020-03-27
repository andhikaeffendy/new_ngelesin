// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListGuruResponse listGuruResponseFromJson(String str) => ListGuruResponse.fromJson(json.decode(str));

String listGuruResponseToJson(ListGuruResponse data) => json.encode(data.toJson());

class ListGuruResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Guru> data;

  ListGuruResponse({
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

  factory ListGuruResponse.fromJson(Map<String, dynamic> json) => ListGuruResponse(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: List<Guru>.from(json["data"].map((x) => Guru.fromJson(x))),
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

class Guru {
  String id;
  String tb_guru_id;
  String tb_guru_mapel_id;
  String tb_mapel_id;
  String nama_guru;
  String biaya;
  String foto_profil;
  String pendidikan_terakhir;
  int rating_guru;
  int suara;

  Guru({
    this.id,
    this.tb_guru_id,
    this.tb_guru_mapel_id,
    this.tb_mapel_id,
    this.nama_guru,
    this.biaya,
    this.foto_profil,
    this.pendidikan_terakhir,
    this.rating_guru,
    this.suara,
  });

  factory Guru.fromJson(Map<String, dynamic> json) => Guru(
    id: json["id"],
    tb_guru_id: json["tb_guru_id"],
    tb_guru_mapel_id: json["tb_guru_mapel_id"],
    tb_mapel_id: json["tb_mapel_id"],
    nama_guru: json["nama_guru"],
    biaya: json["biaya"],
    foto_profil: json["foto_profil"] == null ? "https://cdn0.iconfinder.com/data/icons/people-occupations-icons-rounded/110/Teacher-512.png" : json["foto_profil"],
    pendidikan_terakhir: json["pendidikan_terakhir"],
    rating_guru: json["rating_guru"] is String ? int.parse(json["rating_guru"]) : json["rating_guru"] ,
    suara: json["suara"] is String ? int.parse(json["suara"]) : json["suara"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tb_guru_id": tb_guru_id,
    "tb_guru_mapel_id": tb_guru_mapel_id,
    "tb_mapel_id": tb_mapel_id,
    "nama_guru": nama_guru,
    "biaya": biaya,
    "foto_profil": foto_profil,
    "pendidikan_terakhir": pendidikan_terakhir,
    "rating_guru": rating_guru,
    "suara": suara,
  };
}
