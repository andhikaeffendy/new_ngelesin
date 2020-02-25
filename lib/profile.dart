import 'package:flutter/material.dart';
import 'package:new_ngelesin/booking_pilihan.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Profile extends StatelessWidget {
  Widget _buildStarItem(String label, double bintang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(label, style: new TextStyle(color: Colors.red, fontSize: 12.0)),
        SmoothStarRating(
          allowHalfRating: false,
          starCount: 5,
          rating: bintang,
          size: 20.0,
          color: Colors.yellow,
          borderColor: Colors.yellow,
          spacing: 0.0,
        ),
        Text(
          '( 0 Suara )',
          style: new TextStyle(
              color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(label, style: new TextStyle(color: Colors.red, fontSize: 12.0)),
        new Wrap(
          children: <Widget>[
            new Container(
              width: 180.0,
              child: new Text(
                desc,
                style: new TextStyle(color: Colors.black, fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 120.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://steamuserimages-a.akamaihd.net/ugc/961971654931781317/B8CF9F6ED4DD4582B2B646EE2AB3DA64F79A43C3/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true"))),
                    )),
                new Text(
                  'Eka Sriwulandari',
                  style: new TextStyle(fontSize: 12.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                new Container(
                  margin: EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildStatItem("Pendidikan",
                          "Psikologi Universitas Kristen Maranatha, Sekolah Dance Bridge Dance Academy"),
                      _buildStarItem("Rating", 3.5),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(20.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pengalaman Bekerja:',
                        style: new TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      ),
                      Text(
                        'Pengajar dance di gereja rehobot, pengajar dance GKI anugrah (anak kecil)',
                        style:
                        new TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                      ),
                      Text(
                        'Pengalaman Organisasi:',
                        style: new TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                      ),
                      Text(
                        'Ketua pementasan dance GKI Anugrah, pengurus dance di GKI Anugrah, staff senat media '
                            'Universitas Kristen Maranatha, Prestasi : finalis 5 dancer terbaik di DBL,'
                            ' juara 1 lomba dance antar sekolah BPK Penabur bandung, juara 3 lomba dance sekota bandung',
                        style:
                        new TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new BookingPilihan())),
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Atur Jadwal'),
          )),
    );
  }
}