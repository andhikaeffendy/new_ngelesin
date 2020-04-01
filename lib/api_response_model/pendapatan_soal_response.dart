// To parse this JSON data, do
//
//     final pendapatanSoalResponse = pendapatanSoalResponseFromJson(jsonString);

import 'dart:convert';

PendapatanSoalResponse pendapatanSoalResponseFromJson(String str) => PendapatanSoalResponse.fromJson(json.decode(str));

String pendapatanSoalResponseToJson(PendapatanSoalResponse data) => json.encode(data.toJson());

class PendapatanSoalResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  PendapatanSoalResponse({
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

  factory PendapatanSoalResponse.fromJson(Map<String, dynamic> json) => PendapatanSoalResponse(
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
  String id;
  String kodeSoal;
  String biaya;
  String namaSiswa;
  String hpSiswa;
  String namaGuru;
  String hpGuru;
  String statusSoal;
  String statusPembayaran;
  DateTime tgl;
  String pembayaran;
  String metodePembayaran;

  Datum({
    this.id,
    this.kodeSoal,
    this.biaya,
    this.namaSiswa,
    this.hpSiswa,
    this.namaGuru,
    this.hpGuru,
    this.statusSoal,
    this.statusPembayaran,
    this.tgl,
    this.pembayaran,
    this.metodePembayaran,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    kodeSoal: json["kode_soal"],
    biaya: json["biaya"],
    namaSiswa: json["nama_siswa"],
    hpSiswa: json["hp_siswa"],
    namaGuru: json["nama_guru"],
    hpGuru: json["hp_guru"],
    statusSoal: json["status_soal"],
    statusPembayaran: json["status_pembayaran"],
    tgl: DateTime.parse(json["tgl"]),
    pembayaran: json["pembayaran"],
    metodePembayaran: json["metode_pembayaran"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_soal": kodeSoal,
    "biaya": biaya,
    "nama_siswa": namaSiswa,
    "hp_siswa": hpSiswa,
    "nama_guru": namaGuru,
    "hp_guru": hpGuru,
    "status_soal": statusSoal,
    "status_pembayaran": statusPembayaran,
    "tgl": "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
    "pembayaran": pembayaran,
    "metode_pembayaran": metodePembayaran,
  };
}
