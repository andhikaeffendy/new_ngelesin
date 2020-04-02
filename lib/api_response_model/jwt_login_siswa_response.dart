// To parse this JSON data, do
//
//     final jwtLoginSiswaResponse = jwtLoginSiswaResponseFromJson(jsonString);

import 'dart:convert';

JwtLoginSiswaResponse jwtLoginSiswaResponseFromJson(String str) => JwtLoginSiswaResponse.fromJson(json.decode(str));

String jwtLoginSiswaResponseToJson(JwtLoginSiswaResponse data) => json.encode(data.toJson());

class JwtLoginSiswaResponse {
  bool status;
  int kode;
  Data data;
  String pesan;

  JwtLoginSiswaResponse({
    this.status,
    this.kode,
    this.data,
    this.pesan,
  });

  factory JwtLoginSiswaResponse.fromJson(Map<String, dynamic> json) => JwtLoginSiswaResponse(
    status: json["status"],
    kode: json["kode"],
    data: Data.fromJson(json["data"]),
    pesan: json["pesan"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": data.toJson(),
    "pesan": pesan,
  };
}

class Data {
  int id;
  String email;
  String password;
  String passwordHash;
  String namaLengkap;
  int jenisKelamin;
  int tbTingkatanId;
  dynamic instansi;
  String hp;
  int masterProvinsiId;
  int masterKotaId;
  int masterKecamatanId;
  String alamatLengkap;
  String kodeOtp;
  String foto;
  int status;
  int isDelete;
  DateTime dateRegister;
  DateTime createdDate;
  String token;

  Data({
    this.id,
    this.email,
    this.password,
    this.passwordHash,
    this.namaLengkap,
    this.jenisKelamin,
    this.tbTingkatanId,
    this.instansi,
    this.hp,
    this.masterProvinsiId,
    this.masterKotaId,
    this.masterKecamatanId,
    this.alamatLengkap,
    this.kodeOtp,
    this.foto,
    this.status,
    this.isDelete,
    this.dateRegister,
    this.createdDate,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    passwordHash: json["passwordHash"],
    namaLengkap: json["nama_lengkap"],
    jenisKelamin: json["jenis_kelamin"],
    tbTingkatanId: json["tb_tingkatan_id"],
    instansi: json["instansi"],
    hp: json["hp"],
    masterProvinsiId: json["master_provinsi_id"],
    masterKotaId: json["master_kota_id"],
    masterKecamatanId: json["master_kecamatan_id"],
    alamatLengkap: json["alamat_lengkap"],
    kodeOtp: json["kode_otp"],
    foto: json["foto"],
    status: json["status"],
    isDelete: json["is_delete"],
    dateRegister: DateTime.parse(json["date_register"]),
    createdDate: DateTime.parse(json["created_date"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "passwordHash": passwordHash,
    "nama_lengkap": namaLengkap,
    "jenis_kelamin": jenisKelamin,
    "tb_tingkatan_id": tbTingkatanId,
    "instansi": instansi,
    "hp": hp,
    "master_provinsi_id": masterProvinsiId,
    "master_kota_id": masterKotaId,
    "master_kecamatan_id": masterKecamatanId,
    "alamat_lengkap": alamatLengkap,
    "kode_otp": kodeOtp,
    "foto": foto,
    "status": status,
    "is_delete": isDelete,
    "date_register": dateRegister.toIso8601String(),
    "created_date": createdDate.toIso8601String(),
    "token": token,
  };
}
