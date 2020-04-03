// To parse this JSON data, do
//
//     final profileGuruV2Response = profileGuruV2ResponseFromJson(jsonString);

import 'dart:convert';

ProfileGuruV2Response profileGuruV2ResponseFromJson(String str) => ProfileGuruV2Response.fromJson(json.decode(str));

String profileGuruV2ResponseToJson(ProfileGuruV2Response data) => json.encode(data.toJson());

class ProfileGuruV2Response {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  DataGuru data;

  ProfileGuruV2Response({
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

  factory ProfileGuruV2Response.fromJson(Map<String, dynamic> json) => ProfileGuruV2Response(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: DataGuru.fromJson(json["data"]),
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

class DataGuru {
  int id;
  String email;
  String password;
  String namaLengkap;
  int jenisKelamin;
  int tbInstansiId;
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
  dynamic dateRegister;
  DateTime createdDate;
  String pendidikan_terakhir;
  String pengalaman_organisasi;
  String pekerjaan;
  String bank;
  String no_rekening;
  String nama_pemilik;

  DataGuru({
    this.id,
    this.email,
    this.password,
    this.namaLengkap,
    this.jenisKelamin,
    this.tbInstansiId,
    this.hp,
    this.masterProvinsiId,
    this.masterKotaId,
    this.masterKecamatanId,
    this.labelProvinsi,
    this.labelKota,
    this.labelKecamatan,
    this.alamatLengkap,
    this.kodeOtp,
    this.foto,
    this.status,
    this.saldo,
    this.isDelete,
    this.dateRegister,
    this.createdDate,
    this.pendidikan_terakhir,
    this.pengalaman_organisasi,
    this.pekerjaan,
    this.bank,
    this.no_rekening,
    this.nama_pemilik,
  });

  factory DataGuru.fromJson(Map<String, dynamic> json) => DataGuru(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    namaLengkap: json["nama_lengkap"],
    jenisKelamin: json["jenis_kelamin"],
    tbInstansiId: json["tb_instansi_id"],
    hp: json["hp"],
    masterProvinsiId: json["master_provinsi"],
    masterKotaId: json["master_kota"],
    masterKecamatanId: json["master_kecamatan"],
    labelProvinsi: json["label_provinsi"],
    labelKota: json["label_kota"],
    labelKecamatan: json["label_kecamatan"],
    alamatLengkap: json["alamat_lengkap"],
    kodeOtp: json["kode_otp"],
    foto: json["foto_profil"],
    status: json["status"],
    saldo: json["saldo"],
    isDelete: json["is_delete"],
    dateRegister: json["date_register"] == null ?  null :DateTime.parse(json["date_register"]),
    createdDate: DateTime.parse(json["created_date"]),
    pendidikan_terakhir: json["pendidikan_terakhir"],
    pengalaman_organisasi: json["pengalaman_organisasi"],
    pekerjaan: json["pekerjaan"],
    bank: json["bank"],
    no_rekening: json["no_rekening"],
    nama_pemilik: json["nama_pemilik"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "nama_lengkap": namaLengkap,
    "jenis_kelamin": jenisKelamin,
    "tb_instansi_id": tbInstansiId,
    "hp": hp,
    "master_provinsi": masterProvinsiId,
    "master_kota": masterKotaId,
    "master_kecamatan": masterKecamatanId,
    "label_provinsi": labelProvinsi,
    "label_kota": labelKota,
    "label_kecamatan": labelKecamatan,
    "alamat_lengkap": alamatLengkap,
    "kode_otp": kodeOtp,
    "foto_profil": foto,
    "status": status,
    "saldo": saldo,
    "is_delete": isDelete,
    "date_register": dateRegister.toIso8601String(),
    "created_date": createdDate.toIso8601String(),
    "pendidikan_terakhir": pendidikan_terakhir,
    "pengalaman_organisasi": pengalaman_organisasi,
    "pekerjaan": pekerjaan,
    "bank": bank,
    "no_rekening": no_rekening,
    "nama_pemilik": nama_pemilik,
  };
}
