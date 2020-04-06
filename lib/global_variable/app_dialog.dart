import 'package:flutter/material.dart';

Future<bool> alerDialogLoginSucces(BuildContext context, String title, String message) async {
  bool result = await showDialog(
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
                Text(title, style: TextStyle(fontSize: 24.0),),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  child: Text(message),
                ),SizedBox(
                  height: 16.0,
                ),ButtonTheme(
                  minWidth: 50.0,
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    color: Colors.green,
                    child: Text('OK', style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        );
      });
  return result;
}

Future<bool> alerDialogLoginFail(BuildContext context, String title, String message) async {
  bool result = await showDialog(
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
                  backgroundImage: NetworkImage('http://getdrawings.com/free-icon/fail-icon-65.png'),
                ),SizedBox(
                  height: 16.0,
                ),
                Text(title, style: TextStyle(fontSize: 24.0),),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  child: Text(message),
                ),SizedBox(
                  height: 16.0,
                ),ButtonTheme(
                  minWidth: 50.0,
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    color: Colors.green,
                    child: Text('OK', style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        );
      });
  return result;
}

void alerDialogProgress(BuildContext context) {
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
                SizedBox(
                  child: CircularProgressIndicator(),
                  height: 60.0,
                  width: 60.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        );
      });
}