import 'package:flutter/material.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

class AkademikPage extends StatefulWidget {
  @override
  _AkademikPageState createState() => _AkademikPageState();
}

class _AkademikPageState extends State<AkademikPage> {
  int _pilihan = -1;
  String _selectedValue;

  final List<RadioGroup> _radioList = [
    RadioGroup(index: 1, text: "Matematika SD"),
    RadioGroup(index: 2, text: "Matematika SMP"),
    RadioGroup(index: 3, text: "Matematika SMA"),
    RadioGroup(index: 4, text: "Fisika SMP"),
    RadioGroup(index: 5, text: "Fisika SMA"),
    RadioGroup(index: 6, text: "Kimia SMP"),
    RadioGroup(index: 7, text: "Kimia SMA"),
    RadioGroup(index: 8, text: "Biologi SMP"),
    RadioGroup(index: 9, text: "Biologi SMA"),
    RadioGroup(index: 10, text: "Akutansi SMA"),
    RadioGroup(index: 11, text: "Persiapan UN SD"),
    RadioGroup(index: 12, text: "Persiapan UN SMP"),
    RadioGroup(index: 13, text: "Persiapan UN IPA SMA"),
    RadioGroup(index: 14, text: "Persiapan UN IPS SMA"),
    RadioGroup(index: 15, text: "Persiapan SBMPTN IPA SMA"),
    RadioGroup(index: 16, text: "Persiapan SBMPTN IPS SMA"),
    RadioGroup(index: 17, text: "Persiapan Tes Masuk FSRD SMA"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akademik"),
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