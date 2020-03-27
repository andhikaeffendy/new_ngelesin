import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_response_model/list_guru_response.dart';
import 'package:new_ngelesin/profile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'api_response_model/search_area_v2_response.dart';
import 'global_variable/account_information.dart' as account_info;
import "package:intl/intl.dart";

class PilihanGuru extends StatelessWidget {
  final Area area;
  final int mapel;

  PilihanGuru({Key key, @required this.area, @required this.mapel}) : super(key: key);

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
                child: Card(
                    child: FutureBuilder(
                      future: pilGuru(),
                      builder: (context, snapshot){
                        if (snapshot.connectionState == ConnectionState.done) {
                          ListGuruResponse listGuruResponse = snapshot.data;
                          return new Column(
                            children: generatePilGuru(listGuruResponse.data),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                )
            )
          ],
        ));
  }

  List<Widget> generatePilGuru(List<Guru> gurus){
    List<Widget> result = new List();

    for(int i=0;i<gurus.length;i++)
      result.add(new ListGuru(guru: gurus[i]));

    return result;
  }

  Future<ListGuruResponse> pilGuru() async {
    String url =
        "http://apingelesin.com/app/api/web/index.php?r=v1/booking2/guru-mapel";
    Dio dio = new Dio();
    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              var customHeaders = {
                'content-type': 'application/json',
                'email': account_info.email,
                'password': account_info.password,
              };
              options.headers.addAll(customHeaders);
              return options;
            }
        )
    );
    Response response;

    response = await dio.get(url, queryParameters: {
      "mapel_id": mapel.toString(),
      "area": area.listKecamatanId
    });
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    ListGuruResponse listGuruResponse =
    listGuruResponseFromJson(response.toString());

    return listGuruResponse;
  }
}

class ListGuru extends StatelessWidget {
  Guru guru;
  ListGuru({this.guru});

  var currency = new NumberFormat("###,###,###.#");

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new Profile(guru: guru))),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: new Center(
          child: new Row(
            children: <Widget>[
              new Image(
                image: NetworkImage(guru.foto_profil),
                width: 100.0,
              ),
              new Container(
                padding: const EdgeInsets.all(20.0),
                child: new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        guru.nama_guru,
                        style: new TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      new Row(
                        children: <Widget>[
                          SmoothStarRating(
                            allowHalfRating: false,
                            starCount: 5,
                            rating: guru.rating_guru.toDouble(),
                            size: 20.0,
                            color: Colors.yellow,
                            borderColor: Colors.yellow,
                            spacing: 0.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                          ),
                          new Text(guru.suara.toString()+' Suara')
                        ],
                      ),
                      new Wrap(
                        children: <Widget>[
                          new Container(
                            width: 180.0,
                            child: new Text(
                              guru.pendidikan_terakhir,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      new Text("Rp. " + currency.format(int.parse(guru.biaya)),
                          style: new TextStyle(fontSize: 16.0, color: Colors.red))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}