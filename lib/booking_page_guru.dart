import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_ngelesin/chat_message.dart';

class BookingPageGuru extends StatefulWidget {
  @override
  _BookingPageGuruState createState() => _BookingPageGuruState();
}

class _BookingPageGuruState extends State<BookingPageGuru> {
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: _alertDialogDesc,
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
                              'eysd',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('21-Apr-2020'),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 120.0,
                            child: Text(
                              'Mengaji (Lain-lain)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            child: Text('tedi murid'),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            width: 90.0,
                            child: Text(
                              'Proses',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Container(
                            width: 90.0,
                            padding:
                                const EdgeInsets.only(bottom: 8.0, right: 8.0),
                            child: Text(
                              'Rp. 200.000',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _alerDialogSelesai() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Penyelesaian Order Les"),
          content: Text(
              "Anda akan menyelesaikan booking les ini. Apakah anda yakin?"),
          actions: [
            FlatButton(
              child: Text("TIDAK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("YA"),
              onPressed: () {},
            )
          ],
        );
      },
    );
  }

  void _alertDialogDesc() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              Container(
                height: 480.0,
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRC9D5BfQOYMWu8mHXFdRcUvk5mIbEFa-TjzHE1sz9WnZb2bhSX&usqp=CAU',
                          fit: BoxFit.contain,
                          height: 100.0,
                          width: 100.0,
                        )
                      ],
                    ),
                    SizedBox(
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
                              child: Text(''),
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
                              child: Text('dasdad'),
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
                              child: Text('Matematika'),
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
                      child: Text('20-januari-2020 11:00:00 - 13:00:00'),
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
                                'Nama ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text('Andhika sekian'),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Nomor Handphone',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text('082198113362'),
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
                        'Lokasi: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        'cobadah',
                        maxLines: 1,
                      ),
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
                        'Rp. 200.000',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 10.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'BATALKAN',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          child: RaisedButton(
                            onPressed: _alerDialogSelesai,
                            child: Text(
                              'SELESAI',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'TUTUP',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) =>
                                        new ChatMessage())),
                            child: Text(
                              'CHAT',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
