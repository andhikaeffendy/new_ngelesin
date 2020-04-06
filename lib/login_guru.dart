import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/get_kategori_response.dart';
import 'package:new_ngelesin/login_murid.dart';
import 'package:new_ngelesin/main.dart';
import 'package:new_ngelesin/register.dart';

import 'api_response_model/biaya_les_response.dart';
import 'api_response_model/kategori_response.dart';
import 'api_response_model/list_all_mapel_response.dart';
import 'api_response_model/login_guru_response.dart';
import 'api_response_model/profile_guru_v2_response.dart';
import 'lupa_password_guru.dart';
import 'global_variable/temp_var.dart' as globalTemp;
import 'global_variable/account_information.dart' as account_info;
import 'global_variable/app_dialog.dart';


class LoginGuru extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginFormGuru(),
    );
  }
}

class LoginFormGuru extends StatefulWidget {
  LoginFormGuru();
  @override
  _LoginFormGuruState createState() {
    return new _LoginFormGuruState();
  }
}

class _LoginFormGuruState extends State<LoginFormGuru> {
  final emailEditTextController = TextEditingController();
  final passwordEditTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mEmail = TextField(
      obscureText: false,
      controller: emailEditTextController,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 18.0),
          hintText: 'Email',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(26.0))),
    );

    final mPassword = TextField(
      obscureText: true,
      controller: passwordEditTextController,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 18.0),
          hintText: 'Password',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(26.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 18.0),
        onPressed: () {
          loginGuruRequest(emailEditTextController.text,
                passwordEditTextController.text)
                .then((task) {
              if (task.status == "success") {
                print("masuk sukses");
                getProfileRequest("token", task.data.email, passwordEditTextController.text);
                getMapelRequest();
                getKategori();
                getBiayaMapel();
                account_info.loginGuruResponse = task;
                account_info.role = "guru";
                account_info.email = emailEditTextController.text;
                account_info.password = passwordEditTextController.text;
                alerDialogLoginSucces(context, "Login", task.message).then((task){
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MainApp(role: "guru")));
                });
              } else {
                alerDialogLoginFail(context, "Login", task.message);
              }
            });
        },
        child: Text('Login',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      child: Image.network(
                        "https://cdn0.iconfinder.com/data/icons/people-occupations-icons-rounded/110/Teacher-512.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 35.0),
                    mEmail,
                    SizedBox(height: 22.0),
                    mPassword,
                    SizedBox(height: 22.0),
                    loginButton,
                    SizedBox(height: 22.0),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new LupaPassword())),
                                  child: Text('Lupa password ?',
                                      textAlign: TextAlign.start,
                                      style: new TextStyle(
                                          color: Colors.red,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                ))),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              child: Text('|',
                                  textAlign: TextAlign.start,
                                  style: new TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext) =>
                                              new Register())),
                                  child: Text('Daftar',
                                      textAlign: TextAlign.start,
                                      style: new TextStyle(
                                          color: Colors.red,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: RaisedButton(
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new LoginMurid())),
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Login Murid Disini"),
        ));
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

    account_info.email = email;
    account_info.password = password;

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

    account_info.email = email;
    account_info.password = password;

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

}
