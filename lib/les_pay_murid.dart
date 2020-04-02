import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/jwt_login_siswa_response.dart';
import 'package:new_ngelesin/pembayaran_murid.dart';
import 'global_variable/account_information.dart' as account_info;

class LesPayMurid extends StatefulWidget {
  @override
  _LesPayMuridState createState() => _LesPayMuridState();
}

class _LesPayMuridState extends State<LesPayMurid> {

  listDropDown selectedTopUp;
  List<listDropDown> topUp = <listDropDown>[
    const listDropDown('10.000'),
    const listDropDown('20.000'),
    const listDropDown('50.000'),
    const listDropDown('100.000'),
    const listDropDown('500.000'),
    const listDropDown('Lainnya'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topup Les'),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              width: 400.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(account_info.profileSiswaResponse.data.namaLengkap, style: TextStyle(color: Colors.red, fontSize: 24.0),),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text('Rp. 0', style: TextStyle(color: Colors.black, fontSize: 18.0),),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),SizedBox(
              height: 24.0,
            )
            ,Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              width: 400.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Top-up LES Pay', style: TextStyle(color: Colors.black, fontSize: 24.0)),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text('nominal Top-up', style: TextStyle(color: Colors.black38, fontSize: 14.0),),
                  SizedBox(
                    height: 8.0,
                  ),DropdownButton<listDropDown>(
                    isExpanded: true,
                    hint: Text('Pilih Nominal Topup'),
                    value: selectedTopUp,
                    onChanged: (listDropDown newValue) {
                      setState(() {
                        selectedTopUp = newValue;
                      });
                    },
                    items: topUp.map((listDropDown user) {
                      return new DropdownMenuItem<listDropDown>(
                        value: user,
                        child: new Text(
                          user.name,
                          style: new TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),ButtonTheme(
                    minWidth: 380.0,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.indigo,
                      onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Pembayaran())),
                      child: Text('TOP-UP',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getLoginJwt() async{
    String url = "dev.apingelesin.com/api/web/index.php?r=jwt/login-siswa";
    Dio dio = new Dio();
    Response response;

    String dummy_password = "1234567890";
    String dummy_mail = "daussho@gmail.com";

    FormData formData =
    new FormData.fromMap({"email": dummy_mail, "password": dummy_password});

    response = await dio.post(url, data: formData);
    print(response.toString());

    JwtLoginSiswaResponse jwtLoginSiswaResponse =
    jwtLoginSiswaResponseFromJson(response.toString());

    account_info.jwtLoginSiswaResponse = jwtLoginSiswaResponse;
  }
}
class listDropDown {
  const listDropDown(this.name);

  final String name;
}