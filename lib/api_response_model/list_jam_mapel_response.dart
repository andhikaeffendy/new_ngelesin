// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListJamMapelResponse listJamMapelResponseFromJson(String str) => ListJamMapelResponse.fromJson(json.decode(str));

String listJamMapelResponseToJson(ListJamMapelResponse data) => json.encode(data.toJson());

class ListJamMapelResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<JamMapel> data;

  ListJamMapelResponse({
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

  factory ListJamMapelResponse.fromJson(Map<String, dynamic> json) {
    List<JamMapel> result = new List();
    for(int i=1;i<25;i++){
      if(json["data"][i.toString()] == null )
        break;
      result.add(JamMapel.fromJson(json["data"][i.toString()]));
    }
    return ListJamMapelResponse(
      app: json["app"],
      version: json["version"],
      release: json["release"],
      datetime: DateTime.parse(json["datetime"]),
      timestamp: json["timestamp"],
      status: json["status"],
      code: json["code"],
      message: json["message"],
      data: result,
    );
  }

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

class JamMapel {
  int id;
  int kode;
  String jam_mulai;
  String jam_selesai;
  String status_jam;

  JamMapel({
    this.id,
    this.kode,
    this.jam_mulai,
    this.jam_selesai,
    this.status_jam,
  });

  factory JamMapel.fromJson(Map<String, dynamic> json) => JamMapel(
    id: json["id"],
    kode: json["kode"],
    jam_mulai: json["jam_mulai"],
    jam_selesai: json["jam_selesai"],
    status_jam: json["status_jam"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode": kode,
    "jam_mulai": jam_mulai,
    "jam_selesai": jam_selesai,
    "status_jam": status_jam,
  };



  String jadwal(){
    return this.jam_mulai+"-"+this.jam_selesai;
  }
}
