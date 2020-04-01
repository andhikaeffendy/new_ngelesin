import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_kota_response.dart';
import 'global_variable/temp_var.dart' as globTemp;
import 'global_variable/account_information.dart' as account_info;

class ListKota extends StatefulWidget {
  @override
  _ListKotaState createState() => _ListKotaState();
}

class _ListKotaState extends State<ListKota> {

  List mKota = [
    'Bandung',
    'Jakarta',
    'Surabaya',
    'Ambon',
    'Makassar',
    'Medan',
    'Jogjakarta',
    'Bali'
  ];

  @override
  Widget build(BuildContext context) {
    print("id provinsi : " + globTemp.provId.toString());
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: kotaRequest(),
          builder: (context, snapshot){
            if(snapshot.data == null){
              return Container();
            }else{
              ListKotaResponse listKotaResponse = snapshot.data;
              List listKota = listKotaResponse.data;
              return ListView.builder(
                  itemCount: listKota.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Datum kota = listKota[index];
                    return Card(
                      child: ListTile(
                        title: Text(kota.kota),
                        onTap: () {
                          globTemp.kotaId = kota.id;
                          Navigator.pop(context,kota.kota.toString());},
                      ),
                    );
                  });
            }
          },
        )
      ),
    );
  }

  Future<ListKotaResponse> kotaRequest() async {
    String url = account_info.api_url+"?r=v1/home/kota&provinsi_id=" + globTemp.provId.toString();
    Dio dio = new Dio();
    Response response;

    response = await dio.get(url);

    ListKotaResponse kotaResponse = listKotaResponseFromJson(response.toString());

    return kotaResponse;
  }
}