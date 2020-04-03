// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

GlobalResponse globalResponseFromJson(String str) => GlobalResponse.fromJson(json.decode(str));

String globalResponseToJson(GlobalResponse data) => json.encode(data.toJson());

class GlobalResponse {
  String status;
  String code;
  String message;

  GlobalResponse({
    this.status,
    this.code,
    this.message,
  });

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => GlobalResponse(
    status: json["status"] is String ? json["status"] : json["status"] == true ? "success" : "fail" ,
    code: json.containsKey("code") ? json["code"] : json["kode"] == 1 ? "200" : "400",
    message: json.containsKey("message") ? json["message"] : json["pesan"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
  };
}