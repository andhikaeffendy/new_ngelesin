// To parse this JSON data, do
//
//     final searchAreaResponse = searchAreaResponseFromJson(jsonString);

import 'dart:convert';

SearchAreaResponse searchAreaResponseFromJson(String str) => SearchAreaResponse.fromJson(json.decode(str));

String searchAreaResponseToJson(SearchAreaResponse data) => json.encode(data.toJson());

class SearchAreaResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  SearchAreaResponse({
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

  factory SearchAreaResponse.fromJson(Map<String, dynamic> json) => SearchAreaResponse(
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
  List<Kota> kota;
  List<Kecamatan> kecamatan;

  Datum({
    this.kota,
    this.kecamatan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    kota: List<Kota>.from(json["kota"].map((x) => Kota.fromJson(x))),
    kecamatan: List<Kecamatan>.from(json["kecamatan"].map((x) => Kecamatan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kota": List<dynamic>.from(kota.map((x) => x.toJson())),
    "kecamatan": List<dynamic>.from(kecamatan.map((x) => x.toJson())),
  };
}

class Kecamatan {
  String idKecamatan;
  String nama;
  String launched;

  Kecamatan({
    this.idKecamatan,
    this.nama,
    this.launched,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
    idKecamatan: json["id_kecamatan"],
    nama: json["nama"],
    launched: json["launched"],
  );

  Map<String, dynamic> toJson() => {
    "id_kecamatan": idKecamatan,
    "nama": nama,
    "launched": launched,
  };
}

class Kota {
  String kota;
  String type;
  String launched;
  String listKecamatanId;

  Kota({
    this.kota,
    this.type,
    this.launched,
    this.listKecamatanId,
  });

  factory Kota.fromJson(Map<String, dynamic> json) => Kota(
    kota: json["kota"],
    type: json["type"],
    launched: json["launched"],
    listKecamatanId: json["list_kecamatan_id"],
  );

  Map<String, dynamic> toJson() => {
    "kota": kota,
    "type": type,
    "launched": launched,
    "list_kecamatan_id": listKecamatanId,
  };
}
