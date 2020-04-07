import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_soal_murid_response.dart';
import 'package:intl/intl.dart';
import 'package:new_ngelesin/global_variable/app_dialog.dart';
import 'api_response_model/global_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'package:dio/dio.dart';

class LihatSoalMuridFormGuru extends StatefulWidget {
  @override
  _LihatSoalMuridFormGuruState createState() => _LihatSoalMuridFormGuruState();
}

class _LihatSoalMuridFormGuruState extends State<LihatSoalMuridFormGuru> {
  final formatDate = new DateFormat("dd-MMM-yyyy");
  final currency = new NumberFormat("###,###,###.#");
  List<SoalMurid> soalMurids = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soal Murid'),
      ),
      body: FutureBuilder(
        future: getSoals(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            ListSoalMuridResponse listSoalMuridResponse = snapshot.data;
            soalMurids = listSoalMuridResponse.data;
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
    if(soalMurids.length == 0)
      return emptyBooking();
    return ListView.builder(
        itemCount: soalMurids.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => _showAlertDialog(soalMurids[index]),
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
                          child: Text(soalMurids[index].kode_soal, style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: 250.0,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(soalMurids[index].nama),
                        )
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          child: Text(
                              formatDate.format(soalMurids[index].tgl)
                          ),
                        ),
                        Container(
                          width: 120.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Rp. '+currency.format(int.parse(soalMurids[index].biaya)), style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
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

  void _showAlertDialog(SoalMurid soalMurid) async {
    bool take = await showDialog(
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
                            soalMurid.gambar,
                          )
                      ),
                    ),Text(
                        'Nama Murid : '
                    ),Text(
                      soalMurid.nama,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),SizedBox(
                      height: 16.0,
                    ),SizedBox(
                      height: 16.0,
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 100.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text('AMBIL', style: TextStyle(color: Colors.white),),
                            color: Colors.blue,),
                        ),ButtonTheme(
                          minWidth: 100.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text('TUTUP', style: TextStyle(color: Colors.white),),
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
    if(take) {
      alerDialogProgress(context);
      updateSoalMuridRequest(soalMurid.id).then((task) {
        dismissAlerDialogProgress(context);
        if(task.status=="success") {
          alerDialogLoginSucces(context, "Ambil Soal", task.message);
          setState(() {
            soalMurids.remove(soalMurid);
          });
          getSoals().then((task2) {
            if(task2.status==true) {
              ListSoalMuridResponse listSoalMuridResponse = task2;
              soalMurids = listSoalMuridResponse.data;
            }
          });
        } else {
          alerDialogLoginFail(context, "Ambil Soal", task.message);
        }
      });
    }
  }

  Future<ListSoalMuridResponse> getSoals() async {
    String url = account_info.api_url+"?r=soal/guru-lihat-soal-murid";
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

    ListSoalMuridResponse listSoalMuridResponse =
    listSoalMuridResponseFromJson(response.toString());

    return listSoalMuridResponse;
  }

  Future<GlobalResponse> updateSoalMuridRequest(String id) async {
    String url = account_info.api_url+"?r=soal/guru-ambil-soal" ;
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
    print(response.toString());

    GlobalResponse globalResponse =
    globalResponseFromJson(response.toString());

    return globalResponse;
  }

}
