// To parse this JSON data, do
//
//     final historyKelasGuruResponse = historyKelasGuruResponseFromJson(jsonString);

import 'dart:convert';

HistoryKelasGuruResponse historyKelasGuruResponseFromJson(String str) => HistoryKelasGuruResponse.fromJson(json.decode(str));

String historyKelasGuruResponseToJson(HistoryKelasGuruResponse data) => json.encode(data.toJson());

class HistoryKelasGuruResponse {
  bool status;
  int kode;
  List<Datum> data;

  HistoryKelasGuruResponse({
    this.status,
    this.kode,
    this.data,
  });

  factory HistoryKelasGuruResponse.fromJson(Map<String, dynamic> json) => HistoryKelasGuruResponse(
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
  String id;
  String kodeKelas;
  DateTime tgl;
  String jamMulai;
  String jamSelesai;
  Tingkatan tingkatan;
  Mapel mapel;
  Guru guru;
  String siswa;
  String lokasi;
  String alamat;
  String statusKelas;
  dynamic biaya;
  String metodePembayaran;
  String fotoSiswa;
  String fotoGuru;
  String hpSiswa;
  String jumlahSiswa;
  String discount;
  dynamic kodeVoucher;

  Datum({
    this.id,
    this.kodeKelas,
    this.tgl,
    this.jamMulai,
    this.jamSelesai,
    this.tingkatan,
    this.mapel,
    this.guru,
    this.siswa,
    this.lokasi,
    this.alamat,
    this.statusKelas,
    this.biaya,
    this.metodePembayaran,
    this.fotoSiswa,
    this.fotoGuru,
    this.hpSiswa,
    this.jumlahSiswa,
    this.discount,
    this.kodeVoucher,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    kodeKelas: json["kode_kelas"],
    tgl: DateTime.parse(json["tgl"]),
    jamMulai: json["jam_mulai"],
    jamSelesai: json["jam_selesai"],
    tingkatan: tingkatanValues.map[json["tingkatan"]],
    mapel: mapelValues.map[json["mapel"]],
    guru: guruValues.map[json["guru"]],
    siswa: json["siswa"],
    lokasi: json["lokasi"],
    alamat: json["alamat"],
    statusKelas: json["status_kelas"],
    biaya: json["biaya"],
    metodePembayaran: json["metode_pembayaran"],
    fotoSiswa: json["foto_siswa"] == null ? null : json["foto_siswa"],
    fotoGuru: json["foto_guru"],
    hpSiswa: json["hp_siswa"],
    jumlahSiswa: json["jumlah_siswa"],
    discount: json["discount"],
    kodeVoucher: json["kode_voucher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kode_kelas": kodeKelas,
    "tgl": "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
    "jam_mulai": jamMulai,
    "jam_selesai": jamSelesai,
    "tingkatan": tingkatanValues.reverse[tingkatan],
    "mapel": mapelValues.reverse[mapel],
    "guru": guruValues.reverse[guru],
    "siswa": siswa,
    "lokasi": lokasi,
    "alamat": alamat,
    "status_kelas": statusKelas,
    "biaya": biaya,
    "metode_pembayaran": metodePembayaran,
    "foto_siswa": fotoSiswa == null ? null : fotoSiswa,
    "foto_guru": fotoGuru,
    "hp_siswa": hpSiswa,
    "jumlah_siswa": jumlahSiswa,
    "discount": discount,
    "kode_voucher": kodeVoucher,
  };
}

enum Guru { GRACE }

final guruValues = EnumValues({
  "Grace": Guru.GRACE
});

enum Mapel { FISIKA, MATEMATIKA, DANCE_KONTEMPORER, KIMIA }

final mapelValues = EnumValues({
  "Dance Kontemporer": Mapel.DANCE_KONTEMPORER,
  "Fisika": Mapel.FISIKA,
  "Kimia": Mapel.KIMIA,
  "Matematika": Mapel.MATEMATIKA
});

enum Tingkatan { SMP, SMA, LAIN_LAIN }

final tingkatanValues = EnumValues({
  "(Lain-lain)": Tingkatan.LAIN_LAIN,
  "SMA": Tingkatan.SMA,
  "SMP": Tingkatan.SMP
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
