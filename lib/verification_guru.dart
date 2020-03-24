import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:new_ngelesin/api_response_model/otp_guru_response.dart';


class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  String kode_otp;
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

  Future<OtpGuruResponse> otpSiswaRequest() async {
    String url =
        "http://apingelesin.com/app/api/web/index.php?r=v1/guru/otp";
    Dio dio = new Dio();
    Response response;

    FormData formData =
    new FormData.fromMap({
      "kode_otp": kode_otp});

    response = await dio.post(url, data: formData);
    print("Ini Response : " + response.toString());

    OtpGuruResponse otpGuruResponse =
    otpGuruResponseFromJson(response.toString());

    return otpGuruResponse;
  }
}