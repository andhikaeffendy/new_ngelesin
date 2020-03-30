import 'package:flutter/material.dart';

class PendapatanJawabSoal extends StatefulWidget {
  @override
  _PendapatanJawabSoalState createState() => _PendapatanJawabSoalState();
}

class _PendapatanJawabSoalState extends State<PendapatanJawabSoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendapatan Jawab Soal'),
      ),body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.unarchive,
            size: 80.0,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Text(
            "Oops No Data",
            style: new TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.blueGrey,
                fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    );
  }
}
