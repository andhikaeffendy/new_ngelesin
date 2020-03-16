import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/list_kecamatan_response.dart';
import 'global_variable/temp_var.dart' as globTemp;

class ListKecamatan extends StatefulWidget {
  @override
  _ListKecamatanState createState() => _ListKecamatanState();
}

class _ListKecamatanState extends State<ListKecamatan> {

  List mKecamatan = [
    'Bandung',
    'Jakarta',
    'Surabaya',
    'Ambon',
    'Makassar',
    'Medan',
    'Jogjakarta',
    'Bali',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: kecamatanRequest(),
          builder: (context, snapshot){
            if(snapshot.data == null){
              return Container();
            }else{
              List listKecamatan = snapshot.data.data;
              return ListView.builder(
                  itemCount: listKecamatan.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Datum kecamatan = listKecamatan[index];
                    return Card(
                      child: ListTile(
                        title: Text(kecamatan.kecamatan),
                        onTap: () {
                          globTemp.kecId = kecamatan.id;
                          Navigator.pop(context,kecamatan.kecamatan.toString());},
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }

  Future<ListKecamatanResponse> kecamatanRequest() async {
    String url = "http://apingelesin.com/app/api/web/index.php?r=v1/home/kecamatan&kota_id=" + globTemp.kotaId.toString();
    Dio dio = new Dio();
    Response response;

    response = await dio.get(url);
    print(response.toString());

    ListKecamatanResponse kotaResponse = listKecamatanResponseFromJson(response.toString());

    return kotaResponse;
  }
}