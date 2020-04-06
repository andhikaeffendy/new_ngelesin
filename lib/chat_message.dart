import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ngelesin/api_response_model/list_chat_response.dart';
import 'api_response_model/list_booking_response.dart';
import 'foto_soal_page.dart';
import 'global_variable/account_information.dart' as account_info;
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatMessage extends StatefulWidget {

  final String id;
  final Booking booking;

  ChatMessage({Key key, @required this.id, @required this.booking}) : super(key: key);

  @override
  _ChatMessageState createState() => _ChatMessageState(id: id, booking: booking);
}

File _image;

class _ChatMessageState extends State<ChatMessage> {
  final formatTime = new DateFormat.jm();
  final formatDate = new DateFormat("dd MMM");
  final messageEditTextController = TextEditingController();
  final String id;
  final Booking booking;
  List<Chat> chats = new List();


  _ChatMessageState({@required this.id, @required this.booking}) : super();

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
                    getTime(chat),
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
                    getTime(chat) +' - Read',
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
//          IconButton(
//            icon: Icon(Icons.photo),
//            iconSize: 25.0,
//            color: Theme.of(context).primaryColor,
//            onPressed: () {_showAlertDialog(context);},
//          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: messageEditTextController,
              decoration:
                  InputDecoration.collapsed(hintText: 'Send a message ...'),
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

  String getTitle(){
    if(booking != null)
      return booking.mapel;
    return "Title";
  }

  Widget getSubtitle(){
    if(booking != null)
      return PreferredSize(
          child: Text(account_info.role == "murid" ? booking.guru : booking.siswa, style: TextStyle(color: Colors.white)),
          preferredSize: null);
    return null;
  }

  String getTime(Chat chat){
    var today = DateTime.now();
    if(today.year == chat.created_at.year && today.month == chat.created_at.month && today.day == chat.created_at.day)
      return formatTime.format(chat.created_at);
    return formatDate.format(chat.created_at)+", "+formatTime.format(chat.created_at);
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

  bool isReceiver(Chat chat){
    return account_info.role=="murid" && booking.siswa == chat.receiver_name || account_info.role=="guru" && booking.guru == chat.receiver_name ;
  }

  String getPhone(){
    return account_info.role=="murid" ? booking.hp_guru : booking.hp_siswa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            getTitle(),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: getSubtitle(),
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
                          return Text("");
                        } else
                          return Text("");
                      }),
                  ),
                ),
              ),
              _buildMessageComposer()
            ],
          ),
        ));
  }

  Future<ListChatResponse> getChats() async {
    String url = account_info.role == "murid"
        ? account_info.api_url + "?r=v1/siswa/list-chating-order"
        : account_info.api_url + "?r=v1/guru/list-chating-order";
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
        ? account_info.api_url + "?r=v1/siswa/insert-chat"
        : account_info.api_url + "?r=v1/guru/insert-chat";
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
      "message": message
    });

    response = await dio.post(url, data: formData, queryParameters: {
      "id": id,
    });
    print(response.toString());

    ChatSubmitResponse chatSubmitResponse = chatSubmitResponseFromJson(response.toString());

    return chatSubmitResponse;
  }
}
