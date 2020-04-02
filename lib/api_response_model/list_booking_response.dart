// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListBookingResponse listBookingResponseFromJson(String str) => ListBookingResponse.fromJson(json.decode(str));

String listBookingResponseToJson(ListBookingResponse data) => json.encode(data.toJson());

class ListBookingResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Booking> data;

  ListBookingResponse({
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

  factory ListBookingResponse.fromJson(Map<String, dynamic> json) => ListBookingResponse(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Booking>.from(json["data"].map((x) => Booking.fromJson(x))),
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

class Booking {
  String id;
  String kode_kelas;
  DateTime tgl;
  String jam_mulai;
  String jam_selesai;
  String tingkatan;
  String mapel;
  String guru;
  String siswa;
  String lokasi;
  String alamat;
  String status_kelas;
  String biaya;
  String metode_pembayaran;
  String foto_siswa;
  String foto_guru;
  String hp_siswa;
  String hp_guru;
  String jumlah_siswa;
  String discount;
  String kode_voucher;

  Booking({
    this.id,
    this.kode_kelas,
    this.tgl,
    this.jam_mulai,
    this.jam_selesai,
    this.tingkatan,
    this.mapel,
    this.guru,
    this.siswa,
    this.lokasi,
    this.alamat,
    this.status_kelas,
    this.biaya,
    this.metode_pembayaran,
    this.foto_siswa,
    this.foto_guru,
    this.hp_siswa,
    this.hp_guru,
    this.jumlah_siswa,
    this.discount,
    this.kode_voucher,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    kode_kelas: json["kode_kelas"],
    tgl: DateTime.parse(json["tgl"]),
    jam_mulai: json["jam_mulai"],
    jam_selesai: json["jam_selesai"],
    tingkatan: json["tingkatan"],
    mapel: json["mapel"],
    guru: json["guru"],
    siswa: json["siswa"],
    lokasi: json["lokasi"],
    alamat: json["alamat"],
    status_kelas: json["status_kelas"],
    biaya: json["biaya"],
    metode_pembayaran: json["metode_pembayaran"],
    foto_siswa: json["foto_siswa"] == null ? "https://www.freeiconspng.com/uploads/school-student-icon-18.png" : json["foto_siswa"],
    foto_guru: json["foto_guru"] == null ? "https://cdn0.iconfinder.com/data/icons/people-occupations-icons-rounded/110/Teacher-512.png" : json["foto_guru"],
    hp_siswa: json["hp_siswa"],
    hp_guru: json["hp_guru"] ,
    jumlah_siswa: json["jumlah_siswa"] ,
    discount: json["discount"] ,
    kode_voucher: json["kode_voucher"] == null ? "" : json["kode_voucher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_kelas": kode_kelas,
    "tgl": tgl,
    "jam_mulai": jam_mulai,
    "jam_selesai": jam_selesai,
    "tingkatan": tingkatan,
    "mapel": mapel,
    "guru": guru,
    "siswa": siswa,
    "lokasi": lokasi,
    "alamat": alamat,
    "status_kelas": status_kelas,
    "biaya": biaya,
    "metode_pembayaran": metode_pembayaran,
    "foto_siswa": foto_siswa,
    "foto_guru": foto_guru,
    "hp_siswa": hp_siswa,
    "hp_guru": hp_guru,
    "jumlah_siswa": jumlah_siswa,
    "discount": discount,
    "kode_voucher": kode_voucher,
  };
}
