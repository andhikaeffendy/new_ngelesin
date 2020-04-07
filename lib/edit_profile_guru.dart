import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'api_response_model/update_profile_guru2_response.dart';
import 'global_variable/account_information.dart' as account_info;



class EditProfileGuru extends StatefulWidget {
  @override
  _EditProfileGuruState createState() => _EditProfileGuruState();
}

class _EditProfileGuruState extends State<EditProfileGuru> {

  File _image;

  final TextEditingController valueNama = TextEditingController();
  final TextEditingController valueEmail = TextEditingController();
  final TextEditingController valueHandphone = TextEditingController();
  final TextEditingController valueAlamat = TextEditingController();
  final TextEditingController valuePendidikan = TextEditingController();
  final TextEditingController valuePengalamanOrganisas = TextEditingController();
  final TextEditingController valuePengalamanKerja = TextEditingController();
  final TextEditingController valueBank = TextEditingController();
  final TextEditingController valueNomorRekening = TextEditingController();
  final TextEditingController valueAtasNamaRekening = TextEditingController();




  listDropDown selectedJK;

  List<listDropDown> jenisKelamin = <listDropDown>[
    const listDropDown('Pria', 0),
    const listDropDown('Wanita', 1)
  ];

  _openGallery(BuildContext context) async{
    var gambar = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      _image = gambar;
    });
  }

  _openCamera(BuildContext context) async{
    var gambar = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      _image = gambar;
    });
  }

  Future<void> _showDialogChangePicture(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pilih"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile Guru'),
      ),body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEBicsN2nrxY5_3Bs1BFa4jZDyZ9eaJYGgqYBDfl5U_VBku3Gl&s'),
                  radius: 40.0,
                ),Positioned(
                  bottom: 0,
                  right: 0,
                  top: 0,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        onTap: () {_showDialogChangePicture(context);},
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new AssetImage(
                                        "assets/Twitter.png"))),
                          ),
                        ),
                      )),
                )
              ],
            ),TextField(
              controller: valueNama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valueEmail,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Email'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valueHandphone,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'No. Handphone'),
            ),SizedBox(
              height: 8.0,
            ),DropdownButton<listDropDown>(
              isExpanded: true,
              hint: new Text("Pilih Jenis Kelamin"),
              value: selectedJK,
              onChanged: (listDropDown newValue) {
                setState(() {
                  selectedJK = newValue;
                });
              },
              items: jenisKelamin.map((listDropDown user) {
                return new DropdownMenuItem<listDropDown>(
                  value: user,
                  child: new Text(
                    user.name,
                    style: new TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valueAlamat,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valuePendidikan,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Pendidikan Terakhir'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valuePengalamanOrganisas,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Pengalaman Organisasi'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valuePengalamanKerja,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Pengalaman Bekerja'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valueBank,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Bank'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valueNomorRekening,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Nomor Rekening'),
            ),SizedBox(
              height: 8.0,
            ),TextField(
              controller: valueAtasNamaRekening,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Atas Nama Rekening'),
            ),SizedBox(
              height: 8.0,
            ),ButtonTheme(
              minWidth: 380.0,
              child: RaisedButton(
                padding: const EdgeInsets.all(12.0),
                color: Colors.indigo,
                onPressed: () => makeRequest().then((task){
                  if (task.status == "success") {
                    //getProfileRequest(account_info.loginSiswaResponseData.data.token, account_info.email, account_info.password);
                    return _alerDialogUpdateProfile();
                  } else {

                  }
                }),
                child: Text('EDIT PROFILE',style: TextStyle(color: Colors.white,fontSize: 16.0),),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }

  void _alerDialogUpdateProfile(){
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
                  Text('Edit Profil', style: TextStyle(fontSize: 24.0),),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Text('Sukses Melakukan Update Profile'),
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

  Future<UpdateProfileGuru2Response> makeRequest() async{
    print("make jalan" + account_info.email + account_info.password);
    String url = account_info.api_url+"?r=v1/guru/update-profile";

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
      "nama_lengkap": valueNama.text,
      "alamat_lengkap": valueAlamat.text,
      "hp": valueHandphone.text,
      "jenis_kelamin": selectedJK.index,
      "pekerjaan": valuePengalamanKerja.text,
      "pendidikan_terakhir": valuePendidikan.text,
      "pengalaman_organisasi": valuePengalamanOrganisas.text,
      "bank": valueBank.text,
      "no_rekening": valueNomorRekening,
      "nama_pemilik": valueAtasNamaRekening,

    });

    print('valuenama' + valueNama.text);

    FormData formData2 =
    new FormData.fromMap({
      "nama_lengkap": valueNama.text,
      "alamat_lengkap": "Jl. Guru 123",
      "hp": valueHandphone.text,
      "jenis_kelamin": selectedJK.index,
      "pekerjaan": valuePengalamanKerja.text,
      "pendidikan_terakhir": valuePendidikan.text,
      "pengalaman_organisasi": valuePengalamanOrganisas.text,
      "bank": valueBank.text,
      "no_rekening": valueNomorRekening,
      "nama_pemilik": valueAtasNamaRekening,

    });

    Response response = await dio.post(url, data: formData2);
    print("Update Response : " + response.data.toString());

    UpdateProfileGuru2Response updateProfileGuru2Response =
    updateProfileGuru2ResponseFromJson(response.toString());


    print("Update Response Mess: " + updateProfileGuru2Response.pesan);
    return updateProfileGuru2Response;
  }
}


class listDropDown {
  const listDropDown(this.name, this.index);

  final String name;
  final int index;
}