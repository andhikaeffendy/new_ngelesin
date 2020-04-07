import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_soal_jawaban_response.dart';
import 'package:intl/intl.dart';
import 'package:new_ngelesin/chat_soal_message.dart';
import 'api_response_model/global_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'package:dio/dio.dart';
import 'global_variable/app_dialog.dart';

class ListJawabanSoal extends StatefulWidget {
  @override
  _ListJawabanSoalState createState() => _ListJawabanSoalState();
}

class _ListJawabanSoalState extends State<ListJawabanSoal> {
  final formatDate = new DateFormat("dd-MMM-yyyy");
  final currency = new NumberFormat("###,###,###.#");
  List<SoalJawaban> soals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Jawaban Soal'),
      ),
      body: FutureBuilder(
      future: getSoals(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          ListSoalJawabanResponse listSoalJawabanResponse = snapshot.data;
          soals = listSoalJawabanResponse.data;
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
        itemCount: soals.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => _showAlertDialog(soals[index]),
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
                          child: Text(soals[index].kode_soal, style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: 250.0,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(soals[index].nama_guru),
                        )
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          child: Text(
                              formatDate.format(soals[index].tgl)
                          ),
                        ),
                        Container(
                          width: 120.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Rp. '+currency.format(int.parse(soals[index].biaya)), style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
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

  void _showAlertDialog(SoalJawaban soal) async {
    int pilihan = await showDialog(
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
                        'Nama Guru : '
                    ),Text(
                        soal.nama_guru,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),SizedBox(
                      height: 16.0,
                    ),Text(
                        'No Handphone: '
                    ),Text(
                      soal.hp_guru, style: TextStyle(fontWeight: FontWeight.bold),
                    ),SizedBox(
                      height: 16.0,
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: soalActions(context, soal),
                    )
                  ],
                ),
              ),
            ),
          );
        });

    if(pilihan == 2)
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext) => new ChatSoalMessage()));

    if(pilihan == 1) {
      alerDialogProgress(context);
      updateSoalRequest(soal.id, 2).then((task) {
        dismissAlerDialogProgress(context);
        if (task.status == "success") {
          alerDialogLoginSucces(context, "Soal Selesai", task.message);
          setState(() {
            soals.remove(soal);
            soal.status = "2";
            soals.add(soal);
          });
        } else {
          alerDialogLoginFail(context, "Soal Selesai", task.message);
        }
      });
    }
  }

  List<Widget> soalActions(BuildContext context, SoalJawaban soal) {
    List<Widget> result = new List();
    if(soal.status=="1"){
      result.add(ButtonTheme(
        minWidth: 50.0,
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(1),
          child: Text('SELESAI', style: TextStyle(color: Colors.white),),
          color: Colors.blue,),
      ));
      result.add(ButtonTheme(
        minWidth: 50.0,
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(2),
          child: Text('CHAT', style: TextStyle(color: Colors.white),),
          color: Colors.blue,),
      ));
    }
    if(soal.status=="2"){
      result.add(ButtonTheme(
        minWidth: 50.0,
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(2),
          child: Text('HISTORY', style: TextStyle(color: Colors.white),),
          color: Colors.blue,),
      ));
    }
    result.add(ButtonTheme(
      minWidth: 50.0,
      child: RaisedButton(
        onPressed: () => Navigator.of(context).pop(0),
        child: Text('TUTUP', style: TextStyle(color: Colors.white),),
        color: Colors.blue,),
    ));
    return result;
  }

  Future<ListSoalJawabanResponse> getSoals() async {
    String url = account_info.api_url+"?r=soal/lihat-guru-penjawab-soal";
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

    ListSoalJawabanResponse listSoalJawabanResponse =
    listSoalJawabanResponseFromJson(response.toString());

    return listSoalJawabanResponse;
  }

  Future<GlobalResponse> updateSoalRequest(String id, int status) async {
    String url = account_info.api_url + "?r=soal/simpan-status-soal";
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
    FormData formData = new FormData.fromMap({"status": status});

    response = await dio.post(url, data: formData, queryParameters: {
      "id": id,
    });
    print(response.toString());

    GlobalResponse globalResponse = globalResponseFromJson(response.toString());

    return globalResponse;
  }

}
