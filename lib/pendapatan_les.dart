import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/pendapatan_guru_response.dart';
import 'global_variable/account_information.dart' as account_info;

class PendapatanLes extends StatefulWidget {
  @override
  _PendapatanLesState createState() => _PendapatanLesState();
}

class _PendapatanLesState extends State<PendapatanLes> {

  final List<String> kode = <String> ['M14296','2]JFK98','MPOD3','EIRKD4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendapatan Les'),
      ),
      body: FutureBuilder(
        future: pendapatanRequest(),
        builder: (context, snapshot){
          print("FUTURE JALAN");
          if(snapshot.data == null){
            print("FUTURE JALAN ke null");
            return Container();
          }else{
            print("FUTURE JALAN ke tidak null");
            PendapatanGuruResponse dataPendapatan = snapshot.data;
            List<Datum> listPendapatan = dataPendapatan.data;
            return ListView.builder(
                itemCount: listPendapatan.length,
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
                                child: Text(listPendapatan[index].kodeKelas, style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(listPendapatan[index].tgl),
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
                                child: Text(listPendapatan[index].namaMurid, style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                width: 150.0,
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text('082198113362'),
                              )
                            ],
                          ),Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: 120.0,
                                child: Text(
                                  'Saldo',style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 120.0,
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  listPendapatan[index].ammount, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
              Text('Total Rp. 80.000',style: TextStyle(color: Colors.white),),
            ],
          )
        )
    );
  }

  Future<PendapatanGuruResponse> pendapatanRequest() async{
    String url = "http://apingelesin.com/dev/api/web/index.php?r=v1/guru/lihat-pendapatan";
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

    PendapatanGuruResponse pendapatanGuruResponse =
    pendapatanGuruResponseFromJson(response.toString());

    return pendapatanGuruResponse;
  }

}


//jika datanya kosong, pakai yang ini

//Container(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: <Widget>[
//Icon(
//Icons.unarchive,
//size: 80.0,
//),
//Padding(
//padding: EdgeInsets.all(12.0),
//),
//Text(
//"Oops No Data",
//style: new TextStyle(
//fontWeight: FontWeight.w300,
//color: Colors.blueGrey,
//fontSize: 16.0),
//textAlign: TextAlign.center,
//),
//],
//),
//),