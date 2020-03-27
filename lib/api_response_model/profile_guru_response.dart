// To parse this JSON data, do
//
//     final profileGuruResponse = profileGuruResponseFromJson(jsonString);

import 'dart:convert';

ProfileGuruResponse profileGuruResponseFromJson(String str) => ProfileGuruResponse.fromJson(json.decode(str));

String profileGuruResponseToJson(ProfileGuruResponse data) => json.encode(data.toJson());

class ProfileGuruResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Data data;

  ProfileGuruResponse({
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

  factory ProfileGuruResponse.fromJson(Map<String, dynamic> json) => ProfileGuruResponse(
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
  Pekerjaan pekerjaan;
//  Profil profil;

  Data({
    this.pekerjaan,
//    this.profil,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pekerjaan: Pekerjaan.fromJson(json["pekerjaan"]),
//    profil: Profil.fromJson(json["profil"]),
  );

  Map<String, dynamic> toJson() => {
    "pekerjaan": pekerjaan.toJson(),
//    "profil": profil.toJson(),
  };
}

class Profil {
  String nama;
  String hp;
  String alamat_lengkap;
  String foto_profil;
  String biodata_singkat;
  String tentang_saya;
  String pendidikan_terakhir;
  String pengalaman_organisasi;
  int rating;
  int suara;

  Profil({
    this.nama,
    this.hp,
    this.alamat_lengkap,
    this.foto_profil,
    this.biodata_singkat,
    this.tentang_saya,
    this.pendidikan_terakhir,
    this.pengalaman_organisasi,
    this.rating,
    this.suara,
  });

  factory Profil.fromJson(Map<String, dynamic> json) => Profil(
    nama: json["nama"],
    hp: json["hp"],
    alamat_lengkap: json["alamat_lengkap"],
    foto_profil: json["foto_profil"] == null ? "https://cdn0.iconfinder.com/data/icons/people-occupations-icons-rounded/110/Teacher-512.png" : json["foto_profil"],
    biodata_singkat: json["biodata_singkat"],
    tentang_saya: json["tentang_saya"],
    pendidikan_terakhir: json["pendidikan_terakhir"],
    pengalaman_organisasi: json["pengalaman_organisasi"],
    rating: json["rating"] is String ? int.parse(json["rating"]) : json["rating"],
    suara: json["suara"] is String ? int.parse(json["suara"]) : json["suara"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "hp": hp,
    "alamat_lengkap": alamat_lengkap,
    "foto_profil": foto_profil,
    "biodata_singkat": biodata_singkat,
    "tentang_saya": tentang_saya,
    "pendidikan_terakhir": pendidikan_terakhir,
    "pengalaman_organisasi": pengalaman_organisasi,
    "rating": rating,
    "suara": suara,
  };
}

class Pekerjaan {
  String pekerjaan;

  Pekerjaan({
    this.pekerjaan,
  });

  factory Pekerjaan.fromJson(Map<String, dynamic> json) => Pekerjaan(
    pekerjaan: json["pekerjaan"],
  );

  Map<String, dynamic> toJson() => {
    "pekerjaan": pekerjaan,
  };
}
