// To parse this JSON data, do
//
//     final updateBiayaLesResponse = updateBiayaLesResponseFromJson(jsonString);

import 'dart:convert';

UpdateBiayaLesResponse updateBiayaLesResponseFromJson(String str) => UpdateBiayaLesResponse.fromJson(json.decode(str));

String updateBiayaLesResponseToJson(UpdateBiayaLesResponse data) => json.encode(data.toJson());

class UpdateBiayaLesResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Data data;

  UpdateBiayaLesResponse({
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

  factory UpdateBiayaLesResponse.fromJson(Map<String, dynamic> json) => UpdateBiayaLesResponse(
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
  int tbMapelId;
  int tbGuruId;
  String biaya;
  DateTime createdDate;
  dynamic updatedDate;

  Data({
    this.id,
    this.tbMapelId,
    this.tbGuruId,
    this.biaya,
    this.createdDate,
    this.updatedDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    tbMapelId: json["tb_mapel_id"],
    tbGuruId: json["tb_guru_id"],
    biaya: json["biaya"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tb_mapel_id": tbMapelId,
    "tb_guru_id": tbGuruId,
    "biaya": biaya,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate,
  };
}
