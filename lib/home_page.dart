import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/akademik_page.dart';
import 'package:new_ngelesin/anak_page.dart';
import 'package:new_ngelesin/api_response_model/kategori_response.dart';
import 'package:new_ngelesin/bahasa_page.dart';
import 'package:new_ngelesin/kategori_page.dart';
import 'package:new_ngelesin/keterampilan_page.dart';
import 'package:new_ngelesin/lainnya_page.dart';
import 'package:new_ngelesin/musik_page.dart';
import 'package:new_ngelesin/olahraga.dart';
import 'package:new_ngelesin/pilihan_guru.dart';
import 'package:new_ngelesin/tanya_soal_page.dart';
import 'package:new_ngelesin/api_response_model/banner_response.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image_slider_caralous = Container(
      height: 160.0,
      margin: EdgeInsets.symmetric(vertical: 0),
      child: FutureBuilder(
        future: bannerRequest(),
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            BannerResponse bannerResponse = snapshot.data;
            var images = new List(bannerResponse.data.length);
            for (var i = 0; i < bannerResponse.data.length; i++)
              images[i] = NetworkImage(
                  bannerResponse.data[i].gambar);
            return Carousel(
              boxFit: BoxFit.fill,
              images: images,
              autoplay: true,
              indicatorBgPadding: 6.0,
              dotBgColor: Colors.transparent,
              dotSize: 4.0,

            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
                child: FutureBuilder(
                  future: kategoriRequest(),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.done) {
                      KategoriResponse kategoriResponse = snapshot.data;
                      return generateKategori(context, kategoriResponse.data);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  Column generateKategori(BuildContext context, List<Kategori> listKategori){
    List<Widget> kategories = new List();

    int total_row = (listKategori.length / 3).ceil();

    for(int i=0;i<total_row;i++){
      if(3*i+2 < listKategori.length) {
        kategories.add(generateAlign(context, listKategori[3*i], listKategori[3*i+1], listKategori[3*i+2]));
      } else if (3*i+1 < listKategori.length){
        kategories.add(generateAlign(context, listKategori[3*i], listKategori[3*i+1], null));
      } else {
        kategories.add(generateAlign(context, listKategori[3*i], null, null));
      }
    }
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:kategories
    );
  }

  Align generateAlign(BuildContext context, Kategori kategori1, Kategori kategori2, Kategori kategori3 ){
    List<Widget> result = new List();
    if(kategori1 != null) {
      result.add(generateColumn(context, kategori1));
    }
    if(kategori2 != null) {
      result.add(generateColumn(context, kategori2));
    }
    if(kategori3 != null) {
      result.add(generateColumn(context, kategori3));
    }

    return new Align(
      alignment: Alignment.center,
      child: new Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: result,
        ),
      ),
    );
  }

  Column generateColumn(BuildContext context, Kategori kategori){
    return new Column(
      children: <Widget>[
        new Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      kategori.gambar))),
          child: FlatButton(
            onPressed: () {
              if(kategori.nama == "Tanya Soal") {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (BuildContext) =>
                        new TanyaSoalPage()));
              } else if(kategori.nama == "Help Center"){
              } else {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (BuildContext) =>
                        new KategoriPage(kategori: kategori)));
              }
            },
            padding: const EdgeInsets.all(8.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            kategori.nama,
            style: new TextStyle(fontSize: 14.0),
          ),
        )
      ],
    );
  }

  Future<BannerResponse> bannerRequest() async {
    String url = "https://apingelesin.com/app/api/web/index.php?r=v1/home/banners";
    Dio dio = new Dio();
    Response response;

    response = await dio.get(url);
    print(response.toString());

    BannerResponse bannerResponse = bannerResponseFromJson(response.toString());

    return bannerResponse;
  }

  Future<KategoriResponse> kategoriRequest() async {
    String url = "https://apingelesin.com/app/api/web/index.php?r=v1/home/kategori";
    Dio dio = new Dio();
    Response response;

    response = await dio.get(url);
    print(response.toString());

    KategoriResponse kategoriResponse = kategoriResponseFromJson(response.toString());

    return kategoriResponse;
  }
}