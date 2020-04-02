// To parse this JSON data, do
//
//     final simpanJadwalMengajarResponse = simpanJadwalMengajarResponseFromJson(jsonString);

import 'dart:convert';

SimpanJadwalMengajarResponse simpanJadwalMengajarResponseFromJson(String str) => SimpanJadwalMengajarResponse.fromJson(json.decode(str));

String simpanJadwalMengajarResponseToJson(SimpanJadwalMengajarResponse data) => json.encode(data.toJson());

class SimpanJadwalMengajarResponse {
  bool status;
  int kode;
  List<dynamic> data;
  List<dynamic> post;
  String pesan;

  SimpanJadwalMengajarResponse({
    this.status,
    this.kode,
    this.data,
    this.post,
    this.pesan,
  });

  factory SimpanJadwalMengajarResponse.fromJson(Map<String, dynamic> json) {
    if(json["data"]==null && json["post"]==null){
      return SimpanJadwalMengajarResponse(
        status: json["status"],
        kode: json["kode"],
        pesan: json["pesan"],
      );
    }else if(json["post"]==null){
      return SimpanJadwalMengajarResponse(
        status: json["status"],
        kode: json["kode"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        pesan: json["pesan"],
      );
    }else if(json["data"]==null){
      return SimpanJadwalMengajarResponse(
        status: json["status"],
        kode: json["kode"],
        post: List<dynamic>.from(json["post"].map((x) => x)),
        pesan: json["pesan"],
      );
    }else{
      return SimpanJadwalMengajarResponse(
        status: json["status"],
        kode: json["kode"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        post: List<dynamic>.from(json["post"].map((x) => x)),
        pesan: json["pesan"],
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": List<dynamic>.from(data.map((x) => x)),
    "post": List<dynamic>.from(post.map((x) => x)),
    "pesan": pesan,
  };
}
