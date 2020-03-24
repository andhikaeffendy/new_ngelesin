import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_response_model/reset_pass_siswa_response.dart';

class LupaPassword extends StatefulWidget {
  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {

  final emailEditTextController = TextEditingController();
  final hpEditTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lupa Password murid"),
      ),body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: emailEditTextController,
                decoration: InputDecoration(
                    labelText: "Email"
                ),
              ),TextField(
                controller: hpEditTextController,
                decoration: InputDecoration(
                    labelText: "No Handphone"
                ),
              )
            ],
          ),
        )
    ),
      bottomNavigationBar: RaisedButton(
        onPressed: (){
          FutureBuilder(
            future: resetPassRequest().then((task){
              if(task.status=="success"){
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text("Reset Password"),
                      content: new Text("Password baru telah dikirim ke nomor anda"),
                    )
                );
              }else{
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text("Reset Password"),
                      content: new Text(task.message),
                    )
                );

              }
            }),
            builder: (context, snapshot){
              return null;
            },
          );
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Kirim Password"),
      ),
    );
  }

  Future<ResetPassSiswaResponse> resetPassRequest() async {
    String url =
        "http://apingelesin.com/app/api/web/index.php?r=v1/siswa/reset-password";
    Dio dio = new Dio();
    Response response;

    FormData formData =
    new FormData.fromMap({"email": emailEditTextController.text, "hp": hpEditTextController.text});

    response = await dio.post(url, data: formData);
    print(response.toString());

    ResetPassSiswaResponse resetPassSiswaResponse =
    resetPassSiswaResponseFromJson(response.toString());

    return resetPassSiswaResponse;
  }
}