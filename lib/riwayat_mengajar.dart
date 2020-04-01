import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global_variable/account_information.dart' as account_info;

import 'api_response_model/history_kelas_guru_response.dart';

class RiwayatMengajar extends StatefulWidget {
  @override
  _RiwayatMengajarState createState() => _RiwayatMengajarState();
}

class _RiwayatMengajarState extends State<RiwayatMengajar> {

  final List<String> kode = <String> ['M14296','2]JFK98','MPOD3','EIRKD4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Mengajar'),
      ),
      body: FutureBuilder(
        future: historyKelasRequest(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return Container();
          }else{
            HistoryKelasGuruResponse historyKelasGuruResponse = snapshot.data;
            List<Datum> listHistory = historyKelasGuruResponse.data;
            final f = new DateFormat('yyyy-MM-dd');

            return ListView.builder(
                itemCount: listHistory.length,
                itemBuilder: (BuildContext context, int index){
                  Datum data = listHistory[index];
                  return GestureDetector(
                    onTap: () => _showAlertDialog(data),
                    child: Container(
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
                                  child: Text(listHistory[index].kodeKelas, style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(f.format(listHistory[index].tgl)),
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
                                  child: Text(listHistory[index].mapel.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  width: 150.0,
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(listHistory[index].guru.toString()),
                                )
                              ],
                            ),Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    listHistory[index].statusKelas
                                    ,style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 120.0,
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    listHistory[index].biaya.toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }

  void _showAlertDialog(Datum listHistory) {
    final f = new DateFormat('yyyy-MM-dd');
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 330.0,
              height: 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        listHistory.fotoGuru,
                        fit: BoxFit.contain,
                        height: 100.0,
                        width: 100.0,
                      )
                    ],
                  ),SizedBox(
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
                            child: Text(listHistory.kodeKelas),
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
                            child: Text(listHistory.metodePembayaran),
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
                            child: Text(listHistory.mapel.toString()),
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
                            child: Text(listHistory.jumlahSiswa),
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
                    child: Text(f.format(listHistory.tgl) +' ' + listHistory.jamMulai +' - '+ listHistory.jamSelesai),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Nama Guru',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(listHistory.guru.toString()),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Lokasi & Jam: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(listHistory.lokasi),
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
                      'Rp. ' + listHistory.biaya,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
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
          );
        });
  }

  Future<HistoryKelasGuruResponse> historyKelasRequest() async{
    String url = "http://apingelesin.com/dev/api/web/index.php?r=v1/guru/history-kelas&guru_id";
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

    HistoryKelasGuruResponse historyKelasGuruResponse =
    historyKelasGuruResponseFromJson(response.toString());

    return historyKelasGuruResponse;
  }
}
