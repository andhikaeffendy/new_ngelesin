import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/biaya_les_response.dart';
import 'package:new_ngelesin/api_response_model/get_kategori_response.dart';
import 'package:new_ngelesin/api_response_model/list_all_mapel_response.dart';
import 'package:new_ngelesin/api_response_model/login_guru_response.dart';
import 'package:new_ngelesin/api_response_model/profile_guru_v2_response.dart';
import 'package:new_ngelesin/login_guru.dart';

import 'temp_var.dart' as globalTemp;
import 'account_information.dart' as account_info;
import 'AppSession.dart';

reLogin(BuildContext context) async {
  String role = await inSession();
  if(role == "")
    return ;
  loginGuruRequest(account_info.email, account_info.password).then((loginRequest){
    if(loginRequest.status=="success") {
      account_info.loginGuruResponse = loginRequest;
      getProfileRequest("token", account_info.email, account_info.password);
      getMapelRequest();
      getKategori();
      getBiayaMapel();
      account_info.reLogin = true;
    } else {
      destroySession();
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new LoginGuru()));
    }
  });
}

Future<LoginGuruResponse> loginGuruRequest(String email, String password) async {
  String url =
      account_info.api_url+"?r=v1/guru/login";
  Dio dio = new Dio();
  Response response;

  FormData formData =
  new FormData.fromMap({"email": email, "password": password});

  response = await dio.post(url, data: formData);
  print(response.toString());

  LoginGuruResponse loginGuruResponse =
  loginGuruResponseFromJson(response.toString());

  return loginGuruResponse;
}

getProfileRequest(String token, String email, String password) async {
  String url = account_info.api_url+"?r=v1/guru/profile&token&email&password";

  var dio = Dio();
  dio.interceptors.add(
      InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            var customHeaders = {
              'content-type': 'application/json',
              'email': email,
              'password': password,
            };
            options.headers.addAll(customHeaders);
            return options;
          }
      )
  );

  Response response = await dio.get(url);
  print("GET PROFILE REQUEST : " + response.data.toString());
  ProfileGuruV2Response profileGuruV2Response;
  profileGuruV2Response = profileGuruV2ResponseFromJson(response.toString());

  account_info.profileGuruV2Response = profileGuruV2Response;
}

getMapelRequest() async {
  String url = account_info.api_url+"?r=v1/home/mapel";
  Dio dio = new Dio();
  Response response;

  response = await dio.get(url);
  print(response.toString());

  ListAllMapelResponse mapelResponse =
  listAllMapelResponseFromJson(response.toString());

  globalTemp.listAllMapel = mapelResponse;
}

getKategori() async{
  String url = account_info.api_url+"/dev/api/web/index.php?r=/home/kategori";
  Dio dio = new Dio();
  Response response;

  response = await dio.get(url);

  print("Ini Response Kategori : " + response.toString());
  print("Ini Response Stat : " + response.statusMessage );

  GetKategoriMapel kategoriResponses =
  getKategoriMapelFromJson(response.toString());

  globalTemp.listKategoriMapel = kategoriResponses;

  return kategoriResponses;
}

getBiayaMapel() async{
  String url = account_info.api_url+"/dev/api/web/index.php?r=/guru-mapel/mapel";
  Dio dio = new Dio();
  print(account_info.email + account_info.password);
  dio.interceptors.add(
      InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            var customHeaders = {
              'email': account_info.email,
              'password': account_info.password,
            };
            options.headers.addAll(customHeaders);
            return options;
          }
      )
  );
  Response response;

  response = await dio.get(url);

  print("Ini Response : " + response.toString());
  print("Ini Response Stat : " + response.statusMessage );

  BiayaLesResponse biayaLesResponse =
  biayaLesResponseFromJson(response.toString());

  globalTemp.biayaLesResponse = biayaLesResponse;
}