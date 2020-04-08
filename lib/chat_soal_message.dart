import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ngelesin/api_response_model/list_ambil_soal_response.dart';
import 'package:new_ngelesin/api_response_model/list_chat_soal_response.dart';
import 'package:new_ngelesin/api_response_model/list_soal_jawaban_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'global_variable/account_information.dart' as account_info;
import 'package:dio/dio.dart';

class ChatSoalMessage extends StatefulWidget {
  final String id;
  final SoalJawaban soal;
  final AmbilSoal ambilSoal;

  ChatSoalMessage({Key key, @required this.id, this.soal, this.ambilSoal}) : super(key: key);

  @override
  _ChatSoalMessageState createState() => _ChatSoalMessageState(id: id, soal: soal, ambilSoal: ambilSoal);
}

File _image;
bool isImage = false;

class _ChatSoalMessageState extends State<ChatSoalMessage> {
  final formatTime = new DateFormat.jm();
  final formatDate = new DateFormat("dd MMM");
  final messageEditTextController = TextEditingController();
  final String id;
  final SoalJawaban soal;
  final AmbilSoal ambilSoal;
  List<Chat> chats = new List();

  _ChatSoalMessageState({@required this.id, this.soal, this.ambilSoal}) : super();

  _buildMessage(Chat chat) {
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
              child: Text(chat.sender_name, style: TextStyle(fontSize: 10.0),),
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
              child: GestureDetector(
                onTap: () => showImage(context, chat),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      child: getMessage(chat),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      getTime(chat),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
              child: GestureDetector(
                onTap: () => showImage(context, chat),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      child: getMessage(chat),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      getTime(chat),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
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
              readOnly: isImage,
              textCapitalization: TextCapitalization.sentences,
              controller: messageEditTextController,
              decoration:
                  InputDecoration.collapsed(hintText: 'Send a message ...'),
            ),
          ),
          Visibility(
            visible: isImage,
            child:IconButton(
              icon: Icon(Icons.cancel),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  _image = null;
                  isImage = false;
                  messageEditTextController.text = "";
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              String message = messageEditTextController.text;
              messageEditTextController.clear();
              kirimPesanRequest(message).then((task){
                if(task.status=="success")
                  setState(() {
                    _image = null;
                    isImage = false;
                    chats.insert(0, task.data);
                  });
              });
            },
          ),
        ],
      ),
    );
  }

  _openGallery(BuildContext context) async{
    var gambar = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    this.setState((){
      _image = gambar;
      isImage = true;
      messageEditTextController.text = getFilename(_image.path) ;
    });
  }

  _openCamera(BuildContext context) async{
    var gambar = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 800, maxHeight: 800);
    this.setState((){
      _image = gambar;
      isImage = true;
      messageEditTextController.text = getFilename(_image.path) ;
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

  Widget listChat(){
    return ListView.builder(
        reverse: true,
        padding: const EdgeInsets.all(12.0),
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
            return isReceiver(chats[index]) ? _buildMessage(chats[index]) : _buildRightMessage(chats[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            "ID SOAL " + getCodeSoal(),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: () {
                String phone = "tel:"+ getPhone();
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
                    child: FutureBuilder(
                        future: getChats(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            ListChatResponse listChatResponse = snapshot.data;
                            chats = listChatResponse.data.reversed.toList();
                            return listChat();
                          } else if (snapshot.connectionState == ConnectionState.waiting) {
                            return listChat();
                          } else
                            return listChat();
                        }),
                  ),
                ),
              ),
              getStatus() == "1" ? _buildMessageComposer() : Text("")
            ],
          ),
        ));
  }

  String getTime(Chat chat){
    var today = DateTime.now();
    var read = " - Sent";
    if(chat.read_status == 1)
      read = " - Read";

    if(isReceiver(chat))
      read = "";

    if(today.year == chat.created_at.year && today.month == chat.created_at.month && today.day == chat.created_at.day)
      return formatTime.format(chat.created_at) + read;

    return formatDate.format(chat.created_at)+", "+formatTime.format(chat.created_at) + read;
  }

  bool isReceiver(Chat chat){
    return account_info.role=="murid" && soal.nama_guru == chat.sender_name ||
        account_info.role=="guru" && ambilSoal.nama == chat.sender_name ;
  }

  String getPhone(){
    return account_info.role=="murid" ? soal.hp_guru : ambilSoal.hp_siswa;
  }

  String getCodeSoal(){
    return soal == null ? ambilSoal.kode_soal : soal.kode_soal;
  }

  Widget getMessage(Chat chat){
    if(chat.message_type == 1)
      return Image.network(
        chat.message);
    return Text(
        chat.message);
  }

  String getStatus(){
    return soal == null ? ambilSoal.status : soal.status;
  }

  Future<ListChatResponse> getChats() async {
    String url = account_info.role == "murid"
        ? soal.status == "1"
        ? account_info.api_url + "?r=siswa/list-chating-soal"
        : account_info.api_url + "?r=siswa/history-chating-soal"
        : ambilSoal.status == "1"
        ? account_info.api_url + "?r=guru/list-chating-soal"
        : account_info.api_url + "?r=guru/history-chating-soal" ;
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var customHeaders ;
      if(account_info.role == "guru") {
        customHeaders = {
          'content-type': 'application/json',
          'email': account_info.email,
          'password': account_info.password,
          'idGuru': account_info.loginGuruResponse.data.id.toString(),
        };
      } else {
        customHeaders = {
          'content-type': 'application/json',
          'email': account_info.email,
          'password': account_info.password,
        };
      }
      options.headers.addAll(customHeaders);
      return options;
    }));
    Response response;

    response = await dio.get(url, queryParameters: {
      "id": id,
    });
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage);

    ListChatResponse listChatResponse =
    listChatResponseFromJson(response.toString());

    return listChatResponse;
  }

  Future<ChatSubmitResponse> kirimPesanRequest(String message) async {
    String url = account_info.role == "murid"
        ? account_info.api_url + "?r=siswa/insert-chat-soal"
        : account_info.api_url + "?r=guru/insert-chat-soal";
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
    FormData formData;

    if(_image == null ) {
      if(account_info.role=="guru") {
        formData = new FormData.fromMap({
          "message": message,
          "idKelas": ambilSoal.id,
        });
      } else {
        formData = new FormData.fromMap({
          "message": message
        });
      }
    } else {
      if(account_info.role=="guru") {
        formData = new FormData.fromMap({
          "message_image": await MultipartFile.fromFile(
              _image.path, filename: getFilename(_image.path)),
          "idKelas": ambilSoal.id,
        });
      } else {
        formData = new FormData.fromMap({
          "message_image": await MultipartFile.fromFile(_image.path,filename: getFilename(_image.path) )
        });
      }
    }

    response = await dio.post(url, data: formData, queryParameters: {
      "id": id,
    });
    print(response.toString());

    ChatSubmitResponse chatSubmitResponse = chatSubmitResponseFromJson(response.toString());

    return chatSubmitResponse;
  }

  String getFilename(String filepath){
    List<String> paths = filepath.split("/");
    return paths[paths.length-1];
  }

  void showImage(BuildContext context, Chat chat){
    if(chat.message_type == 1)
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Image.network(
                    chat.message),
              ),
            );
          }
      );
  }
}
