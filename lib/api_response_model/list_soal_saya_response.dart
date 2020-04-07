// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListSoalSayaResponse listSoalSayaResponseFromJson(String str) => ListSoalSayaResponse.fromJson(json.decode(str));

String listSoalSayaResponseToJson(ListSoalSayaResponse data) => json.encode(data.toJson());

class ListSoalSayaResponse {
  bool status;
  int kode;
  List<SoalSaya> data;

  ListSoalSayaResponse({
    this.status,
    this.kode,
    this.data,
  });

  factory ListSoalSayaResponse.fromJson(Map<String, dynamic> json) => ListSoalSayaResponse(
    status: json["status"],
    kode: json["kode"],
    data: json["data"] == null ? [] : List<SoalSaya>.from(json["data"].map((x) => SoalSaya.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SoalSaya {
  String id;
  String kode_soal;
  DateTime tgl;
  String biaya;
  String nama_guru;
  String gambar;
  String status;

  SoalSaya({
    this.id,
    this.kode_soal,
    this.tgl,
    this.biaya,
    this.nama_guru,
    this.gambar,
    this.status,
  });

  factory SoalSaya.fromJson(Map<String, dynamic> json) => SoalSaya(
    id: json["id"],
    kode_soal: json["kode_soal"],
    tgl: DateTime.parse(json["tgl"]),
    biaya: json["biaya"],
    gambar: json["gambar"] == null ? "https://www.freeiconspng.com/uploads/school-student-icon-18.png" : json["gambar"],
    nama_guru: json["nama_guru"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_soal": kode_soal,
    "tgl": tgl,
    "biaya": biaya,
    "nama_guru": nama_guru,
    "gambar": gambar,
    "status": status,
  };
}
