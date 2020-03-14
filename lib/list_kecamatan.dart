import 'package:flutter/material.dart';

class ListKecamatan extends StatefulWidget {
  @override
  _ListKecamatanState createState() => _ListKecamatanState();
}

class _ListKecamatanState extends State<ListKecamatan> {

  List mKecamatan = [
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
            itemCount: mKecamatan.length,
            itemBuilder: (BuildContext context, int index) {
              final provinsi = mKecamatan[index].toString();
              return Card(
                child: ListTile(
                  title: Text(provinsi),
                  onTap: () {Navigator.pop(context,mKecamatan[index].toString());},
                ),
              );
            }),
      ),
    );
  }
}