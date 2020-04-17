import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/login_guru.dart';
import 'package:new_ngelesin/setting_guru.dart';
import 'package:new_ngelesin/settings_murid.dart';
import 'akun_page.dart';
import 'booking_page_murid.dart';
import 'home_page.dart';
import 'login_murid.dart';
import 'global_variable/AppSession.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String role = await inSession();
  loadSession();
  if(role == "guru") {
    runApp(LoginGuru());
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
        BookingPageMurid(),
        AkunPage(),
        SettingGuru(),
      ];
    } else {
      pageOptions = [
        HomePage(),
        BookingPageMurid(),
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

