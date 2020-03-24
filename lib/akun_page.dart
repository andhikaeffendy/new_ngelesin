import 'package:flutter/material.dart';
import 'api_response_model/profile_siswa_response.dart';
import 'global_variable/account_information.dart' as accountInformation;

class AkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data data = accountInformation.profileSiswaResponse.data;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  new Text('Detail Profile', style: new TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Icon(Icons.person_pin, size: 50.0),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Saldo Saya:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.saldo, style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Nama Lengkap:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.namaLengkap, style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Jenis Kelamin:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.jenisKelamin.toString(), style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Alamat:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.alamatLengkap, style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Wilayah:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.labelKota, style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Kecamatan:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.labelKecamatan, style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Jenjang:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.labelTingkatan, style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('No Handphone:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text(data.hp, style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start, softWrap: true,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
