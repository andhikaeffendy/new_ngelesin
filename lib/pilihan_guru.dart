import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/search_area_v2_response.dart';
import 'package:new_ngelesin/profile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PilihanGuru extends StatelessWidget {
  final Area area;

  PilihanGuru({Key key, @required this.area}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blue,
          title: new Text('Pilihan Guru'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            new GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Profile())),
                child: Card(
                    child: new Column(
                      children: <Widget>[
                        new ListGuru(
                          gambar:
                          'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png',
                          nama: 'Eka Sriwulandari',
                          bintang: 3,
                          desc:
                          'Psikologi University Kristen Maranatha. Sekolah dance Bridge Dance Academy',
                          harga: 'Rp. 75.000',
                        ),
                        new ListGuru(
                          gambar:
                          'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png',
                          nama: 'Eka Sriwulandari',
                          bintang: 3,
                          desc: 'Psikologi University',
                          harga: 'Rp. 75.000',
                        ),
                        new ListGuru(
                          gambar:
                          'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png',
                          nama: 'Eka Sriwulandari',
                          bintang: 3,
                          desc: 'Psikologi University',
                          harga: 'Rp. 75.000',
                        ),
                        new ListGuru(
                          gambar:
                          'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png',
                          nama: 'Eka Sriwulandari',
                          bintang: 3,
                          desc: 'Psikologi University',
                          harga: 'Rp. 75.000',
                        ),
                      ],
                    )))
          ],
        ));
  }
}

class ListGuru extends StatelessWidget {
  ListGuru({this.gambar, this.nama, this.bintang, this.desc, this.harga});
  String gambar;
  String nama;
  double bintang;
  String desc;
  String harga;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(8.0),
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Image(
              image: NetworkImage(gambar),
              width: 100.0,
            ),
            new Container(
              padding: const EdgeInsets.all(20.0),
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      nama,
                      style: new TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    new Row(
                      children: <Widget>[
                        SmoothStarRating(
                          allowHalfRating: false,
                          starCount: 5,
                          rating: bintang,
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
                            desc,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 12.0),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                    new Text(harga,
                        style: new TextStyle(fontSize: 16.0, color: Colors.red))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}