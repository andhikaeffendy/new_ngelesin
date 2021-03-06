// To parse this JSON data, do
//
//     final listKotaResponse = listKotaResponseFromJson(jsonString);

import 'dart:convert';

ListKotaResponse listKotaResponseFromJson(String str) => ListKotaResponse.fromJson(json.decode(str));

String listKotaResponseToJson(ListKotaResponse data) => json.encode(data.toJson());

class ListKotaResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  ListKotaResponse({
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

  factory ListKotaResponse.fromJson(Map<String, dynamic> json) => ListKotaResponse(
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
  Type type;
  String kota;
  String pos;

  Datum({
    this.id,
    this.provinsiId,
    this.provinsi,
    this.type,
    this.kota,
    this.pos,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    provinsiId: json["provinsi_id"],
    provinsi: provinsiValues.map[json["provinsi"]],
    type: typeValues.map[json["type"]],
    kota: json["kota"],
    pos: json["pos"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provinsi_id": provinsiId,
    "provinsi": provinsiValues.reverse[provinsi],
    "type": typeValues.reverse[type],
    "kota": kota,
    "pos": pos,
  };
}

enum Provinsi { JAWA_BARAT }

final provinsiValues = EnumValues({
  "Jawa Barat": Provinsi.JAWA_BARAT
});

enum Type { KABUPATEN, KOTA }

final typeValues = EnumValues({
  "Kabupaten": Type.KABUPATEN,
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
