import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_response_model/all_province_response.dart';
import 'global_variable/temp_var.dart' as globTemp;

class listProvinsi extends StatefulWidget {
  @override
  _listProvinsiState createState() => _listProvinsiState();
}

class _listProvinsiState extends State<listProvinsi> {
  List mProvinsi = [
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
          future: provinceRequest(),
          builder: (context, snapshot){
            if(snapshot.data == null){
              return Container();
            }else{
              AllProvinceResponse provinceResponse = snapshot.data;
              List allProvince = provinceResponse.data;
              return ListView.builder(
                  itemCount: allProvince.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Datum province = allProvince[index];
                    return Card(
                      child: ListTile(
                        title: Text(province.provinsi),
                        onTap: () {
                          globTemp.provId = province.id;
                          Navigator.pop(context,province.provinsi.toString());},
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }

  Future<AllProvinceResponse> provinceRequest() async {
    String url = "http://apingelesin.com/app/api/web/index.php?r=v1/home/provinsi";
    Dio dio = new Dio();
    Response response;

    response = await dio.get(url);

    AllProvinceResponse allProvinceResponse = allProvinceResponseFromJson(response.toString());

    return allProvinceResponse;
  }
}


