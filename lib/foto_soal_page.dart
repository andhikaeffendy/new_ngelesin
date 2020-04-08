import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ngelesin/global_variable/app_dialog.dart';
import 'api_response_model/global_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'package:dio/dio.dart';

class FotoSoalPage extends StatefulWidget {
  FotoSoalPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FotoSoalPageState createState() => _FotoSoalPageState();
}

class _FotoSoalPageState extends State<FotoSoalPage> {
  File _image;

  _openGallery(BuildContext context) async{
    var gambar = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 800, maxWidth: 800);
    this.setState((){
      _image = gambar;
    });
  }

  _openCamera(BuildContext context) async{
    var gambar = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 800, maxWidth: 800);
    this.setState((){
      _image = gambar;
    });
  }

  Future<void> _showAlertDialog(BuildContext context) {
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
                      Navigator.of(context).pop();
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      Navigator.of(context).pop();
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
        title: Text("Foto Soal"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _image == null ? Text('No image selected.') : Image.file(_image, width: 400.0, height: 400.0,),
                RaisedButton(
                  onPressed: () {_showAlertDialog(context);},
                  child: Text("Selected Image"),
                ),
              ],
            )),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {
          alerDialogProgress(context);
          kirimPesanRequest().then((task){
            dismissAlerDialogProgress(context);
            if(task.status == "success") {
              alerDialogLoginSucces(context, "Simpan Soal", task.message)
                  .then((task2){
                Navigator.of(context).pop();
              });
            } else
              alerDialogLoginFail(context, "Simpan Soal", task.message);
          });
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Kirim Foto"),
      ),
    );
  }

  Future<GlobalResponse> kirimPesanRequest() async {
    String url = account_info.api_url + "?r=soal/simpan-soal";
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var customHeaders = {
        'content-type': 'application/json',
        'email': account_info.email,
        'password': account_info.password,
      };
      options.headers.addAll(customHeaders);
      return options;
    }));
    Response response;
    FormData formData = new FormData.fromMap({
      "gambar": await MultipartFile.fromFile(_image.path,filename: getFilename(_image.path) )
    });

    response = await dio.post(url, data: formData);
    print(response.toString());

    GlobalResponse globalResponse = globalResponseFromJson(response.toString());

    return globalResponse;
  }

  String getFilename(String filepath){
    List<String> paths = filepath.split("/");
    return paths[paths.length-1];
  }
}