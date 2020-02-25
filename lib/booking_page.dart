import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Icon(Icons.unarchive, size: 80.0,),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Text("Oops No Data", style: new TextStyle(fontWeight: FontWeight.w300, color: Colors.blueGrey, fontSize: 16.0), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
