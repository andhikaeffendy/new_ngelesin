import 'package:flutter/material.dart';
import 'package:new_ngelesin/login_murid.dart';
import 'package:new_ngelesin/register.dart';

import 'lupa_password.dart';

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
        onPressed: () {},
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
}
