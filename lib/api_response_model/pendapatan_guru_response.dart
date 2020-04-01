// To parse this JSON data, do
//
//     final pendapatanGuruResponse = pendapatanGuruResponseFromJson(jsonString);

import 'dart:convert';

PendapatanGuruResponse pendapatanGuruResponseFromJson(String str) => PendapatanGuruResponse.fromJson(json.decode(str));

String pendapatanGuruResponseToJson(PendapatanGuruResponse data) => json.encode(data.toJson());

class PendapatanGuruResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  PendapatanGuruResponse({
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

  factory PendapatanGuruResponse.fromJson(Map<String, dynamic> json){
    if(json["data"]==null){
      return PendapatanGuruResponse(
        app: json["app"],
        version: json["version"],
        release: json["release"],
        datetime: DateTime.parse(json["datetime"]),
        timestamp: json["timestamp"],
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );
    }else{
      return PendapatanGuruResponse(
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
    }
  }

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
  String tbBookId;
  String kodeKelas;
  String tbGuruId;
  String ammount;
  String keterangan;
  String status;
  String namaMurid;
  String namaMapel;
  String tgl;
  String metodePembayaran;

  Datum({
    this.id,
    this.tbBookId,
    this.kodeKelas,
    this.tbGuruId,
    this.ammount,
    this.keterangan,
    this.status,
    this.namaMurid,
    this.namaMapel,
    this.tgl,
    this.metodePembayaran,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    tbBookId: json["tb_book_id"],
    kodeKelas: json["kode_kelas"],
    tbGuruId: json["tb_guru_id"],
    ammount: json["ammount"],
    keterangan: json["keterangan"],
    status: json["status"],
    namaMurid: json["nama_murid"],
    namaMapel: json["nama_mapel"],
    tgl: json["tgl"],
    metodePembayaran: json["metode_pembayaran"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tb_book_id": tbBookId,
    "kode_kelas": kodeKelas,
    "tb_guru_id": tbGuruId,
    "ammount": ammount,
    "keterangan": keterangan,
    "status": status,
    "nama_murid": namaMurid,
    "nama_mapel": namaMapel,
    "tgl": tgl,
    "metode_pembayaran": metodePembayaran,
  };
}
