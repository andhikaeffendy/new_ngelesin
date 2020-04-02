// To parse this JSON data, do
//
//     final getKategoriMapel = getKategoriMapelFromJson(jsonString);

import 'dart:convert';

GetKategoriMapel getKategoriMapelFromJson(String str) => GetKategoriMapel.fromJson(json.decode(str));

String getKategoriMapelToJson(GetKategoriMapel data) => json.encode(data.toJson());

class GetKategoriMapel {
  bool status;
  int kode;
  List<Datum> data;

  GetKategoriMapel({
    this.status,
    this.kode,
    this.data,
  });

  factory GetKategoriMapel.fromJson(Map<String, dynamic> json) => GetKategoriMapel(
    status: json["status"],
    kode: json["kode"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String nama;
  String gambar;
  String desc;
  int status;
  int isDelete;
  DateTime createdDate;
  dynamic updatedDate;

  Datum({
    this.id,
    this.nama,
    this.gambar,
    this.desc,
    this.status,
    this.isDelete,
    this.createdDate,
    this.updatedDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["nama"],
    gambar: json["gambar"],
    desc: json["desc"],
    status: json["status"],
    isDelete: json["is_delete"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "gambar": gambar,
    "desc": desc,
    "status": status,
    "is_delete": isDelete,
    "created_date": createdDate == null ? null : createdDate.toIso8601String(),
    "updated_date": updatedDate,
  };
}
