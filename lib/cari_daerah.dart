import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/search_area_response.dart';
import 'package:new_ngelesin/api_response_model/search_area_v2_response.dart';
import 'package:new_ngelesin/pilihan_guru.dart';

void main() => runApp(CariDaerah());

class CariDaerah extends StatefulWidget {
  final int mapel;

  CariDaerah({Key key, @required this.mapel}) : super(key: key);

  @override
  _CariDaerahState createState() => _CariDaerahState(mapel: mapel);
}

class _CariDaerahState extends State<CariDaerah> {
  final int mapel;
  List<Area> areas = List<Area>();

  _CariDaerahState({@required this.mapel}) : super();

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
            onChanged: (text){
              makeRequestV2(text).then((task) {
                if (task.status == "success") {
                  setState(() {
                    areas.clear();
                    areas.addAll(task.data);
                  });
                }
              });
            },
            controller: searchText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12.0),
              labelText: 'Masukkan Daerah',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: areas.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.location_on),
                    dense: true,
                    title: Text(areas[index].nama),
                    subtitle: Text(areas[index].type),
                    onTap: () {
                      if(areas[index].launched == "1") {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (
                                BuildContext context) => new PilihanGuru(area: areas[index], mapel: mapel)));
                      }
                    },
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

  Future<SearchAreaV2Response> makeRequestV2(String keyword) async {
    String url =
        "http://apingelesin.com/app/api/web/index.php?r=v2/home/search-area";
    Dio dio = new Dio();
    Response response;

    FormData formData =
    new FormData.fromMap({
      "keyword" : keyword,
    });


    response = await dio.post(url, data: formData );
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    SearchAreaV2Response searchAreaV2Response =
    searchAreaV2ResponseFromJson(response.toString());

    return searchAreaV2Response;
  }
}
