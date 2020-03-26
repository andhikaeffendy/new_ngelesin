import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/tagihan_response.dart';
import 'global_variable/account_information.dart' as account_info;


class TagihanMurid extends StatefulWidget {
  @override
  _TagihanMuridState createState() => _TagihanMuridState();
}

class _TagihanMuridState extends State<TagihanMurid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.unarchive,
                  size: 80.0,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                ),
                FutureBuilder(
                  future: getTagihanRequest(),
                  builder: (context, snapshot){
                    if(snapshot.data!=null){
                      TagihanResponse tagihanData = snapshot.data;
                      return Text(
                        tagihanData.message,
                        style: new TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.blueGrey,
                            fontSize: 16.0),
                        textAlign: TextAlign.center,
                      );
                    }else{
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        )
    );
  }

  Future<TagihanResponse> getTagihanRequest() async{
    String url = "http://apingelesin.com/app/api/web/index.php?r=v1/siswa/tagihan&siswa_id=1692";

    var dio = Dio();
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

    Response response = await dio.get(url);
    print("GET PROFILE REQUEST : " + response.data.toString());

    TagihanResponse tagihanResponse =
    tagihanResponseFromJson(response.toString());

    return tagihanResponse;

  }
}
