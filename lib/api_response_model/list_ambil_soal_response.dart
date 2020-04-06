// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListAmbilSoalResponse listAmbilSoalResponseFromJson(String str) => ListAmbilSoalResponse.fromJson(json.decode(str));

String listAmbilSoalResponseToJson(ListAmbilSoalResponse data) => json.encode(data.toJson());

class ListAmbilSoalResponse {
  bool status;
  int kode;
  List<AmbilSoal> data;

  ListAmbilSoalResponse({
    this.status,
    this.kode,
    this.data,
  });

  factory ListAmbilSoalResponse.fromJson(Map<String, dynamic> json) => ListAmbilSoalResponse(
    status: json["status"],
    kode: json["kode"],
    data: json["data"] == null ? [] : List<AmbilSoal>.from(json["data"].map((x) => AmbilSoal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AmbilSoal {
  String id;
  String kode_soal;
  DateTime tgl;
  String biaya;
  String nama;
  String gambar;
  String status;
  String hp_siswa;

  AmbilSoal({
    this.id,
    this.kode_soal,
    this.tgl,
    this.biaya,
    this.nama,
    this.gambar,
    this.status,
    this.hp_siswa,
  });

  factory AmbilSoal.fromJson(Map<String, dynamic> json) => AmbilSoal(
    id: json["id"],
    kode_soal: json["kode_soal"],
    tgl: DateTime.parse(json["tgl"]),
    biaya: json["biaya"],
    gambar: json["gambar"] == null ? "https://www.freeiconspng.com/uploads/school-student-icon-18.png" : json["gambar"],
    nama: json["nama"],
    status: json["status"],
    hp_siswa: json.containsKey("hp_siswa") ? json["hp_siswa"] : "" ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_soal": kode_soal,
    "tgl": tgl,
    "biaya": biaya,
    "nama": nama,
    "gambar": gambar,
    "status": status,
    "hp_siswa": hp_siswa,
  };
}
