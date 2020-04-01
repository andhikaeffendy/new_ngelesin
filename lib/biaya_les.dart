import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/biaya_les_response.dart';
import 'package:new_ngelesin/api_response_model/update_biaya_les_response.dart';
import 'global_variable/account_information.dart' as account_info;

class BiayaLes extends StatefulWidget {
  @override
  _BiayaLesState createState() => _BiayaLesState();
}

class _BiayaLesState extends State<BiayaLes> {

  final biayaController = TextEditingController();

  //Alert Dialog Harga
  _EditHarga(BuildContext context, int id, String biaya, String nama) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(nama),
            content: Container(
              width: 400.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: biayaController,
                      decoration: InputDecoration(
                        labelText: 'Isi Biaya / 2 jam',
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('BATAL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),new FlatButton(
                child: new Text('SIMPAN'),
                onPressed: () => updateBiayaMapel(id, biayaController.text, context),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biaya Les'),
      ),
      body: FutureBuilder(
        future: getBiayaMapel(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return Container();
          }else{
            BiayaLesResponse biayaLesResponse = snapshot.data;
            List<Mapel> listBiayaMapel = biayaLesResponse.data.mapel;
            return ListView.builder(
              itemCount: listBiayaMapel.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    leading: Text(listBiayaMapel[index].nama),
                    dense: true,
                    trailing: Text(listBiayaMapel[index].biaya),
                    onTap: () => _EditHarga(context, listBiayaMapel[index].tbGuruMapelId, listBiayaMapel[index].biaya, listBiayaMapel[index].nama),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<BiayaLesResponse> getBiayaMapel() async{
    String url = account_info.api_url+"/dev/api/web/index.php?r=/guru-mapel/mapel";
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

    BiayaLesResponse biayaLesResponse =
    biayaLesResponseFromJson(response.toString());

    return biayaLesResponse;
  }

  Future<UpdateBiayaLesResponse> updateBiayaMapel(int tb_guru_mapel_id, String biaya, context) async{
    String url = account_info.api_url+"/dev/api/web/index.php?r=/guru-mapel/update-mapel";
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

    FormData formData = new FormData.fromMap({"tb_guru_mapel_id": tb_guru_mapel_id, "biaya": biaya});
    Response response;

    response = await dio.post(url, data: formData);

    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    UpdateBiayaLesResponse updateBiayaLesResponse =
    updateBiayaLesResponseFromJson(response.toString());

    return updateBiayaLesResponse;
  }
}
