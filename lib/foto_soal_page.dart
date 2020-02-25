import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FotoSoalPage extends StatefulWidget {
  FotoSoalPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FotoSoalPageState createState() => _FotoSoalPageState();
}

class _FotoSoalPageState extends State<FotoSoalPage> {
  File _image;

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
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Kirim Foto"),
      ),
    );
  }
}