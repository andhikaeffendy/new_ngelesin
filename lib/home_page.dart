import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/akademik_page.dart';
import 'package:new_ngelesin/anak_page.dart';
import 'package:new_ngelesin/bahasa_page.dart';
import 'package:new_ngelesin/keterampilan_page.dart';
import 'package:new_ngelesin/lainnya_page.dart';
import 'package:new_ngelesin/musik_page.dart';
import 'package:new_ngelesin/olahraga.dart';
import 'package:new_ngelesin/pilihan_guru.dart';
import 'package:new_ngelesin/tanya_soal_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image_slider_caralous = Container(
      height: 160.0,
      margin: EdgeInsets.symmetric(vertical: 0),
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          NetworkImage(
              'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png'),
          NetworkImage(
              'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png'),
          NetworkImage(
              'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png'),
        ],
        autoplay: true,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
        dotSize: 4.0,

      ),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home Page',
        routes: <String, WidgetBuilder>{
          '/halamanHome': (BuildContext context) => new HomePage(),
          '/pilGuru': (BuildContext context) => new PilihanGuru(),
        },
        home: Scaffold(
          body: ListView(
            children: <Widget>[
              image_slider_caralous,
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: new Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/Akademik356a192b7913b04c54574d18c28d46e6395428ab.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new AkademikPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Akademik",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/bahasada4b9237bacccdf19c0760cab7aec4a8359010b0.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new BahasaPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Bahasa",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/olahraga77de68daecd823babbb58edb1c8e14d7106e83bb.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new OlahragaPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Olahraga",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: new Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/keterampilan1b6453892473a467d07372d45eb05abc2031647a.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new KeterampilanPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Keterampilan",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/anakac3478d69a3c81fa62e60f5c3696165a4e5e6ac4.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new AnakPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Anak-anak",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/musikc1dfd96eea8cc2b62785275bca38ac261256e278.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new MusikPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Musik",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: new Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/lainnya902ba3cda1883801594b6e1b452790cc53948fda.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new LainnyaPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Lainnya",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/soal2b1d5781111d84f7b3fe45a0852e59758cd7a87e5.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new TanyaSoalPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Tanya Soal",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://apingelesin.com/app/uploads/kategori/help17ba0791499db908433b80f37c5fbc89b870084b.png"))),
                                  child: FlatButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                            new AkademikPage())),
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Help Center",
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}