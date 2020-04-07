import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_ngelesin/api_response_model/tagihan_response.dart';
import 'global_variable/account_information.dart' as account_info;


class TagihanMurid extends StatefulWidget {
  @override
  _TagihanMuridState createState() => _TagihanMuridState();
}

class _TagihanMuridState extends State<TagihanMurid> {

  final List<String> kode = <String> ['M14296','2]JFK98','MPOD3','EIRKD4'];
  final f = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tagihan'),
      ),
        body: FutureBuilder(
          future: getTagihanRequest(),
          builder: (context, snapshot){
            if(snapshot.data == null){
              return Container();
            }else{
              TagihanResponse tagihanResponse = snapshot.data;
              if(tagihanResponse.code == "404"){
                return Container(
                  child: Text(tagihanResponse.message, style: TextStyle(fontWeight: FontWeight.bold)) ,
                );
              }else{
                List<Datum> listTagihan = tagihanResponse.data;
                return ListView.builder(
                    itemCount: listTagihan.length,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: () => _showAlertDialog(listTagihan[index]),
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
                                      child: Text(listTagihan[index].kodeKelas, style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(f.format(listTagihan[index].tgl)),
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
                                      child: Text(listTagihan[index].mapel, style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      width: 150.0,
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Text(listTagihan[index].guru),
                                    )
                                  ],
                                ),Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        'CASH'
                                        ,style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 120.0,
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        'Rp.'+listTagihan[index].biaya, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
            }
          },
        )
    );
  }

  Future<TagihanResponse> getTagihanRequest() async{
    String url = account_info.api_url+"?r=v1/siswa/tagihan&siswa_id="+account_info.loginSiswaResponseData.data.id.toString();

    var dio = Dio();
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

    Response response = await dio.get(url);
    print("Tagihan Response : " + response.data.toString());

    TagihanResponse tagihanResponse =
    tagihanResponseFromJson(response.toString());

    return tagihanResponse;

  }

  void _showAlertDialog(Datum dataTagihan) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 330.0,
              height: 350.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                            child: Text(dataTagihan.kodeKelas),
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
                            child: Text(dataTagihan.discount),
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
                            child: Text(dataTagihan.mapel),
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
                            child: Text(dataTagihan.jumlahSiswa),
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
                    child: Text(f.format(dataTagihan.tgl)),
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
                    child: Text(dataTagihan.guru),
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
                    child: Text(dataTagihan.lokasi),
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
                      'Rp. ' + dataTagihan.biaya,
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
}
