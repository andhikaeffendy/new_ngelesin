import 'package:flutter/material.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

void main() => runApp(CariDaerah());

class CariDaerah extends StatefulWidget {
  @override
  _CariDaerahState createState() => _CariDaerahState();
}

class _CariDaerahState extends State<CariDaerah> {
  List<String> litems = ["tingkiwingki", "dipsi", "lala", "poo"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Kota'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12.0),
              labelText: 'Masukkan Daerah',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: litems.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.location_on),
                    dense: true,
                    title: Text(litems[index]),
                    onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PilihanGuru())),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
