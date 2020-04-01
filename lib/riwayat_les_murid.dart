import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/history_kelas_v1_siswa_response.dart';
import 'global_variable/account_information.dart' as account_info;


class RiwayatLesMurid extends StatefulWidget {
  @override
  _RiwayatLesMuridState createState() => _RiwayatLesMuridState();
}

class _RiwayatLesMuridState extends State<RiwayatLesMurid> {

  final List<String> kode = <String> ['M14296','2]JFK98','MPOD3','EIRKD4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Les'),
      ),
      body: FutureBuilder(
        future: makeRequest(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return Container();
          }else{
            HistoryKelasV1SiswaResponse historyKelas = snapshot.data;
            List<Datum> listHistory = historyKelas.data;
            return ListView.builder(
                itemCount: listHistory.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: _showAlertDialog,
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
                                  child: Text(listHistory[index].tgl),
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
                                  child: Text(listHistory[index].mapel, style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  width: 150.0,
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(listHistory[index].guru),
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
                                    listHistory[index].biaya, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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

  void _showAlertDialog() {
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
                        "https://www.freeiconspng.com/uploads/school-student-icon-18.png",
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
                            child: Text('YOPESO'),
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
                            child: Text('Saldo'),
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
                            child: Text('Matermatika SD'),
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
                            child: Text('1'),
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
                    child: Text('30-Mar-2020 08:00:00 - 10:00:00'),
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
                    child: Text('Rizky Akbar'),
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
                    child: Text('rumah saya,'),
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
                      'Rp. 75.000',
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

  Future<HistoryKelasV1SiswaResponse> makeRequest() async {
    String url = account_info.api_url+"/app/api/web/index.php?r=v1/siswa/history-kelas&siswa_id="+account_info.loginSiswaResponseData.data.id.toString();
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

    HistoryKelasV1SiswaResponse historyKelasV1SiswaResponse =
    historyKelasV1SiswaResponseFromJson(response.toString());

    return historyKelasV1SiswaResponse;
  }

}
