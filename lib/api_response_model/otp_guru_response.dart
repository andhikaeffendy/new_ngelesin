// To parse this JSON data, do
//
//     final otpGuruResponse = otpGuruResponseFromJson(jsonString);

import 'dart:convert';

OtpGuruResponse otpGuruResponseFromJson(String str) => OtpGuruResponse.fromJson(json.decode(str));

String otpGuruResponseToJson(OtpGuruResponse data) => json.encode(data.toJson());

class OtpGuruResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Data data;

  OtpGuruResponse({
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

  factory OtpGuruResponse.fromJson(Map<String, dynamic> json) => OtpGuruResponse(
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
  int tbInstansiId;
  String email;
  String password;
  String namaLengkap;
  String hp;
  int jenisKelamin;
  dynamic masterProvinsi;
  dynamic masterKota;
  dynamic masterKecamatan;
  dynamic fotoProfil;
  dynamic pekerjaan;
  String pendidikanTerakhir;
  String pengalamanOrganisasi;
  String alamatLengkap;
  dynamic biodataSingkat;
  dynamic tentangSaya;
  dynamic ktp;
  dynamic fotoKtp;
  dynamic npwp;
  dynamic bank;
  dynamic noRekening;
  dynamic namaPemilik;
  dynamic dateRegister;
  String kodeOtp;
  dynamic saldo;
  int status;
  dynamic cancelPoint;
  dynamic playerId;
  int isDelete;
  DateTime createdDate;
  dynamic updatedDate;

  Data({
    this.id,
    this.tbInstansiId,
    this.email,
    this.password,
    this.namaLengkap,
    this.hp,
    this.jenisKelamin,
    this.masterProvinsi,
    this.masterKota,
    this.masterKecamatan,
    this.fotoProfil,
    this.pekerjaan,
    this.pendidikanTerakhir,
    this.pengalamanOrganisasi,
    this.alamatLengkap,
    this.biodataSingkat,
    this.tentangSaya,
    this.ktp,
    this.fotoKtp,
    this.npwp,
    this.bank,
    this.noRekening,
    this.namaPemilik,
    this.dateRegister,
    this.kodeOtp,
    this.saldo,
    this.status,
    this.cancelPoint,
    this.playerId,
    this.isDelete,
    this.createdDate,
    this.updatedDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    tbInstansiId: json["tb_instansi_id"],
    email: json["email"],
    password: json["password"],
    namaLengkap: json["nama_lengkap"],
    hp: json["hp"],
    jenisKelamin: json["jenis_kelamin"],
    masterProvinsi: json["master_provinsi"],
    masterKota: json["master_kota"],
    masterKecamatan: json["master_kecamatan"],
    fotoProfil: json["foto_profil"],
    pekerjaan: json["pekerjaan"],
    pendidikanTerakhir: json["pendidikan_terakhir"],
    pengalamanOrganisasi: json["pengalaman_organisasi"],
    alamatLengkap: json["alamat_lengkap"],
    biodataSingkat: json["biodata_singkat"],
    tentangSaya: json["tentang_saya"],
    ktp: json["ktp"],
    fotoKtp: json["foto_ktp"],
    npwp: json["npwp"],
    bank: json["bank"],
    noRekening: json["no_rekening"],
    namaPemilik: json["nama_pemilik"],
    dateRegister: json["date_register"],
    kodeOtp: json["kode_otp"],
    saldo: json["saldo"],
    status: json["status"],
    cancelPoint: json["cancel_point"],
    playerId: json["player_id"],
    isDelete: json["is_delete"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tb_instansi_id": tbInstansiId,
    "email": email,
    "password": password,
    "nama_lengkap": namaLengkap,
    "hp": hp,
    "jenis_kelamin": jenisKelamin,
    "master_provinsi": masterProvinsi,
    "master_kota": masterKota,
    "master_kecamatan": masterKecamatan,
    "foto_profil": fotoProfil,
    "pekerjaan": pekerjaan,
    "pendidikan_terakhir": pendidikanTerakhir,
    "pengalaman_organisasi": pengalamanOrganisasi,
    "alamat_lengkap": alamatLengkap,
    "biodata_singkat": biodataSingkat,
    "tentang_saya": tentangSaya,
    "ktp": ktp,
    "foto_ktp": fotoKtp,
    "npwp": npwp,
    "bank": bank,
    "no_rekening": noRekening,
    "nama_pemilik": namaPemilik,
    "date_register": dateRegister,
    "kode_otp": kodeOtp,
    "saldo": saldo,
    "status": status,
    "cancel_point": cancelPoint,
    "player_id": playerId,
    "is_delete": isDelete,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate,
  };
}
