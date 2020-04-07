// To parse this JSON data, do
//
//     final updateProfileGuru2Response = updateProfileGuru2ResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileGuru2Response updateProfileGuru2ResponseFromJson(String str) => UpdateProfileGuru2Response.fromJson(json.decode(str));

String updateProfileGuru2ResponseToJson(UpdateProfileGuru2Response data) => json.encode(data.toJson());

class UpdateProfileGuru2Response {
  bool status;
  int kode;
  List<dynamic> data;
  String pesan;

  UpdateProfileGuru2Response({
    this.status,
    this.kode,
    this.data,
    this.pesan,
  });

  factory UpdateProfileGuru2Response.fromJson(Map<String, dynamic> json) {
    if(json['data']==null){
      return UpdateProfileGuru2Response(
        status: json["status"],
        kode: json["kode"],
        pesan: json["pesan"],
      );
    }else{
      return UpdateProfileGuru2Response(
        status: json["status"],
        kode: json["kode"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        pesan: json["pesan"],
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
    "data": List<dynamic>.from(data.map((x) => x)),
    "pesan": pesan,
  };
}
