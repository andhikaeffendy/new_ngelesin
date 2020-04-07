import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_soal_saya_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'package:dio/dio.dart';
import 'global_variable/app_dialog.dart';

class LihatSoalSaya extends StatefulWidget {
  @override
  _LihatSoalSayaState createState() => _LihatSoalSayaState();
}

class _LihatSoalSayaState extends State<LihatSoalSaya> {
  List<SoalSaya> soals = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lihat Soal Saya'),
      ),
      body: FutureBuilder(
        future: getSoals(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            ListSoalSayaResponse listSoalSayaResponse = snapshot.data;
            soals = listSoalSayaResponse.data;
            return getWidgetSoal();
          } else {
            return Center(
              child: listViewShimmer(),
            );
          }
        },
      ),
    );
  }

  Widget getWidgetSoal(){
    if(soals.length == 0)
      return emptyBooking();
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: soals.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: GestureDetector(
                onTap: () => _showAlertDialog(soals[index]),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 200,
                      minHeight: 200,
                      maxWidth: 200,
                      maxHeight: 200,
                    ),
                    child: Image.network(
                      soals[index].gambar,
                    )
                ),
              ),),
          );
        });
  }

  _showAlertDialog(SoalSaya soal) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 330.0,
              height: 350.0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 200,
                            minHeight: 200,
                            maxWidth: 200,
                            maxHeight: 200,
                          ),
                          child: Image.network(
                            soal.gambar,
                          )
                      ),
                    ),Text(
                        'Nama Guru : ' + soal.nama_guru
                    ),SizedBox(
                      height: 16.0,
                    ),Text(
                        'Status'
                    ),Text(
                      soal.status == "1" ? 'Diambil Guru' : 'Selesai' , style: TextStyle(fontWeight: FontWeight.bold),
                    ),ButtonTheme(
                      minWidth: 300.0,
                      child: RaisedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('TUTUP', style: TextStyle(color: Colors.white),),
                        color: Colors.blue,),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<ListSoalSayaResponse> getSoals() async {
    String url = account_info.api_url+"?r=soal/lihat-soal-saya";
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

    response = await dio.get(url);
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    ListSoalSayaResponse listSoalSayaResponse =
    listSoalSayaResponseFromJson(response.toString());

    return listSoalSayaResponse;
  }

}
