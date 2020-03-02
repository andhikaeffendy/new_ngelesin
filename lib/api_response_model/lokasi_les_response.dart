// To parse this JSON data, do
//
//     final lokasiLesResponse = lokasiLesResponseFromJson(jsonString);

import 'dart:convert';

LokasiLesResponse lokasiLesResponseFromJson(String str) => LokasiLesResponse.fromJson(json.decode(str));

String lokasiLesResponseToJson(LokasiLesResponse data) => json.encode(data.toJson());

class LokasiLesResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  LokasiLesResponse({
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

  factory LokasiLesResponse.fromJson(Map<String, dynamic> json) => LokasiLesResponse(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  int id;
  String nama;
  String gambar;
  String alamat;
  int status;
  int isDelete;
  int urutan;
  DateTime createdDate;
  dynamic updatedDate;

  Datum({
    this.id,
    this.nama,
    this.gambar,
    this.alamat,
    this.status,
    this.isDelete,
    this.urutan,
    this.createdDate,
    this.updatedDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["nama"],
    gambar: json["gambar"],
    alamat: json["alamat"],
    status: json["status"],
    isDelete: json["is_delete"],
    urutan: json["urutan"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "gambar": gambar,
    "alamat": alamat,
    "status": status,
    "is_delete": isDelete,
    "urutan": urutan,
    "created_date": createdDate == null ? null : createdDate.toIso8601String(),
    "updated_date": updatedDate,
  };
}
