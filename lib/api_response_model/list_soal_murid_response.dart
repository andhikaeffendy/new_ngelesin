// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListSoalMuridResponse listSoalMuridResponseFromJson(String str) => ListSoalMuridResponse.fromJson(json.decode(str));

String listSoalMuridResponseToJson(ListSoalMuridResponse data) => json.encode(data.toJson());

class ListSoalMuridResponse {
  bool status;
  int kode;
  List<SoalMurid> data;

  ListSoalMuridResponse({
    this.status,
    this.kode,
    this.data,
  });

  factory ListSoalMuridResponse.fromJson(Map<String, dynamic> json) => ListSoalMuridResponse(
    status: json["status"],
    kode: json["kode"],
    data: json["data"] == null ? [] : List<SoalMurid>.from(json["data"].map((x) => SoalMurid.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SoalMurid {
  String id;
  String kode_soal;
  DateTime tgl;
  String biaya;
  String nama;
  String gambar;

  SoalMurid({
    this.id,
    this.kode_soal,
    this.tgl,
    this.biaya,
    this.nama,
    this.gambar,
  });

  factory SoalMurid.fromJson(Map<String, dynamic> json) => SoalMurid(
    id: json["id"],
    kode_soal: json["kode_soal"],
    tgl: DateTime.parse(json["tgl"]),
    biaya: json["biaya"],
    gambar: json["gambar"] == null ? "https://www.freeiconspng.com/uploads/school-student-icon-18.png" : json["gambar"],
    nama: json["nama"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_soal": kode_soal,
    "tgl": tgl,
    "biaya": biaya,
    "nama": nama,
    "gambar": gambar,
  };
}
