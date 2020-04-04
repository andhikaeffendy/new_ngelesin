import 'package:flutter/material.dart';

import 'akun_page.dart';

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Password'),
      ),body: Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Password Lama'),
          ),SizedBox(
            height: 8.0,
          ),TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Password Baru'),
          ),SizedBox(
            height: 8.0,
          ),TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Ulang Password'),
          ),SizedBox(
            height: 12.0,
          ),ButtonTheme(
            minWidth: 380.0,
            child: RaisedButton(
              padding: const EdgeInsets.all(12.0),
              color: Colors.indigo,
              onPressed: _alerDialogUpdatePassword,
              child: Text('EDIT PASSWORD',style: TextStyle(color: Colors.white,fontSize: 16.0),),
            ),
          )
        ],
      ),
    ),
    );
  }

  void _alerDialogUpdatePassword(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 250.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/423-4236368_icon-ceklis-png-transparent-png.png'),
                  ),SizedBox(
                    height: 16.0,
                  ),
                  Text('Edit Password', style: TextStyle(fontSize: 24.0),),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Text('Sukses Melakukan Update Password'),
                  ),SizedBox(
                    height: 16.0,
                  ),ButtonTheme(
                    minWidth: 50.0,
                    child: RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      color: Colors.green,
                      child: Text('OK', style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

}
