import 'package:new_ngelesin/api_response_model/jwt_login_siswa_response.dart';
import 'package:new_ngelesin/api_response_model/login_guru_response.dart';
import 'package:new_ngelesin/api_response_model/login_siswa_response.dart';
import 'package:new_ngelesin/api_response_model/profile_guru_v2_response.dart';
import 'package:new_ngelesin/api_response_model/profile_siswa_response.dart';

LoginSiswaResponse loginSiswaResponseData;
LoginGuruResponse loginGuruResponse;

String email;
String password;
String role;

ProfileSiswaResponse profileSiswaResponse;
ProfileGuruV2Response profileGuruV2Response;

String base_url = "https://apingelesin.com";
String dev_url = base_url+"/dev/api/web/index.php";
String app_url = base_url+"/app/api/web/index.php";

//SETTING API URL
String api_url = dev_url;

JwtLoginSiswaResponse jwtLoginSiswaResponse;

destroyInfo(){
  loginSiswaResponseData = null;
  loginGuruResponse = null;
  profileSiswaResponse = null;
  profileGuruV2Response = null;
  jwtLoginSiswaResponse = null;
}