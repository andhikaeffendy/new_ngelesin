import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_ngelesin/api_response_model/pendapatan_soal_response.dart';
import 'global_variable/account_information.dart' as account_info;


class PendapatanJawabSoal extends StatefulWidget {
  @override
  _PendapatanJawabSoalState createState() => _PendapatanJawabSoalState();
}

class _PendapatanJawabSoalState extends State<PendapatanJawabSoal> {

  final List<String> kode = <String> ['M14296','2]JFK98','MPOD3','EIRKD4'];

  @override
  Widget build(BuildContext context) {
    int total = 0;
    final f = new DateFormat('yyyy-MM-dd hh:mm');
    return Scaffold(
        appBar: AppBar(
          title: Text('Pendapatan Jawab Soal'),
        ),
        body: FutureBuilder(
          future: pendapatanRequest(),
          builder: (context, snapshot){
            if(snapshot.data == null) {
              return Container();
            }else{
              PendapatanSoalResponse pendapatanSoalResponse = snapshot.data;
              List<Datum> dataPendapatan = pendapatanSoalResponse.data;

              for(int i = 0 ; i < dataPendapatan.length ; i++){
                total = int.parse(dataPendapatan[i].biaya) + total;
              }
              return ListView.builder(
                  itemCount: dataPendapatan.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
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
                                  child: Text(dataPendapatan[index].kodeSoal, style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(f.format(dataPendapatan[index].tgl)),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150.0,
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(dataPendapatan[index].namaSiswa, style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  width: 150.0,
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(dataPendapatan[index].hpSiswa),
                                )
                              ],
                            ),Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    'Biaya',style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 120.0,
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    dataPendapatan[index].biaya, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
        bottomNavigationBar: Container(
            height: 35.0,
            padding: const EdgeInsets.only(right: 12.0),
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('Total Rp. '+total.toString(),style: TextStyle(color: Colors.white),),
              ],
            )
        )
    );
  }
  Future<PendapatanSoalResponse> pendapatanRequest() async{
    String url = "http://apingelesin.com/dev/api/web/index.php?r=v1/guru/lihat-pendapatan-soal";
    Dio dio = new Dio();
    print(account_info.email + account_info.password);
    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              var customHeaders = {
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

    PendapatanSoalResponse pendapatanSoalResponse =
    pendapatanSoalResponseFromJson(response.toString());

    return pendapatanSoalResponse;
  }
}
