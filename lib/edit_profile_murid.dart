import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ngelesin/akun_page.dart';
import 'package:new_ngelesin/api_response_model/update_profile_siswa_reponse.dart';
import 'api_response_model/profile_siswa_response.dart';
import 'global_variable/account_information.dart' as account_info;


import 'list_kecamatan.dart';
import 'list_kota.dart';
import 'list_provinsi.dart';
import 'dart:io';

class EditProfileMurid extends StatefulWidget {
  @override
  _EditProfileMuridState createState() => _EditProfileMuridState();
}

class _EditProfileMuridState extends State<EditProfileMurid> {

  File _image;

  String txtProvinsi = '';
  String txtKota = '';
  String txtKecamatan = '';
  final TextEditingController valueProvinsi = TextEditingController();
  final TextEditingController valueKota = TextEditingController();
  final TextEditingController valueKecamatan = TextEditingController();
  final TextEditingController valueNama = TextEditingController();
  final TextEditingController valueEmail = TextEditingController();
  final TextEditingController valueHP = TextEditingController();
  final TextEditingController valuePass = TextEditingController();
  final TextEditingController valueConfirmPass = TextEditingController();
  final TextEditingController valueAlamatLengkap = TextEditingController();


  listDropDown selectedSekolah;
  listDropDown selectedJK;
  listDropDown selectedNgelesin;
  List<listDropDown> jenisKelamin = <listDropDown>[
    const listDropDown('Pria',0),
    const listDropDown('Wanita',1)
  ];
  List<listDropDown> sekolah = <listDropDown>[
    const listDropDown('SD',0),
    const listDropDown('SMP',1),
    const listDropDown('SMA',2),
    const listDropDown('SMK',3)
  ];
  List<listDropDown> ngelesin = <listDropDown>[
    const listDropDown('Teman',0),
    const listDropDown('Keluarga',1),
    const listDropDown('Orang Lain',2),
    const listDropDown('Lain-lain',3)
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
        title: Text('Edit Profile Siswa'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextField(
                controller: valueHP,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'No. Handphone'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              DropdownButton<listDropDown>(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              DropdownButton<listDropDown>(
                isExpanded: true,
                hint: new Text("Jenjang Pendidikan"),
                value: selectedSekolah,
                onChanged: (listDropDown newValue) {
                  setState(() {
                    selectedSekolah = newValue;
                  });
                },
                items: sekolah.map((listDropDown user) {
                  return new DropdownMenuItem<listDropDown>(
                    value: user,
                    child: new Text(
                      user.name,
                      style: new TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              TextField(
                controller: valueProvinsi,
                enableInteractiveSelection: true,
                readOnly: true,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _navigateAndDisplaySelection(context, () => listProvinsi());
                },
                decoration: InputDecoration(
                  labelText: 'Provinsi',
                ),
              ),
              TextField(
                controller: valueKota,
                enableInteractiveSelection: true,
                readOnly: true,
                enabled: valueProvinsi.text.isEmpty ? false : true,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  valueProvinsi.text.isEmpty
                      ? showAlert("Pilih Provinsi Terlebih dahulu", context)
                      : _navigateAndDisplaySelection(context, () => ListKota());
                },
                decoration: InputDecoration(
                  labelText: 'Kota',
                ),
              ),
              TextField(
                controller: valueKecamatan,
                enableInteractiveSelection: true,
                readOnly: true,
                enabled: valueKota.text.isEmpty ? false : true,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setState(() {
                    valueKota.text.isEmpty
                        ? showAlert("Pilih Kota Terlebih dahulu", context)
                        : _navigateAndDisplaySelection(
                        context, () => ListKecamatan());
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Kecamatan',
                ),
              ),
              TextField(
                controller: valueAlamatLengkap,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Alamat Lengkap"),
              ),
              SizedBox(
                height: 8.0,
              ),ButtonTheme(
                minWidth: 380.0,
                child: RaisedButton(
                  padding: const EdgeInsets.all(12.0),
                  color: Colors.indigo,
                  onPressed:() => makeRequest().then((task){
                    if (task.status == "success") {
                      getProfileRequest(account_info.loginSiswaResponseData.data.token, account_info.email, account_info.password);
                      return _alerDialogUpdateProfile();
                    } else {

                    }
                  }
                  ) ,
                  child: Text('EDIT PROFILE',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateAndDisplaySelection(
      BuildContext context, Widget Function() page) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page()),
    );

    setState(() {
      if (page().toString() == "listProvinsi") {
        txtProvinsi = result;
      } else if (page().toString() == "ListKota") {
        txtKota = result;
      } else if (page().toString() == "ListKecamatan") {
        txtKecamatan = result;
      }
    });
  }

  Future<void> showAlert(String message, BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Oops!! Something Wrong!!"),
            content: Text(message),
            actions: [
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
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

  Future<UpdateProfileSiswaResponse> makeRequest() async{
    String url = account_info.api_url+"?r=v1/siswa/update-profile";

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
      "alamat": valueAlamatLengkap.text,
      "hp": valueHP.text,
      "master_provinsi_id": valueProvinsi,
      "master_kota_id": valueKota.text,
      "master_kecamatan_id": valueKecamatan.text,
      "tb_kategori_id": selectedSekolah.index,
      "jenis_kelamin": selectedJK.index,

    });

    FormData formData2 =
    new FormData.fromMap({
      "nama_lengkap": valueNama.text,
      "alamat": valueAlamatLengkap.text,
      "hp": valueHP.text,
      "master_provinsi_id": 1,
      "master_kota_id": 2,
      "master_kecamatan_id": 1,
      "tb_kategori_id": selectedSekolah.index,
      "jenis_kelamin": selectedJK.index,

    });

    Response response = await dio.post(url, data: formData2);
    print("Update Response : " + response.data.toString());

    UpdateProfileSiswaResponse updateProfileSiswaResponse =
    updateProfileSiswaResponseFromJson(response.toString());

    return updateProfileSiswaResponse;
  }

  getProfileRequest(String token, String email, String password) async {
    String url = account_info.api_url+"?r=v1/siswa/profile";

    var dio = Dio();
    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              var customHeaders = {
                'content-type': 'application/json',
                'email': email,
                'password': password,
              };
              options.headers.addAll(customHeaders);
              return options;
            }
        )
    );



    Response response = await dio.get(url);
    print("GET PROFILE REQUEST : " + response.data.toString());
    ProfileSiswaResponse profileSiswaResponse;
    profileSiswaResponse = profileSiswaResponseFromJson(response.toString());

    account_info.email = email;
    account_info.password = password;

    account_info.profileSiswaResponse = profileSiswaResponse;
  }

}


// ignore: camel_case_types
class listDropDown {
  const listDropDown(this.name, this.index);

  final String name;
  final int index;
}