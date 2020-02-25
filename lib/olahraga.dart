import 'package:flutter/material.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

class OlahragaPage extends StatefulWidget {
  @override
  _OlahragaPageState createState() => _OlahragaPageState();
}

class _OlahragaPageState extends State<OlahragaPage> {
  int _pilihan = -1;
  String _selectedValue;

  final List<RadioGroup> _radioList = [
    RadioGroup(index: 1, text: "Sepak Bola (Olahraga)"),
    RadioGroup(index: 2, text: "Voli (Olahraga)"),
    RadioGroup(index: 3, text: "Futsal (Olahraga)"),
    RadioGroup(index: 4, text: "Renang (Olahraga)"),
    RadioGroup(index: 5, text: "Basket (Olahraga)"),
    RadioGroup(index: 6, text: "Badminton (Olahraga)"),
    RadioGroup(index: 7, text: "Tenis (Olahraga)"),
    RadioGroup(index: 8, text: "Muaythai (Olahraga)"),
    RadioGroup(index: 9, text: "Boxing (Olahraga)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olahraga"),
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