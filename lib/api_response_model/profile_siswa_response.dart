// To parse this JSON data, do
//
//     final profileSiswaResponse = profileSiswaResponseFromJson(jsonString);

import 'dart:convert';

ProfileSiswaResponse profileSiswaResponseFromJson(String str) => ProfileSiswaResponse.fromJson(json.decode(str));

String profileSiswaResponseToJson(ProfileSiswaResponse data) => json.encode(data.toJson());

class ProfileSiswaResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Data data;

  ProfileSiswaResponse({
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

  factory ProfileSiswaResponse.fromJson(Map<String, dynamic> json) => ProfileSiswaResponse(
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
  String email;
  String password;
  String namaLengkap;
  int jenisKelamin;
  int tbTingkatanId;
  dynamic instansi;
  String hp;
  int masterProvinsiId;
  int masterKotaId;
  int masterKecamatanId;
  String labelProvinsi;
  String labelKota;
  String labelKecamatan;
  String labelTingkatan;
  String alamatLengkap;
  String kodeOtp;
  dynamic foto;
  int status;
  String saldo;
  int isDelete;
  DateTime dateRegister;
  DateTime createdDate;

  Data({
    this.id,
    this.email,
    this.password,
    this.namaLengkap,
    this.jenisKelamin,
    this.tbTingkatanId,
    this.instansi,
    this.hp,
    this.masterProvinsiId,
    this.masterKotaId,
    this.masterKecamatanId,
    this.labelProvinsi,
    this.labelKota,
    this.labelKecamatan,
    this.labelTingkatan,
    this.alamatLengkap,
    this.kodeOtp,
    this.foto,
    this.status,
    this.saldo,
    this.isDelete,
    this.dateRegister,
    this.createdDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    namaLengkap: json["nama_lengkap"],
    jenisKelamin: json["jenis_kelamin"],
    tbTingkatanId: json["tb_tingkatan_id"],
    instansi: json["instansi"],
    hp: json["hp"],
    masterProvinsiId: json["master_provinsi_id"],
    masterKotaId: json["master_kota_id"],
    masterKecamatanId: json["master_kecamatan_id"],
    labelProvinsi: json["label_provinsi"],
    labelKota: json["label_kota"],
    labelKecamatan: json["label_kecamatan"],
    labelTingkatan: json["label_tingkatan"],
    alamatLengkap: json["alamat_lengkap"],
    kodeOtp: json["kode_otp"],
    foto: json["foto"],
    status: json["status"],
    saldo: json["saldo"],
    isDelete: json["is_delete"],
    dateRegister: DateTime.parse(json["date_register"]),
    createdDate: DateTime.parse(json["created_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "nama_lengkap": namaLengkap,
    "jenis_kelamin": jenisKelamin,
    "tb_tingkatan_id": tbTingkatanId,
    "instansi": instansi,
    "hp": hp,
    "master_provinsi_id": masterProvinsiId,
    "master_kota_id": masterKotaId,
    "master_kecamatan_id": masterKecamatanId,
    "label_provinsi": labelProvinsi,
    "label_kota": labelKota,
    "label_kecamatan": labelKecamatan,
    "label_tingkatan": labelTingkatan,
    "alamat_lengkap": alamatLengkap,
    "kode_otp": kodeOtp,
    "foto": foto,
    "status": status,
    "saldo": saldo,
    "is_delete": isDelete,
    "date_register": dateRegister.toIso8601String(),
    "created_date": createdDate.toIso8601String(),
  };
}
