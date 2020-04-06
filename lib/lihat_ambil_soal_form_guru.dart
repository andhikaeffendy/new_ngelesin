import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_ambil_soal_response.dart';
import 'package:intl/intl.dart';
import 'api_response_model/global_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'package:dio/dio.dart';

class LihatAmbilSoalFormGuru extends StatefulWidget {
  @override
  _LihatAmbilSoalFormGuruState createState() => _LihatAmbilSoalFormGuruState();
}

class _LihatAmbilSoalFormGuruState extends State<LihatAmbilSoalFormGuru> {
  final formatDate = new DateFormat("dd-MMM-yyyy");
  final currency = new NumberFormat("###,###,###.#");
  List<AmbilSoal> ambilSoals = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambil Soal'),
      ),
      body: FutureBuilder(
        future: getSoals(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            ListAmbilSoalResponse listAmbilSoalResponse = snapshot.data;
            ambilSoals = listAmbilSoalResponse.data;
            return getWidgetSoal();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget emptyBooking(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.unarchive,
            size: 80.0,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Text(
            "Oops No Data",
            style: new TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.blueGrey,
                fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget getWidgetSoal(){
    if(ambilSoals.length == 0)
      return emptyBooking();
    return ListView.builder(
        itemCount: ambilSoals.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () {
              getSoalDetail(ambilSoals[index].id).then((task){
                if(task.status == true) {
                  _showAlertDialog(task.data[0]);
                }
              });
            },
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
                          width: 250.0,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(ambilSoals[index].kode_soal, style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: 250.0,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(ambilSoals[index].nama),
                        )
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          child: Text(
                              formatDate.format(ambilSoals[index].tgl)
                          ),
                        ),
                        Container(
                          width: 120.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Rp. '+currency.format(int.parse(ambilSoals[index].biaya)), style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
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

  void _showAlertDialog(AmbilSoal ambilSoal) async {
    bool chat = await showDialog(
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
                            ambilSoal.gambar,
                          )
                      ),
                    ),Text(
                        'Nama Siswa : '
                    ),Text(
                      ambilSoal.nama,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),SizedBox(
                      height: 16.0,
                    ),Text(
                        'No Handphone: '
                    ),Text(
                      ambilSoal.hp_siswa, style: TextStyle(fontWeight: FontWeight.bold),
                    ),SizedBox(
                      height: 16.0,
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 100.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text('TUTUP', style: TextStyle(color: Colors.white),),
                            color: Colors.blue,),
                        ),ButtonTheme(
                          minWidth: 100.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text(ambilSoal.status == "1" ? 'KIRIM JAWABAN' : 'HISTORY' , style: TextStyle(color: Colors.white),),
                            color: Colors.blue,),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
//    SHOWING CHAT
//    if(chat)
  }

  Future<ListAmbilSoalResponse> getSoals() async {
    String url = account_info.api_url+"?r=soal/guru-lihat-ambil-soal";
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

    ListAmbilSoalResponse listAmbilSoalResponse =
    listAmbilSoalResponseFromJson(response.toString());

    return listAmbilSoalResponse;
  }

  Future<ListAmbilSoalResponse> getSoalDetail(String id) async {
    String url = account_info.api_url+"?r=soal/guru-lihat-detail-ambil-soal";
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
      "id": id,
    });
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    ListAmbilSoalResponse listAmbilSoalResponse =
    listAmbilSoalResponseFromJson(response.toString());

    return listAmbilSoalResponse;
  }

}
