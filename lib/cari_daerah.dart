import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/search_area_response.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

void main() => runApp(CariDaerah());

class CariDaerah extends StatefulWidget {
  @override
  _CariDaerahState createState() => _CariDaerahState();
}

class _CariDaerahState extends State<CariDaerah> {
  List<String> litems = ["tingkiwingki", "dipsi", "lala", "poo"];

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Kota'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (text){
              FutureBuilder(
                future: makeRequest(text),
                builder: (context, snapshot){
                  return null;
                },
              );
            },
            controller: searchText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12.0),
              labelText: 'Masukkan Daerah',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: litems.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.location_on),
                    dense: true,
                    title: Text(litems[index]),
                    onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PilihanGuru())),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<SearchAreaResponse> makeRequest(String keyword) async {
    String url =
        "http://apingelesin.com/app/api/web/index.php?r=v1/home/search-area";
    Dio dio = new Dio();
    Response response;

    FormData formData =
    new FormData.fromMap({
      "keyword" : keyword,
    });


    response = await dio.post(url, data: formData );
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    SearchAreaResponse searchAreaResponse =
    searchAreaResponseFromJson(response.toString());

    return searchAreaResponse;
  }
}
