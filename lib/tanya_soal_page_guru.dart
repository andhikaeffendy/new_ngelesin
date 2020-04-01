import 'package:flutter/material.dart';
import 'package:new_ngelesin/lihat_ambil_soal_form_guru.dart';
import 'package:new_ngelesin/lihat_soal_murid_form_guru.dart';
import 'dart:async';

class TanyaSoalFormGuru extends StatefulWidget {
  @override
  _TanyaSoalFormGuruState createState() => _TanyaSoalFormGuruState();
}

class _TanyaSoalFormGuruState extends State<TanyaSoalFormGuru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ambil Soal"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LihatSoalMuridFormGuru())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Lihat Soal Murid'),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                    onPressed: (){},
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LihatAmbilSoalFormGuru())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Lihat Ambil Soal'),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                    onPressed: (){},
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
