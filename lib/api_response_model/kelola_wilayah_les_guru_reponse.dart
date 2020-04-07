// To parse this JSON data, do
//
//     final kelolaWilayahLesGuruResponse = kelolaWilayahLesGuruResponseFromJson(jsonString);

import 'dart:convert';

KelolaWilayahLesGuruResponse kelolaWilayahLesGuruResponseFromJson(String str) => KelolaWilayahLesGuruResponse.fromJson(json.decode(str));

String kelolaWilayahLesGuruResponseToJson(KelolaWilayahLesGuruResponse data) => json.encode(data.toJson());

class KelolaWilayahLesGuruResponse {
  bool status;
  int kode;
  List<Datum> data;

  KelolaWilayahLesGuruResponse({
    this.status,
    this.kode,
    this.data,
  });

  factory KelolaWilayahLesGuruResponse.fromJson(Map<String, dynamic> json) => KelolaWilayahLesGuruResponse(
    status: json["status"],
    kode: json["kode"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "kode": kode,
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

enum Kota { BANDUNG, BANDUNG_BARAT, BEKASI, BOGOR, CIMAHI, DEPOK, JAKARTA_BARAT, JAKARTA_PUSAT, JAKARTA_SELATAN, JAKARTA_TIMUR, JAKARTA_UTARA, MEDAN, SEMARANG, SURABAYA, TANGERANG, TANGERANG_SELATAN, YOGYAKARTA }

final kotaValues = EnumValues({
  "Bandung": Kota.BANDUNG,
  "Bandung Barat": Kota.BANDUNG_BARAT,
  "Bekasi": Kota.BEKASI,
  "Bogor": Kota.BOGOR,
  "Cimahi": Kota.CIMAHI,
  "Depok": Kota.DEPOK,
  "Jakarta Barat": Kota.JAKARTA_BARAT,
  "Jakarta Pusat": Kota.JAKARTA_PUSAT,
  "Jakarta Selatan": Kota.JAKARTA_SELATAN,
  "Jakarta Timur": Kota.JAKARTA_TIMUR,
  "Jakarta Utara": Kota.JAKARTA_UTARA,
  "Medan": Kota.MEDAN,
  "Semarang": Kota.SEMARANG,
  "Surabaya": Kota.SURABAYA,
  "Tangerang": Kota.TANGERANG,
  "Tangerang Selatan": Kota.TANGERANG_SELATAN,
  "Yogyakarta": Kota.YOGYAKARTA
});

enum Provinsi { JAWA_BARAT, DKI_JAKARTA, SUMATERA_UTARA, JAWA_TENGAH, JAWA_TIMUR, BANTEN, DI_YOGYAKARTA }

final provinsiValues = EnumValues({
  "Banten": Provinsi.BANTEN,
  "DI Yogyakarta": Provinsi.DI_YOGYAKARTA,
  "DKI Jakarta": Provinsi.DKI_JAKARTA,
  "Jawa Barat": Provinsi.JAWA_BARAT,
  "Jawa Tengah": Provinsi.JAWA_TENGAH,
  "Jawa Timur": Provinsi.JAWA_TIMUR,
  "Sumatera Utara": Provinsi.SUMATERA_UTARA
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
