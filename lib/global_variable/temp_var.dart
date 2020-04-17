import 'package:new_ngelesin/api_response_model/biaya_les_response.dart';
import 'package:new_ngelesin/api_response_model/get_kategori_response.dart';
import 'package:new_ngelesin/api_response_model/list_all_mapel_response.dart';

int provId = 0;
int kotaId = 0;
int kecId = 0 ;
int phoneNumber;
int idKelolaMapel;

ListAllMapelResponse listAllMapel;
GetKategoriMapel listKategoriMapel;
BiayaLesResponse biayaLesResponse;

destroyInfo(){
  listAllMapel = null;
  listKategoriMapel = null;
  biayaLesResponse = null;
}
