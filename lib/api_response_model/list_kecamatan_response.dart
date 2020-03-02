// To parse this JSON data, do
//
//     final listKecamatanResponse = listKecamatanResponseFromJson(jsonString);

import 'dart:convert';

ListKecamatanResponse listKecamatanResponseFromJson(String str) => ListKecamatanResponse.fromJson(json.decode(str));

String listKecamatanResponseToJson(ListKecamatanResponse data) => json.encode(data.toJson());

class ListKecamatanResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  ListKecamatanResponse({
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

  factory ListKecamatanResponse.fromJson(Map<String, dynamic> json) => ListKecamatanResponse(
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
  int id;
  int provinsiId;
  Provinsi provinsi;
  int kotaId;
  Kota kota;
  Type type;
  String kecamatan;
  int statusKecamatan;
  int launched;

  Datum({
    this.id,
    this.provinsiId,
    this.provinsi,
    this.kotaId,
    this.kota,
    this.type,
    this.kecamatan,
    this.statusKecamatan,
    this.launched,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    provinsiId: json["provinsi_id"],
    provinsi: provinsiValues.map[json["provinsi"]],
    kotaId: json["kota_id"],
    kota: kotaValues.map[json["kota"]],
    type: typeValues.map[json["type"]],
    kecamatan: json["kecamatan"],
    statusKecamatan: json["status_kecamatan"],
    launched: json["launched"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provinsi_id": provinsiId,
    "provinsi": provinsiValues.reverse[provinsi],
    "kota_id": kotaId,
    "kota": kotaValues.reverse[kota],
    "type": typeValues.reverse[type],
    "kecamatan": kecamatan,
    "status_kecamatan": statusKecamatan,
    "launched": launched,
  };
}

enum Kota { BANDUNG }

final kotaValues = EnumValues({
  "Bandung": Kota.BANDUNG
});

enum Provinsi { JAWA_BARAT }

final provinsiValues = EnumValues({
  "Jawa Barat": Provinsi.JAWA_BARAT
});

enum Type { KOTA }

final typeValues = EnumValues({
  "Kota": Type.KOTA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
