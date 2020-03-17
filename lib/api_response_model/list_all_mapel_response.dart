// To parse this JSON data, do
//
//     final listAllMapelResponse = listAllMapelResponseFromJson(jsonString);

import 'dart:convert';

ListAllMapelResponse listAllMapelResponseFromJson(String str) => ListAllMapelResponse.fromJson(json.decode(str));

String listAllMapelResponseToJson(ListAllMapelResponse data) => json.encode(data.toJson());

class ListAllMapelResponse {
  String app;
  String version;
  String release;
  DateTime datetime;
  int timestamp;
  String status;
  String code;
  String message;
  List<Datum> data;

  ListAllMapelResponse({
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

  factory ListAllMapelResponse.fromJson(Map<String, dynamic> json) => ListAllMapelResponse(
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

  List<Datum> getAkademikList(){
    List<Datum> akademikList = List<Datum>();
    for(var i = 0; i<data.length;i++){
      if(data[i].tbKategoriId == 1 || data[i].tbKategoriId == 19 || data[i].tbKategoriId == 18){
        akademikList.add(data[i]);
      }
    }
    return akademikList;
  }



  List<Datum> getOlahragalList(){
    List<Datum> newList = List<Datum>();
    for(var i = 0; i<data.length;i++){
      if(data[i].tbKategoriId == 16){
        newList.add(data[i]);
      }
    }
    return newList;
  }

  List<Datum> getBahasaList(){
    List<Datum> newList = List<Datum>();
    for(var i = 0; i<data.length;i++){
      if(data[i].tbKategoriId == 26){
        newList.add(data[i]);
      }
    }
    return newList;
  }

  List<Datum> getKeterampilanList(){
    List<Datum> newList = List<Datum>();
    for(var i = 0; i<data.length;i++){
      if(data[i].tbKategoriId == 27){
        newList.add(data[i]);
      }
    }
    return newList;
  }

  List<Datum> getAnakList(){
    List<Datum> newList = List<Datum>();
    for(var i = 0; i<data.length;i++){
      if(data[i].tbKategoriId == 28){
        newList.add(data[i]);
      }
    }
    return newList;
  }

  List<Datum> getMusikList(){
    List<Datum> newList = List<Datum>();
    for(var i = 0; i<data.length;i++){
      if(data[i].tbKategoriId == 29){
        newList.add(data[i]);
      }
    }
    return newList;
  }

  List<Datum> getLainList(){
    List<Datum> newList = List<Datum>();
    for(var i = 0; i<data.length;i++){
      if(data[i].tbKategoriId == 32){
        newList.add(data[i]);
      }
    }
    return newList;
  }
}

class Datum {
  int id;
  int tbKategoriId;
  int tbKategori2Id;
  String nama;
  int status;
  int urutan;
  int isDelete;
  dynamic createdBy;
  DateTime createdDate;
  dynamic updatedBy;
  DateTime updatedDate;

  Datum({
    this.id,
    this.tbKategoriId,
    this.tbKategori2Id,
    this.nama,
    this.status,
    this.urutan,
    this.isDelete,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    tbKategoriId: json["tb_kategori_id"],
    tbKategori2Id: json["tb_kategori2_id"] == null ? null : json["tb_kategori2_id"],
    nama: json["nama"],
    status: json["status"],
    urutan: json["urutan"] == null ? null : json["urutan"],
    isDelete: json["is_delete"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    updatedBy: json["updated_by"],
    updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tb_kategori_id": tbKategoriId,
    "tb_kategori2_id": tbKategori2Id == null ? null : tbKategori2Id,
    "nama": nama,
    "status": status,
    "urutan": urutan == null ? null : urutan,
    "is_delete": isDelete,
    "created_by": createdBy,
    "created_date": createdDate == null ? null : createdDate.toIso8601String(),
    "updated_by": updatedBy,
    "updated_date": updatedDate == null ? null : updatedDate.toIso8601String(),
  };
}
