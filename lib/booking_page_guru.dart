import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_ngelesin/chat_message.dart';
import 'package:shimmer/shimmer.dart';

class BookingPageGuru extends StatefulWidget {
  @override
  _BookingPageGuruState createState() => _BookingPageGuruState();
}

class _BookingPageGuruState extends State<BookingPageGuru> {
  final List<String> entries = <String>['A', 'B', 'C', 'C', 'C', 'C', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
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
      ),
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
