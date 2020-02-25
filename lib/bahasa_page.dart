import 'package:flutter/material.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

class BahasaPage extends StatefulWidget {
  @override
  _BahasaPageState createState() => _BahasaPageState();
}

class _BahasaPageState extends State<BahasaPage> {
  int _pilihan = -1;
  String _selectedValue;

  final List<RadioGroup> _radioList = [
    RadioGroup(index: 1, text: "Inggris (Bahasa)"),
    RadioGroup(index: 2, text: "IELTS (Bahasa)"),
    RadioGroup(index: 3, text: "TOEFL (Bahasa)"),
    RadioGroup(index: 4, text: "Indonesia (Bahasa)"),
    RadioGroup(index: 5, text: "Mandarin (Bahasa)"),
    RadioGroup(index: 6, text: "Korea (Bahasa)"),
    RadioGroup(index: 7, text: "Jepang (Bahasa)"),
    RadioGroup(index: 8, text: "Jerman (Bahasa)"),
    RadioGroup(index: 9, text: "Jepang (Bahasa)"),
    RadioGroup(index: 10, text: "Prancis (Bahasa)"),
    RadioGroup(index: 11, text: "Arab (Bahasa)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bahasa"),
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