import 'package:flutter/material.dart';

class ListKota extends StatefulWidget {
  @override
  _ListKotaState createState() => _ListKotaState();
}

class _ListKotaState extends State<ListKota> {

  List mKota = [
    'Bandung',
    'Jakarta',
    'Surabaya',
    'Ambon',
    'Makassar',
    'Medan',
    'Jogjakarta',
    'Bali'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: mKota.length,
            itemBuilder: (BuildContext context, int index) {
              final provinsi = mKota[index].toString();
              return Card(
                child: ListTile(
                  title: Text(provinsi),
                  onTap: () {Navigator.pop(context,mKota[index].toString());},
                ),
              );
            }),
      ),
    );
  }
}