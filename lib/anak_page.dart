import 'package:flutter/material.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

class AnakPage extends StatefulWidget {
  @override
  _AnakPageState createState() => _AnakPageState();
}

class _AnakPageState extends State<AnakPage> {
  int _pilihan = -1;
  String _selectedValue;

  final List<RadioGroup> _radioList = [
    RadioGroup(index: 1, text: "Balet (Anak)"),
    RadioGroup(index: 2, text: "Tari Tradisional (Anak)"),
    RadioGroup(index: 3, text: "Calistung (Anak)"),
    RadioGroup(index: 4, text: "Bahasa Inggris (Anak)"),
    RadioGroup(index: 5, text: "Menggambar (Anak)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anak anak"),
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