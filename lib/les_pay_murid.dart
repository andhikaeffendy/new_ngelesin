import 'package:flutter/material.dart';

class LesPayMurid extends StatefulWidget {
  @override
  _LesPayMuridState createState() => _LesPayMuridState();
}

class _LesPayMuridState extends State<LesPayMurid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Andhika', style: TextStyle(color: Colors.red, fontSize: 16.0),),
            Text('Rp. 0')
          ],
        ),
      ),
    );
  }
}
