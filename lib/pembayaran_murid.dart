import 'package:flutter/material.dart';

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
                        onPressed: (){},
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
}
