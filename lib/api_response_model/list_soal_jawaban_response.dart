// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListSoalJawabanResponse listSoalJawabanResponseFromJson(String str) => ListSoalJawabanResponse.fromJson(json.decode(str));

String listSoalJawabanResponseToJson(ListSoalJawabanResponse data) => json.encode(data.toJson());

class ListSoalJawabanResponse {
  bool status;
  int kode;
  List<SoalJawaban> data;

  ListSoalJawabanResponse({
    this.status,
    this.kode,
    this.data,
  });

  factory ListSoalJawabanResponse.fromJson(Map<String, dynamic> json) => ListSoalJawabanResponse(
    status: json["status"],
    kode: json["kode"],
    data: json["data"] == null ? [] : List<SoalJawaban>.from(json["data"].map((x) => SoalJawaban.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SoalJawaban {
  String id;
  String kode_soal;
  DateTime tgl;
  String biaya;
  String nama_guru;
  String hp_guru;
  String gambar;
  String status;

  SoalJawaban({
    this.id,
    this.kode_soal,
    this.tgl,
    this.biaya,
    this.nama_guru,
    this.hp_guru,
    this.gambar,
    this.status,
  });

  factory SoalJawaban.fromJson(Map<String, dynamic> json) => SoalJawaban(
    id: json["id"],
    kode_soal: json["kode_soal"],
    tgl: DateTime.parse(json["tgl"]),
    biaya: json["biaya"],
    gambar: json["gambar"] == null ? "https://www.freeiconspng.com/uploads/school-student-icon-18.png" : json["gambar"],
    nama_guru: json["nama_guru"],
    hp_guru: json["hp_guru"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_soal": kode_soal,
    "tgl": tgl,
    "biaya": biaya,
    "nama_guru": nama_guru,
    "hp_guru": hp_guru,
    "gambar": gambar,
    "status": status,
  };
}
