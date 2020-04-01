// To parse this JSON data, do
//
//     final simpanBookingResponse = simpanBookingResponseFromJson(jsonString);

import 'dart:convert';

SimpanBookingResponse simpanBookingResponseFromJson(String str) => SimpanBookingResponse.fromJson(json.decode(str));

String simpanBookingResponseToJson(SimpanBookingResponse data) => json.encode(data.toJson());

class SimpanBookingResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Data data;

  SimpanBookingResponse({
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

  factory SimpanBookingResponse.fromJson(Map<String, dynamic> json) {
    if(json["data"]==null){
      return SimpanBookingResponse(
        app: json["app"],
        version: json["version"],
        release: json["release"],
        datetime: DateTime.parse(json["datetime"]),
        timestamp: json["timestamp"],
        status: json["status"],
        code: json["code"],
        message: json["message"],
        //data: Data.fromJson(json["data"]),
      );
    }else{
      return SimpanBookingResponse(
        app: json["app"],
        version: json["version"],
        release: json["release"],
        datetime: DateTime.parse(json["datetime"]),
        timestamp: json["timestamp"],
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
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
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String tb_siswa_id;
  int tb_slot_jadwal_id;
  String tb_guru_id;
  String tb_mapel_id;
  String tb_lokasi_id;
  String kode_transaksi;
  int total_pertemuan;
  int status_book;
  String jumlah_siswa;
  int biaya;
  int biaya_kafe;
  int nominal_discount;
  String metode_pembayaran;
  DateTime tgl_mulai;
  DateTime tgl_selesai;
  DateTime created_date;

  Data({
    this.id,
    this.tb_siswa_id,
    this.tb_slot_jadwal_id,
    this.tb_guru_id,
    this.tb_mapel_id,
    this.tb_lokasi_id,
    this.kode_transaksi,
    this.total_pertemuan,
    this.status_book,
    this.jumlah_siswa,
    this.biaya,
    this.biaya_kafe,
    this.nominal_discount,
    this.metode_pembayaran,
    this.tgl_mulai,
    this.tgl_selesai,
    this.created_date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    tb_siswa_id: json["tb_siswa_id"],
    tb_slot_jadwal_id: json["tb_slot_jadwal_id"],
    tb_guru_id: json["tb_guru_id"],
    tb_mapel_id: json["tb_mapel_id"],
    tb_lokasi_id: json["tb_lokasi_id"],
    kode_transaksi: json["kode_transaksi"],
    total_pertemuan: json["total_pertemuan"],
    status_book: json["status_book"],
    jumlah_siswa: json["jumlah_siswa"],
    biaya: json["biaya"],
    biaya_kafe: json["biaya_kafe"],
    nominal_discount: json["nominal_discount"],
    metode_pembayaran: json["metode_pembayaran"],
    tgl_mulai: DateTime.parse(json["tgl_mulai"]),
    tgl_selesai: DateTime.parse(json["tgl_selesai"]),
    created_date: DateTime.parse(json["created_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tb_siswa_id": tb_siswa_id,
    "tb_slot_jadwal_id": tb_slot_jadwal_id,
    "tb_guru_id": tb_guru_id,
    "tb_mapel_id": tb_mapel_id,
    "tb_lokasi_id": tb_lokasi_id,
    "kode_transaksi": kode_transaksi,
    "total_pertemuan": total_pertemuan,
    "status_book": status_book,
    "jumlah_siswa": jumlah_siswa,
    "biaya_kafe": biaya_kafe,
    "biaya": biaya,
    "nominal_discount": nominal_discount,
    "metode_pembayaran": metode_pembayaran,
    "tgl_mulai": tgl_mulai.toIso8601String(),
    "tgl_selesai": tgl_selesai.toIso8601String(),
    "created_date": created_date.toIso8601String(),
  };
}
