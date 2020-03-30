import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final List<String> coba = <String>['YOSJDKS', 'SKDJXI'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: coba.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: _showAlertDialog,
            child: Container(
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            coba[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('13-Okt-2018'),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150.0,
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            'Pendidikan Agama Islam (Lain-lain)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 150.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('Tedi Guru'),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          child: Text(
                            'Pending',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Rp. 100.000',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 330.0,
              height: 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        "https://www.freeiconspng.com/uploads/school-student-icon-18.png",
                        fit: BoxFit.contain,
                        height: 100.0,
                        width: 100.0,
                      )
                    ],
                  ),SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'No Order',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('YOPESO'),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Pembayaran',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('Saldo'),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Mapel / Bidang',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('Matermatika SD'),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Jumlah Murid',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('1'),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Tanggal Dan Waktu',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('30-Mar-2020 08:00:00 - 10:00:00'),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Nama Guru',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('Rizky Akbar'),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Lokasi & Jam: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('rumah saya,'),
                  ),Container(
                    child: Text('Jam 08:00:00 - 10:00:00'),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Biaya:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Rp. 75.000',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 130.0,
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('BATALKAN', style: TextStyle(color: Colors.white),),
                          color: Colors.blue,),
                      ),
                      ButtonTheme(
                        minWidth: 130.0,
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('TUTUP',style: TextStyle(color: Colors.white),),
                          color: Colors.blue,),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

//Notes : klw kosong masang ini aja untung semuanya

//Container(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          Icon(
//            Icons.unarchive,
//            size: 80.0,
//          ),
//          Padding(
//            padding: EdgeInsets.all(12.0),
//          ),
//          Text(
//            "Oops No Data",
//            style: new TextStyle(
//                fontWeight: FontWeight.w300,
//                color: Colors.blueGrey,
//                fontSize: 16.0),
//            textAlign: TextAlign.center,
//          ),
//        ],
//      ),
//    );
