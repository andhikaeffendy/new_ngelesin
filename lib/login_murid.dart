import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_all_mapel_response.dart';
import 'package:new_ngelesin/api_response_model/login_siswa_response.dart';
import 'package:new_ngelesin/api_response_model/profile_siswa_response.dart';
import 'package:new_ngelesin/main.dart';
import 'package:new_ngelesin/register.dart';
import 'api_response_model/jwt_login_siswa_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'global_variable/temp_var.dart' as globalTemp;

import 'login_guru.dart';
import 'lupa_password_siswa.dart';

class LoginMurid extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginFormMurid(),
    );
  }
}

class LoginFormMurid extends StatefulWidget {
  LoginFormMurid();
  @override
  _LoginFormMuridState createState() {
    return new _LoginFormMuridState();
  }
}

class _LoginFormMuridState extends State<LoginFormMurid> {
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
          FutureBuilder(
            future: loginSiswaRequest(emailEditTextController.text,
                    passwordEditTextController.text)
                .then((task) {
              if (task.status == "success") {
                print("masuk sukses");
                getMapelRequest();
                getProfileRequest(task.data.token, task.data.email, passwordEditTextController.text);
                account_info.loginSiswaResponseData = task;
                account_info.role = "murid";
                account_info.email = emailEditTextController.text;
                account_info.password = passwordEditTextController.text;

                getLoginJwt();

                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new MainApp(role: "murid")));
              } else {
                print("masuk sini, salah");
              }
            }),
            builder: (context, snapshot) {
              return null;
            },
          );
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
                        "https://www.freeiconspng.com/uploads/school-student-icon-18.png",
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
                                      fontWeight: FontWeight.bold)),)),
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
              builder: (BuildContext context) => LoginGuru())),
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Login Guru Disini"),
        ));
  }

  Future<LoginSiswaResponse> loginSiswaRequest(String email, String password) async {
    String url = account_info.api_url+"?r=v1/siswa/login";
    Dio dio = new Dio();
    Response response;

    FormData formData =
        new FormData.fromMap({"email": email, "password": password});

    response = await dio.post(url, data: formData);
    print(response.toString());

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

    account_info.email = email;
    account_info.password = password;

    account_info.profileSiswaResponse = profileSiswaResponse;
  }

  getLoginJwt() async{
    String url = "dev.apingelesin.com/api/web/index.php?r=jwt/login-siswa";
    Dio dio = new Dio();
    Response response;

    //String dummy_password = "1234567890";
    //String dummy_mail = "daussho@gmail.com";

    FormData formData =
    new FormData.fromMap({"email": emailEditTextController.text, "password": passwordEditTextController.text});

    response = await dio.post(url, data: formData);
    print(response.toString());

    JwtLoginSiswaResponse jwtLoginSiswaResponse =
    jwtLoginSiswaResponseFromJson(response.toString());

    account_info.jwtLoginSiswaResponse = jwtLoginSiswaResponse;
  }
}
