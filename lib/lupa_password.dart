import 'package:flutter/material.dart';

class LupaPassword extends StatefulWidget {
  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lupa Password murid"),
      ),body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: "Email"
                ),
              ),TextField(
                decoration: InputDecoration(
                    labelText: "No Handphone"
                ),
              )
            ],
          ),
        )
    ),
      bottomNavigationBar: RaisedButton(
        onPressed: (){},
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Kirim Password"),
      ),
    );
  }
}