import 'package:flutter/material.dart';

class TagihanMurid extends StatefulWidget {
  @override
  _TagihanMuridState createState() => _TagihanMuridState();
}

class _TagihanMuridState extends State<TagihanMurid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
