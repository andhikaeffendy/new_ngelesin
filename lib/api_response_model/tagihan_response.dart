// To parse this JSON data, do
//
//     final tagihanResponse = tagihanResponseFromJson(jsonString);

import 'dart:convert';

TagihanResponse tagihanResponseFromJson(String str) => TagihanResponse.fromJson(json.decode(str));

String tagihanResponseToJson(TagihanResponse data) => json.encode(data.toJson());

class TagihanResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  TagihanResponse({
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

  factory TagihanResponse.fromJson(Map<String, dynamic> json){
    if(json["data"]==null){
      return TagihanResponse(
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
      return TagihanResponse(
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
  String kodeKelas;
  DateTime tgl;
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
    this.jumlahSiswa,
    this.discount,
    this.kodeVoucher,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    kodeKelas: json["kode_kelas"],
    tgl: DateTime.parse(json["tgl"]),
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
    jumlahSiswa: json["jumlah_siswa"],
    discount: json["discount"],
    kodeVoucher: json["kode_voucher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_kelas": kodeKelas,
    "tgl": "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
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
    "jumlah_siswa": jumlahSiswa,
    "discount": discount,
    "kode_voucher": kodeVoucher,
  };
}
