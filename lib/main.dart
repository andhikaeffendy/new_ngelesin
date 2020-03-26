import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/setting_guru.dart';
import 'package:new_ngelesin/settings_murid.dart';
import 'akun_page.dart';
import 'booking_page.dart';
import 'home_page.dart';
import 'login_murid.dart';
import 'global_variable/account_information.dart' as account_info;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(account_info.loginGuruResponse != null){
    runApp(MainApp(role: "guru"));
  } else if(account_info.loginSiswaResponseData != null){
    runApp(MainApp(role: "murid"));
  } else {
    runApp(LoginMurid());
  }
}

class MainApp extends StatefulWidget {
  final String role;

  MainApp({Key key, @required this.role}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    var pageOptions;
    if(role == "guru") {
      pageOptions = [
        HomePage(),
        BookingPage(),
        AkunPage(),
        SettingGuru(),
      ];
    } else {
      pageOptions = [
        HomePage(),
        BookingPage(),
        AkunPage(),
        SettingsMurid(),
      ];
    }
    return MainAppState(pageOptions: pageOptions);
  }
}

class MainAppState extends State<MainApp>{
  int _selectedPage = 0;
  final pageOptions;

  MainAppState({@required this.pageOptions}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'NGELESIN',
            textAlign: TextAlign.center, style: new TextStyle(color: Colors.black),
          ),
        ),
        body: pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), title: Text('Booking')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin), title: Text('Akun')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
      ),
    );
  }



}

