import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ngelesin/api_response_model/list_chat_response.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatSoalMessage extends StatefulWidget {

  @override
  _ChatSoalMessageState createState() => _ChatSoalMessageState();
}

File _image;

class _ChatSoalMessageState extends State<ChatSoalMessage> {

  _buildMessage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0),
              child: CircleAvatar(
                maxRadius: 20.0,
                minRadius: 10.0,
                backgroundImage: NetworkImage(
                    'https://www.freeiconspng.com/uploads/school-student-icon-18.png'),
              ),
            ),Container(
              child: Text("chat.sender_name", style: TextStyle(fontSize: 10.0),),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              decoration: BoxDecoration(
                  color: Color(0xFFFFFEEE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    child: Text(
                        "chat.message"),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "waktu chat",
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  _buildRightMessage(Chat chat) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              decoration: BoxDecoration(
                  color: Color(0xFFFFFEEE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    child: Text(
                        chat.message),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'waktu kirim - Read',
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0),
              child: CircleAvatar(
                maxRadius: 20.0,
                minRadius: 10.0,
                backgroundImage: NetworkImage(
                    'https://www.freeiconspng.com/uploads/school-student-icon-18.png'),
              ),
            ),Container(
              child: Text(chat.sender_name, style: TextStyle(fontSize: 10.0),),
            )
          ],
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {_showAlertDialog(context);},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration:
                  InputDecoration.collapsed(hintText: 'Send a message ...'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }

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

  Widget listChat(){
    return ListView.builder(
        reverse: true,
        padding: const EdgeInsets.all(12.0),
        itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
            return _buildMessage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            "getTitle()",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: () {
                String phone = "tel:"+ "getPhone()";
                canLaunch(phone).then((task){
                  print("can launch : " + task.toString());
                  if(task)
                    launch(phone);
                });
              },
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)),
                    child: listChat(),
                  ),
                ),
              ),
              _buildMessageComposer()
            ],
          ),
        ));
  }
}
