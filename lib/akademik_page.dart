import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_all_mapel_response.dart';
import 'package:new_ngelesin/cari_daerah.dart';
import 'global_variable/temp_var.dart' as globTemp;

class AkademikPage extends StatefulWidget {
  @override
  _AkademikPageState createState() => _AkademikPageState();
}

class _AkademikPageState extends State<AkademikPage> {
  int _pilihan = -1;
  String _selectedValue;

  final List<Datum> _radioList = globTemp.listAllMapel.getAkademikList();

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
                      value: radio.id,
                      groupValue: _pilihan,
                      materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        setState(() {
                          _pilihan = value;
                          _selectedValue = radio.nama;
                        });
                      },
                    ),
                    Text(radio.nama),
                  ],
                ))
                    .toList()),
          )
        ],
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => new CariDaerah())),
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("SELANJUTNYA"),
      ),
    );
  }
}

class RadioGroup {
  Datum data;
  RadioGroup(Datum data);
}