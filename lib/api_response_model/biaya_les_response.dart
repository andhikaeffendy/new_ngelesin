// To parse this JSON data, do
//
//     final biayaLesResponse = biayaLesResponseFromJson(jsonString);

import 'dart:convert';

BiayaLesResponse biayaLesResponseFromJson(String str) => BiayaLesResponse.fromJson(json.decode(str));

String biayaLesResponseToJson(BiayaLesResponse data) => json.encode(data.toJson());

class BiayaLesResponse {
  bool status;
  int kode;
  Data data;

  BiayaLesResponse({
    this.status,
    this.kode,
    this.data,
  });

  factory BiayaLesResponse.fromJson(Map<String, dynamic> json) => BiayaLesResponse(
    status: json["status"],
    kode: json["kode"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
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
  String fotoProfil;
  String pekerjaan;
  String pendidikanTerakhir;
  String pengalamanOrganisasi;
  String alamatLengkap;
  String biodataSingkat;
  String tentangSaya;
  String ktp;
  String fotoKtp;
  String npwp;
  String bank;
  String noRekening;
  String namaPemilik;
  dynamic dateRegister;
  String kodeOtp;
  String saldo;
  int status;
  int cancelPoint;
  String playerId;
  int isDelete;
  DateTime createdDate;
  DateTime updatedDate;
  String passwordHash;
  List<Mapel> mapel;

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
    this.passwordHash,
    this.mapel,
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
    updatedDate: DateTime.parse(json["updated_date"]),
    passwordHash: json["passwordHash"],
    mapel: List<Mapel>.from(json["mapel"].map((x) => Mapel.fromJson(x))),
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
    "updated_date": updatedDate.toIso8601String(),
    "passwordHash": passwordHash,
    "mapel": List<dynamic>.from(mapel.map((x) => x.toJson())),
  };
}

class Mapel {
  int tbGuruMapelId;
  String tingkatan;
  String nama;
  String biaya;

  Mapel({
    this.tbGuruMapelId,
    this.tingkatan,
    this.nama,
    this.biaya,
  });

  factory Mapel.fromJson(Map<String, dynamic> json) => Mapel(
    tbGuruMapelId: json["tb_guru_mapel_id"],
    tingkatan: json["tingkatan"],
    nama: json["nama"],
    biaya: json["biaya"],
  );

  Map<String, dynamic> toJson() => {
    "tb_guru_mapel_id": tbGuruMapelId,
    "tingkatan": tingkatan,
    "nama": nama,
    "biaya": biaya,
  };
}
