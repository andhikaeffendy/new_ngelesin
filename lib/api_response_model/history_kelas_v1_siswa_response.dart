// To parse this JSON data, do
//
//     final historyKelasV1SiswaResponse = historyKelasV1SiswaResponseFromJson(jsonString);

import 'dart:convert';

HistoryKelasV1SiswaResponse historyKelasV1SiswaResponseFromJson(String str) => HistoryKelasV1SiswaResponse.fromJson(json.decode(str));

String historyKelasV1SiswaResponseToJson(HistoryKelasV1SiswaResponse data) => json.encode(data.toJson());

class HistoryKelasV1SiswaResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  HistoryKelasV1SiswaResponse({
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

  factory HistoryKelasV1SiswaResponse.fromJson(Map<String, dynamic> json) => HistoryKelasV1SiswaResponse(
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
  String kodeKelas;
  String tgl;
  String jamMulai;
  String jamSelesai;
  String tingkatan;
  String mapel;
  String guru;
  String siswa;
  String lokasi;
  String alamat;
  String statusKelas;
  String biaya;
  dynamic statusRating;
  String metodePembayaran;
  dynamic fotoSiswa;
  dynamic fotoGuru;
  String hpSiswa;
  String hpGuru;
  String jumlahSiswa;
  String discount;
  dynamic kodeVoucher;

  Datum({
    this.id,
    this.kodeKelas,
    this.tgl,
    this.jamMulai,
    this.jamSelesai,
    this.tingkatan,
    this.mapel,
    this.guru,
    this.siswa,
    this.lokasi,
    this.alamat,
    this.statusKelas,
    this.biaya,
    this.statusRating,
    this.metodePembayaran,
    this.fotoSiswa,
    this.fotoGuru,
    this.hpSiswa,
    this.hpGuru,
    this.jumlahSiswa,
    this.discount,
    this.kodeVoucher,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    kodeKelas: json["kode_kelas"],
    tgl: json["tgl"],
    jamMulai: json["jam_mulai"],
    jamSelesai: json["jam_selesai"],
    tingkatan: json["tingkatan"],
    mapel: json["mapel"],
    guru: json["guru"],
    siswa: json["siswa"],
    lokasi: json["lokasi"],
    alamat: json["alamat"],
    statusKelas: json["status_kelas"],
    biaya: json["biaya"],
    statusRating: json["status_rating"],
    metodePembayaran: json["metode_pembayaran"],
    fotoSiswa: json["foto_siswa"],
    fotoGuru: json["foto_guru"],
    hpSiswa: json["hp_siswa"],
    hpGuru: json["hp_guru"],
    jumlahSiswa: json["jumlah_siswa"],
    discount: json["discount"],
    kodeVoucher: json["kode_voucher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_kelas": kodeKelas,
    "tgl": tgl,
    "jam_mulai": jamMulai,
    "jam_selesai": jamSelesai,
    "tingkatan": tingkatan,
    "mapel": mapel,
    "guru": guru,
    "siswa": siswa,
    "lokasi": lokasi,
    "alamat": alamat,
    "status_kelas": statusKelas,
    "biaya": biaya,
    "status_rating": statusRating,
    "metode_pembayaran": metodePembayaran,
    "foto_siswa": fotoSiswa,
    "foto_guru": fotoGuru,
    "hp_siswa": hpSiswa,
    "hp_guru": hpGuru,
    "jumlah_siswa": jumlahSiswa,
    "discount": discount,
    "kode_voucher": kodeVoucher,
  };
}
