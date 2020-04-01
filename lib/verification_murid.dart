import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:new_ngelesin/api_response_model/otp_siswa_response.dart';
import 'global_variable/account_information.dart' as account_info;


class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {


  Timer _timer;
  int _start = 10;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override

  String kode_otp;

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verification OTP"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Wrap(
                children: <Widget>[
                  new Container(
                    width: 180.0,
                    child: new Text(
                      "Kode OTP Dikirimkan melalui SMS ke nomor handphone anda, silahkan masukkan disini",
                      style: new TextStyle(color: Colors.black, fontSize: 12.0),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),VerificationCodeInput(
                keyboardType: TextInputType.number,
                length: 5,
                onCompleted: (String value){
                  kode_otp = value;
                  print(value);
                },
              ),
              SizedBox(
                height: 24.0,
              ),Text(
                '$_start',
                style: TextStyle(fontSize: 44.0,color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {
          return FutureBuilder(
            future: otpSiswaRequest().then((task){
              if(task.status=="success"){
                Navigator.of(context).pop();
              }else{
                showDialog(context: context, child:
                new AlertDialog(
                  title: new Text("Verifikasi"),
                  content: new Text(task.message),
                )
                );
              }
            }),
            builder: (context, snapshot){
              if(snapshot.data == null){
                return Container();
              }else{
                return null;
              }
            },
          );
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Verification"),
      ),
    );
  }

  Future<OtpSiswaResponse> otpSiswaRequest() async {
    String url =
        account_info.api_url+"?r=v1/siswa/otp";
    Dio dio = new Dio();
    Response response;

    FormData formData =
    new FormData.fromMap({
      "kode_otp": kode_otp});

    response = await dio.post(url, data: formData);
    print("Ini Response : " + response.toString());

    OtpSiswaResponse otpSiswaResponse =
    otpSiswaResponseFromJson(response.toString());

    return otpSiswaResponse;
  }


}