import 'package:flutter/material.dart';

class PendapatanLes extends StatefulWidget {
  @override
  _PendapatanLesState createState() => _PendapatanLesState();
}

class _PendapatanLesState extends State<PendapatanLes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendapatan'),
      ),
      body: Container(
        child: Container(
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
      ),
    );
  }
}
