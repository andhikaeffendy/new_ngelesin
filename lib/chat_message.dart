import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'foto_soal_page.dart';

class ChatMessage extends StatefulWidget {

  @override
  _ChatMessageState createState() => _ChatMessageState();
}

File _image;

class _ChatMessageState extends State<ChatMessage> {
  final List<String> message = <String>[
    'dsds',
    'dsdsd',
    'fdfdf',
    'fdfdf',
    'fdfdf',
    'fdfdf',
    'fdfdf',
    'fdfdf',
    'fdfdf'
  ];

  _buildMessage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0),
              child: CircleAvatar(
                maxRadius: 20.0,
                minRadius: 10.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSbzSmuQvjS7WK__fksGWR95nwvgPUu9DIyT-7zRQnvE7P0aJtC&usqp=CAU'),
              ),
            ),Container(
              child: Text('Tedi Guru', style: TextStyle(fontSize: 10.0),),
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
                        'Aku testing doang dasdjabskchjsbdkcjahsbdchjkasbdchjsbdchjasbdcsb dchsdcj sadkjacnsldkcnskdnclksd'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '04:00 PM. Read',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            )
          ],
        )
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
              onChanged: (value) {},
              decoration:
                  InputDecoration.collapsed(hintText: 'Send a message ...'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            'Mengaji',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: () {},
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
                    child: ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.all(12.0),
                        itemCount: message.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildMessage();
                        }),
                  ),
                ),
              ),
              _buildMessageComposer()
            ],
          ),
        ));
  }
}
