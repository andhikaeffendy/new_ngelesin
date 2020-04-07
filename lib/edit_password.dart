import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/update_password_guru_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'akun_page.dart';

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {


  final TextEditingController valueOld = TextEditingController();
  final TextEditingController valueNew = TextEditingController();
  final TextEditingController valueConfirm = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Password'),
      ),body: Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: valueOld,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Password Lama'),
          ),SizedBox(
            height: 8.0,
          ),TextField(
            controller: valueNew,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Password Baru'),
          ),SizedBox(
            height: 8.0,
          ),TextField(
            controller: valueConfirm,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Ulang Password'),
          ),SizedBox(
            height: 12.0,
          ),ButtonTheme(
            minWidth: 380.0,
            child: RaisedButton(
              padding: const EdgeInsets.all(12.0),
              color: Colors.indigo,
              onPressed: () => makeRequest().then((task){
                if (task.status == "success") {
                  //getProfileRequest(account_info.loginSiswaResponseData.data.token, account_info.email, account_info.password);
                  return _alerDialogUpdatePassword();
                } else {

                }
              }),
              child: Text('EDIT PASSWORD',style: TextStyle(color: Colors.white,fontSize: 16.0),),
            ),
          )
        ],
      ),
    ),
    );
  }

  void _alerDialogUpdatePassword(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 250.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/423-4236368_icon-ceklis-png-transparent-png.png'),
                  ),SizedBox(
                    height: 16.0,
                  ),
                  Text('Edit Password', style: TextStyle(fontSize: 24.0),),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Text('Sukses Melakukan Update Password'),
                  ),SizedBox(
                    height: 16.0,
                  ),ButtonTheme(
                    minWidth: 50.0,
                    child: RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      color: Colors.green,
                      child: Text('OK', style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<UpdatePasswordGuruResponse> makeRequest() async{
    String url;
    if(account_info.role=="guru"){
      url = account_info.api_url+"?r=v1/guru/update-password";
    }else{
      url = account_info.api_url+"?r=v1/siswa/update-password";
    }

    var dio = Dio();
    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              var customHeaders = {
                'content-type': 'application/json',
                'email': account_info.email,
                'password': account_info.password,
              };
              options.headers.addAll(customHeaders);
              return options;
            }
        )
    );

    FormData formData =
    new FormData.fromMap({
      "old_password": valueOld.text,
      "new_password": valueNew.text,
      "confirm_password": valueConfirm.text,
    });




    Response response = await dio.post(url, data: formData);
    print("Change pass Response : " + response.data.toString());

    UpdatePasswordGuruResponse updatePasswordGuruResponse =
    updatePasswordGuruResponseFromJson(response.toString());

    return updatePasswordGuruResponse;
  }

}
