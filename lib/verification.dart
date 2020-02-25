import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';


class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
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
                  print(value);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {},
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Verification"),
      ),
    );
  }
}