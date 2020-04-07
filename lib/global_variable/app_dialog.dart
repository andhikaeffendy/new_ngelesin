import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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

void dismissAlerDialogProgress(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

Widget listViewShimmer(){
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
  ];

  return Shimmer.fromColors(
    child: Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 20.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      width: 120.0,
                      height: 20.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 20.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      width: 120.0,
                      height: 20.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 20.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      width: 120.0,
                      height: 20.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 24.0,
                    )
                  ],
                ),
              ],
            );
          }),
    ),
    baseColor: Colors.grey[700],
    highlightColor: Colors.grey[100],
    direction: ShimmerDirection.rtl,
  );
}

Widget emptyBooking(){
  return Container(
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
  );
}