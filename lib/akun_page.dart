import 'package:flutter/material.dart';
import 'api_response_model/profile_siswa_response.dart';
import 'api_response_model/profile_guru_v2_response.dart';
import 'global_variable/account_information.dart' as accountInformation;

class AkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return accountInformation.role=="murid" ? profileSiswa() : profileGuru();
  }

  Widget profileSiswa(){
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
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 130.0,
                        child: RaisedButton(
//                          onPressed: () => Navigator.of(context).pop(0),
                          child: Text('Edit Profile',style: TextStyle(color: Colors.white),),
                          color: Colors.blue,
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 130.0,
                        child: RaisedButton(
//                          onPressed: () => Navigator.of(context).pop(0),
                          child: Text('Edit Password',style: TextStyle(color: Colors.white),),
                          color: Colors.blue,
                        ),
                      ),
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

  Widget profileGuru() {
    DataGuru data = accountInformation.profileGuruV2Response.data;
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

                  new Text('Detail Profile', style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Icon(Icons.person_pin, size: 50.0),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Saldo Saya:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.saldo, style: new TextStyle(color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Nama Lengkap:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.namaLengkap, style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Email:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.email, style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Alamat:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.alamatLengkap, style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('No handphone:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.hp, style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Pendidikan Terakhir:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.pendidikan_terakhir, style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Pengalaman Organisasi:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.pengalaman_organisasi, style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Pengalaman Bekerja:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.pengalaman_organisasi, style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Nomor Rekening:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.bank + " " + data.no_rekening + " " + data.nama_pemilik, style: new TextStyle(color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    softWrap: true,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 130.0,
                        child: RaisedButton(
//                          onPressed: () => Navigator.of(context).pop(0),
                          child: Text('Edit Profile',style: TextStyle(color: Colors.white),),
                          color: Colors.blue,
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 130.0,
                        child: RaisedButton(
//                          onPressed: () => Navigator.of(context).pop(0),
                          child: Text('Edit Password',style: TextStyle(color: Colors.white),),
                          color: Colors.blue,
                        ),
                      ),
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
