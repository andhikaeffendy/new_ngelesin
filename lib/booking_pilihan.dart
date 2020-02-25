import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class BookingPilihan extends StatefulWidget {
  @override
  _BookingPilihanState createState() => _BookingPilihanState();
}

class _BookingPilihanState extends State<BookingPilihan> {

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Image(
                      image: NetworkImage(
                          'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png'),
                      width: 100.0,
                      height: 150.0,
                    ),
                    new Container(
                      padding: const EdgeInsets.all(20.0),
                      child: new Center(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Eka Sriwulandari',
                              style: new TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                            new Row(
                              children: <Widget>[
                                SmoothStarRating(
                                  allowHalfRating: false,
                                  starCount: 5,
                                  rating: 3,
                                  size: 20.0,
                                  color: Colors.yellow,
                                  borderColor: Colors.yellow,
                                  spacing: 0.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                ),
                                new Text('0 Suara')
                              ],
                            ),
                            new Wrap(
                              children: <Widget>[
                                new Container(
                                  width: 180.0,
                                  child: new Text(
                                    'Psikologi Universitas Kristen Maranatha. Sekolah Dance Bridge Dance Academy',
                                    style: new TextStyle(
                                        color: Colors.black, fontSize: 12.0),
                                    textAlign: TextAlign.start,
                                  ),
                                )
                              ],
                            ),
                            new Text('Matematika SD',
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colors.red))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Pilih Tanggal'),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      tooltip: 'Pilih Tanggal',
                      onPressed: ()=> _selectDate(context),
                    )
                  ],
                )
              ],
            )),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('BOOKING SEKARANG'),
          )),
    );
  }
}
