// To parse this JSON data, do
//
//     final allProvinceResponse = allProvinceResponseFromJson(jsonString);

import 'dart:convert';

ListChatResponse listChatResponseFromJson(String str) => ListChatResponse.fromJson(json.decode(str));

String listChatResponseToJson(ListChatResponse data) => json.encode(data.toJson());

ChatSubmitResponse chatSubmitResponseFromJson(String str) => ChatSubmitResponse.fromJson(json.decode(str));

String chatSubmitResponseToJson(ChatSubmitResponse data) => json.encode(data.toJson());

class ListChatResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Chat> data;

  ListChatResponse({
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

  factory ListChatResponse.fromJson(Map<String, dynamic> json) => ListChatResponse(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"] is String ? json["status"] : json["status"] == true ? "success" : "fail",
    code: json.containsKey("code") ? json["code"] : json["kode"] == 1 ? "200" : "400",
    message: json.containsKey("message") ? json["message"] : json["pesan"],
    data: json["data"] == null ? [] : List<Chat>.from(json["data"].map((x) => Chat.fromJson(x))),
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

class ChatSubmitResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  Chat data;

  ChatSubmitResponse({
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

  factory ChatSubmitResponse.fromJson(Map<String, dynamic> json) => ChatSubmitResponse(
    app: json["app"],
    version: json["version"],
    release: json["release"],
    datetime: DateTime.parse(json["datetime"]),
    timestamp: json["timestamp"],
    status: json["status"] is String ? json["status"] : json["status"] == true ? "success" : "fail",
    code: json.containsKey("code") ? json["code"] : json["kode"] == 1 ? "200" : "400",
    message: json.containsKey("message") ? json["message"] : json["pesan"],
    data: Chat.fromJson(json["data"]),
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

class Chat {
  int message_id;
  int sender_id;
  String sender_name;
  int receiver_id;
  String receiver_name;
  String message;
  int message_type;
  String mapel;
  String kode_kelas;
  DateTime created_at;
  int read_status;

  Chat({
    this.message_id,
    this.sender_id,
    this.sender_name,
    this.receiver_id,
    this.receiver_name,
    this.message,
    this.message_type,
    this.mapel,
    this.kode_kelas,
    this.created_at,
    this.read_status,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    message_id: json["message_id"],
    sender_id: json["sender_id"] == "" ? 0 : json["sender_id"],
    created_at: DateTime.parse(json["created_at"]),
    sender_name: json["sender_name"],
    receiver_id: json["receiver_id"] == "" ? 0 : json["receiver_id"],
    receiver_name: json["receiver_name"],
    message: json["message"],
    message_type: json["message_type"],
    mapel: json["mapel"],
    kode_kelas: json["kode_kelas"],
    read_status: json["read_status"],
  );

  Map<String, dynamic> toJson() => {
    "message_id": message_id,
    "sender_id": sender_id,
    "created_at": created_at,
    "sender_name": sender_name,
    "receiver_id": receiver_id,
    "receiver_name": receiver_name,
    "message": message,
    "message_type": message_type,
    "mapel": mapel,
    "kode_kelas": kode_kelas,
    "read_status": read_status,
  };
}
