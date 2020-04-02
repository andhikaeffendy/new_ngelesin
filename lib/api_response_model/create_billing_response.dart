// To parse this JSON data, do
//
//     final createBillingResponse = createBillingResponseFromJson(jsonString);

import 'dart:convert';

CreateBillingResponse createBillingResponseFromJson(String str) => CreateBillingResponse.fromJson(json.decode(str));

String createBillingResponseToJson(CreateBillingResponse data) => json.encode(data.toJson());

class CreateBillingResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  int code;
  String message;
  Data data;

  CreateBillingResponse({
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

  factory CreateBillingResponse.fromJson(Map<String, dynamic> json) {
    if(json["data"]==null){
      return CreateBillingResponse(
        app: json["app"],
        version: json["version"],
        release: json["release"],
        datetime: DateTime.parse(json["datetime"]),
        timestamp: json["timestamp"],
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );
    }else{
      return CreateBillingResponse(
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
    }

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
    "data": data.toJson(),
  };
}

class Data {
  String trxId;
  String virtualAccount;

  Data({
    this.trxId,
    this.virtualAccount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    trxId: json["trx_id"],
    virtualAccount: json["virtual_account"],
  );

  Map<String, dynamic> toJson() => {
    "trx_id": trxId,
    "virtual_account": virtualAccount,
  };
}
