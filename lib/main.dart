import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/setting_guru.dart';
import 'akun_page.dart';
import 'booking_page.dart';
import 'home_page.dart';
import 'login_murid.dart';
void main() => runApp(LoginMurid());

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    BookingPage(),
    AkunPage(),
    SettingGuru(),
  ];

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
        body: _pageOptions[_selectedPage],
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

