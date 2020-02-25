import 'package:flutter/material.dart';
import 'package:new_ngelesin/main.dart';
import 'package:new_ngelesin/register.dart';

import 'lupa_password.dart';


class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm();
  @override
  _LoginFormState createState() {
    return new _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final mEmail = TextField(
      obscureText: false,
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
        onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new MainApp())),
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
                    child: Image.asset(
                      "assets/Twitter.png",
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
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                                    builder: (BuildContext context) => new LupaPassword())),
                                child: Text('Lupa password ?',
                                    textAlign: TextAlign.start,
                                    style: new TextStyle(
                                        color: Colors.red,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                              )
                          )),
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
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: ()=> Navigator.push(context,
                                    MaterialPageRoute(builder: (BuildContext) => new Register())),
                                child: Text('Daftar',
                                    textAlign: TextAlign.start,
                                    style: new TextStyle(
                                        color: Colors.red,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                              )
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
