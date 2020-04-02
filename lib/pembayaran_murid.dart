import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/create_billing_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'global_variable/account_information.dart' as account_info;

class Pembayaran extends StatefulWidget {
  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {

  int group = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),body: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Total Tagihan', style: TextStyle(fontSize: 16.0),),
                Text('Rp. 10.000', style: TextStyle(fontSize: 16.0),),
              ],
            ),
          ),SizedBox(
            height: 16.0,
          ),
          Text('Pilih Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
          SizedBox(
            height: 16.0,
          ),Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Radio(value: (0), groupValue: group, onChanged: (T){
                      print(T);

                      setState(() {
                        group = T;
                      });
                    }),Text('BNI')
                  ],
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Radio(value: (1), groupValue: group, onChanged: (T){
                      print(T);

                      setState(() {
                        group = T;
                      });
                    }),Text('BCA')
                  ],
                ),
                Text('Bank sedang tidak dapat di gunakan', style: TextStyle(color: Colors.red, fontSize: 12.0),),
                SizedBox(
                  height: 16.0,
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Total Bayar', style: TextStyle(color: Colors.black38, fontSize: 12.0),),
                        Text('Rp. 10.000', style: TextStyle(color: Colors.red, fontSize: 14.0),),
                      ],
                    ),ButtonTheme(
                      minWidth: 150.0,
                      child: RaisedButton(
                        onPressed: () => _showAlertDialog("10000", context),
                        child: Text('BAYAR', style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
    );
  }

  void _showAlertDialog(String ammount, context) {
    print("ini jalan");
    FutureBuilder(
      future: makeBillingRequest(ammount).then((task){
        if(task.code == 0){
          if(task.message!=null){
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    content: Container(
                      child: Text(task.message),
                    ),actions: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        },
                      child: Text('OK'),
                    )
                  ],
                  );
                });
          }else{
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    content: Container(
                      child: Text('Nomor Virtual Account anda adalah : '+  task.data.virtualAccount +'. Silahkan selesaikan pembayaran anda.'),
                    ),actions: <Widget>[
                    RaisedButton(
                      onPressed: _launchURL,
                      child: Text('OK, SALIN NOMOR SAYA'),
                    )
                  ],
                  );
                });
          }

        }

      }),
      builder: (context, snapshot){
        if(snapshot.data == null){
          print("masuk data null");
          return Container();
        }else{
          return Container();
        }
      },
    );

  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<CreateBillingResponse> makeBillingRequest(String amount) async{
    print("billing req jalan");
    String url = "https://dev.apingelesin.com/api/web/index.php?r=payment/bni/create-billing";

    var dio = Dio();
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + account_info.jwtLoginSiswaResponse.data.token;

    FormData formData = new FormData.fromMap({"amount": amount});
    print("billing req jalan2");

    Response response = await dio.post(url, data: formData);
    print("Billing Response : " + response.data.toString());

    CreateBillingResponse createBillingResponse =
    createBillingResponseFromJson(response.toString());

    return createBillingResponse;
  }

}
