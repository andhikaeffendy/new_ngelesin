import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_all_mapel_response.dart';
import 'package:new_ngelesin/cari_daerah.dart';
import 'api_response_model/kategori_response.dart';
import 'global_variable/temp_var.dart' as globTemp;

class KategoriPage extends StatefulWidget {
  final Kategori kategori;

  KategoriPage({Key key, @required this.kategori}) : super(key: key);

  @override
  _KategoriPageState createState() {
    List<Datum> _radioList;
    if(kategori.nama == "Akademik") {
      _radioList = globTemp.listAllMapel.getAkademikList();
    } else if (kategori.nama == "Bahasa"){
      _radioList = globTemp.listAllMapel.getBahasaList();
    } else if (kategori.nama == "Olahraga"){
      _radioList = globTemp.listAllMapel.getOlahragalList();
    } else if (kategori.nama == "Keterampilan"){
      _radioList = globTemp.listAllMapel.getKeterampilanList();
    } else if (kategori.nama == "Anak anak"){
      _radioList = globTemp.listAllMapel.getAnakList();
    } else if (kategori.nama == "Musik"){
      _radioList = globTemp.listAllMapel.getMusikList();
    } else if (kategori.nama == "Lainnya"){
      _radioList = globTemp.listAllMapel.getLainList();
    }
    return _KategoriPageState(title: kategori.nama, radioList: _radioList);
  }
}

class _KategoriPageState extends State<KategoriPage> {
  int _pilihan = -1;
  String _selectedValue;

  final String title;
  final List<Datum> radioList;

  _KategoriPageState({@required this.title,@required this.radioList}) : super();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
                children: radioList
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
        onPressed: () {
          if(_pilihan!=-1)
            Navigator.push(context,
              MaterialPageRoute(
                  builder: (BuildContext) => new CariDaerah(mapel: _pilihan)));
        },
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