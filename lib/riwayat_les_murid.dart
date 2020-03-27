import 'package:flutter/material.dart';

class RiwayatLesMurid extends StatefulWidget {
  @override
  _RiwayatLesMuridState createState() => _RiwayatLesMuridState();
}

class _RiwayatLesMuridState extends State<RiwayatLesMurid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Les'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
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
      )
    );
  }

  
}
