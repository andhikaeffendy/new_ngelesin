import 'package:flutter/material.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

class MusikPage extends StatefulWidget {
  @override
  _MusikPageState createState() => _MusikPageState();
}

class _MusikPageState extends State<MusikPage> {
  int _pilihan = -1;
  String _selectedValue;

  final List<RadioGroup> _radioList = [
    RadioGroup(index: 1, text: "Perkusi (Musik)"),
    RadioGroup(index: 2, text: "Gitar (Musik)"),
    RadioGroup(index: 3, text: "Bass (Musik)"),
    RadioGroup(index: 4, text: "Vocal (Musik)"),
    RadioGroup(index: 5, text: "Piano (Musik)"),
    RadioGroup(index: 6, text: "Drum (Musik)"),
    RadioGroup(index: 7, text: "Biola (Musik)"),
    RadioGroup(index: 8, text: "Saxophone (Musik)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Musik"),
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