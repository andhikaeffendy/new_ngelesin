import 'package:flutter/material.dart';

class listProvinsi extends StatefulWidget {
  @override
  _listProvinsiState createState() => _listProvinsiState();
}

class _listProvinsiState extends State<listProvinsi> {
  List mProvinsi = [
    'Bandung',
    'Jakarta',
    'Surabaya',
    'Ambon',
    'Makassar',
    'Medan',
    'Jogjakarta',
    'Bali',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: mProvinsi.length,
            itemBuilder: (BuildContext context, int index) {
              final provinsi = mProvinsi[index].toString();
              return Card(
                child: ListTile(
                  title: Text(provinsi),
                  onTap: () {Navigator.pop(context,mProvinsi[index].toString());},
                ),
              );
            }),
      ),
    );
  }
}
