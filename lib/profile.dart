import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_guru_response.dart';
import 'package:new_ngelesin/api_response_model/profile_guru_response.dart';
import 'package:new_ngelesin/booking_pilihan.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'global_variable/account_information.dart' as account_info;

class Profile extends StatelessWidget {
  final Guru guru;
  final String mapel_name;

  Profile({Key key, @required this.guru, @required this.mapel_name})
      : super(key: key);

  Widget _buildStarItem(String label, double bintang, int suara) {
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
          '( ' + suara.toString() + ' Suara )',
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
              child: FutureBuilder(
                future: profilGuru(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    ProfileGuruResponse profileGuruResponse = snapshot.data;
                    return generateProfil(profileGuruResponse.data);
                  } else {
                    return Center(
                      child: Shimmer.fromColors(
                        direction: ShimmerDirection.rtl,
                        baseColor: Colors.grey[700],
                        highlightColor: Colors.grey[100],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50.0,
                            ),SizedBox(
                              height: 20.0,
                            ),Container(
                              height: 20.0,
                              width: 200.0,
                              color: Colors.grey,
                            ),
                        SizedBox(
                          height: 20.0,
                        ),Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 120.0,
                                      height: 20.0,
                                      color: Colors.grey,
                                    ),SizedBox(
                                      height: 12.0,
                                    ),Container(
                                      width: 120.0,
                                      height: 20.0,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),Column(
                                  children: <Widget>[
                                    Container(
                                      width: 120.0,
                                      height: 20.0,
                                      color: Colors.grey,
                                    ),SizedBox(
                                      height: 12.0,
                                    ),Container(
                                      width: 120.0,
                                      height: 20.0,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),SizedBox(
                              height: 20.0,
                            ),Container(
                              width: 200.0,
                              height: 20.0,
                              color: Colors.grey,
                            ),SizedBox(
                              height: 20.0,
                            ),Container(
                              width: 200.0,
                              height: 20.0,
                              color: Colors.grey,
                            ),SizedBox(
                              height: 20.0,
                            ),Container(
                              width: 200.0,
                              height: 20.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              )),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new BookingPilihan(
                    guru: this.guru, mapel_name: this.mapel_name))),
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Atur Jadwal'),
          )),
    );
  }

  Column generateProfil(Data data) {
    return Column(
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
                      image: new NetworkImage(guru.foto_profil))),
            )),
        new Text(
          guru.nama_guru,
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
              _buildStatItem("Pendidikan", guru.pendidikan_terakhir),
              _buildStarItem("Rating", guru.rating_guru.toDouble(), guru.suara),
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
                data.pekerjaan.pekerjaan,
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
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
                data.profil.pengalaman_organisasi,
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<ProfileGuruResponse> profilGuru() async {
    String url = account_info.api_url + "?r=booking/data-pengajar";
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var customHeaders = {
        'content-type': 'application/json',
        'email': account_info.email,
        'password': account_info.password,
      };
      options.headers.addAll(customHeaders);
      return options;
    }));
    Response response;

    response =
        await dio.get(url, queryParameters: {"id_guru": guru.tb_guru_id});
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage);

    ProfileGuruResponse profileGuruResponse =
        profileGuruResponseFromJson(response.toString());

    return profileGuruResponse;
  }
}
