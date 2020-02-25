import 'package:flutter/material.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

class KeterampilanPage extends StatefulWidget {
  @override
  _KeterampilanPageState createState() => _KeterampilanPageState();
}

class _KeterampilanPageState extends State<KeterampilanPage> {
  int _pilihan = -1;
  String _selectedValue;

  final List<RadioGroup> _radioList = [
    RadioGroup(index: 1, text: "Make Up (Keterampilan)"),
    RadioGroup(index: 2, text: "Website Course (Keterampilan)"),
    RadioGroup(index: 3, text: "Vlogging (Keterampilan)"),
    RadioGroup(index: 4, text: "Desain Grafis (Keterampilan)"),
    RadioGroup(index: 5, text: "Menyetir (Keterampilan)"),
    RadioGroup(index: 6, text: "Menjahit (Keterampilan)"),
    RadioGroup(index: 7, text: "Desain Interior (Keterampilan)"),
    RadioGroup(index: 8, text: "Barista (Keterampilan)"),
    RadioGroup(index: 9, text: "Programming (Keterampilan)"),
    RadioGroup(index: 10, text: "Memasak (Keterampilan)"),
    RadioGroup(index: 11, text: "Handycraft (Keterampilan)"),
    RadioGroup(index: 12, text: "Drafting & 3D Modeling (Keterampilan)"),
    RadioGroup(index: 13, text: "Eyelash Extension (Keterampilan)"),
    RadioGroup(index: 14, text: "Administrasi Bisnis (Keterampilan)"),
    RadioGroup(index: 15, text: "Lain-lain (Keterampilan)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keterampilan"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _selectedValue == null ? "Pilih Kategori Les" : _selectedValue,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                tooltip: 'Pilih Tanggal',
                onPressed: () {
                  print("Comming Soon");
                },
              ),
            ],
          ),
          Expanded(
            child: ListView(
                children: _radioList
                    .map((radio) => Row(
                  children: <Widget>[
                    Radio(
                      value: radio.index,
                      groupValue: _pilihan,
                      materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        setState(() {
                          _pilihan = value;
                          _selectedValue = radio.text;
                        });
                      },
                    ),
                    Text(radio.text),
                  ],
                ))
                    .toList()),
          )
        ],
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => new PilihanGuru())),
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("SELANJUTNYA"),
      ),
    );
  }
}

class RadioGroup {
  final int index;
  final String text;
  RadioGroup({this.index, this.text});
}