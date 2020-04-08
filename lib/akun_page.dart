import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:new_ngelesin/edit_password.dart';
import 'package:new_ngelesin/edit_profile_guru.dart';
import 'package:new_ngelesin/edit_profile_murid.dart';
import 'package:shimmer/shimmer.dart';
import 'api_response_model/profile_siswa_response.dart';
import 'api_response_model/profile_guru_v2_response.dart';
import 'global_variable/account_information.dart' as accountInformation;

class AkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return accountInformation.role == "murid"
        ? profileSiswa(context)
        : profileGuru(context);
  }

  Widget profileSiswa(BuildContext context) {
    Data data = accountInformation.profileSiswaResponse.data;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
//              child: Shimmer.fromColors(
//                direction: ShimmerDirection.rtl,
//                period: Duration(seconds: 3),
//                baseColor: Colors.grey[700],
//                highlightColor: Colors.grey[100],
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text('Detail Profile',
                            style: new TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new EditProfileMurid())),
                              child: Text('Edit Profile',
                                  style: new TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new EditPassword())),
                              child: Text('Edit Password',
                                  style: new TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        )
                      ],
                    ),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Icon(Icons.person_pin, size: 50.0),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('Saldo Saya:' + data.saldo,
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(data.saldo,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('Nama Lengkap:',
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(data.namaLengkap,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('Jenis Kelamin:',
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(data.jenisKelamin.toString(),
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('Alamat:',
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(data.alamatLengkap,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('Wilayah:',
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(data.labelKota,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('Kecamatan:',
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(data.labelKecamatan,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('Jenjang:',
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(data.labelTingkatan,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    new Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                    ),
                    new Text('No Handphone:',
                        style:
                            new TextStyle(color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.start),
                    new Text(
                      data.hp,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      softWrap: true,
                    ),
                  ],
                ),
//              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget profileGuru(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text('Detail Profile',
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new EditProfileGuru())),
                            child: Text('Edit Profile',
                                style: new TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new EditPassword())),
                            child: Text('Edit Password',
                                style: new TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text('Isi Saldo',
                                style: new TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start),
                          ),
                        ],
                      )
                    ],
                  ),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Icon(Icons.person_pin, size: 50.0),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Saldo Saya: ',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.saldo,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Nama Lengkap:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.namaLengkap,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Email:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.email,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Alamat:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.alamatLengkap,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('No handphone:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.hp,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Pendidikan Terakhir:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.pendidikan_terakhir,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Pengalaman Organisasi:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.pengalaman_organisasi,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Pengalaman Bekerja:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(data.pekerjaan,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Nomor Rekening:',
                      style: new TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start),
                  new Text(
                    data.bank +
                        " " +
                        data.no_rekening +
                        " " +
                        data.nama_pemilik,
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    softWrap: true,
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
