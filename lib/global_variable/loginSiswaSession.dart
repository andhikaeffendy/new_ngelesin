import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/jwt_login_siswa_response.dart';
import 'package:new_ngelesin/api_response_model/list_all_mapel_response.dart';
import 'package:new_ngelesin/api_response_model/login_siswa_response.dart';
import 'package:new_ngelesin/api_response_model/profile_siswa_response.dart';
import 'package:new_ngelesin/login_murid.dart';

import 'temp_var.dart' as globalTemp;
import 'account_information.dart' as account_info;
import 'AppSession.dart';

reLogin(BuildContext context) async {
  String role = await inSession();
  if(role == "")
    return ;
  loginSiswaRequest(account_info.email, account_info.password).then((loginRequest){
    if(loginRequest.status=="success") {
      account_info.loginSiswaResponseData = loginRequest;
      getMapelRequest();
      getLoginJwt();
      getProfileRequest(loginRequest.data.token, account_info.email, account_info.password);
      account_info.reLogin = true;
    } else {
      destroySession();
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new LoginMurid()));
    }
  });
}

Future<LoginSiswaResponse> loginSiswaRequest(String email, String password) async {
  String url = account_info.api_url+"?r=v1/siswa/login";
  Dio dio = new Dio();
  Response response;

  FormData formData =
  new FormData.fromMap({"email": email, "password": password});

  response = await dio.post(url, data: formData);
  print("Login response : "+response.toString());

  LoginSiswaResponse loginSiswaResponse =
  loginSiswaResponseFromJson(response.toString());

  return loginSiswaResponse;
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

getProfileRequest(String token, String email, String password) async {
  String url = account_info.api_url+"?r=v1/siswa/profile";

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
  ProfileSiswaResponse profileSiswaResponse;
  profileSiswaResponse = profileSiswaResponseFromJson(response.toString());

  account_info.profileSiswaResponse = profileSiswaResponse;
}

getLoginJwt() async{
  String url = 'https://dev.apingelesin.com/api/web/index.php?r=jwt/login-siswa';
  Dio dio = new Dio();
  Response response;

  FormData formData =
  new FormData.fromMap({"email": account_info.email, "password": account_info.password});
  print("jwt run ");

  response = await dio.post(url, data: formData);
  print(response.toString());

  JwtLoginSiswaResponse jwtLoginSiswaResponse =
  jwtLoginSiswaResponseFromJson(response.toString());
  print("jwt token = " + jwtLoginSiswaResponse.data.token);
  account_info.jwtLoginSiswaResponse = jwtLoginSiswaResponse;
}