import 'package:flutter/material.dart';

class TopupSaldoMurid extends StatefulWidget {
  @override
  _TopupSaldoMuridState createState() => _TopupSaldoMuridState();
}

class _TopupSaldoMuridState extends State<TopupSaldoMurid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topup Saldo'),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: Text('Rekening Bank Transfer Top Up Saldo Les-Pay'),
          ),
          SizedBox(
            height: 30.0,
          ),
          ExpansionTile(
            title: Container(
              child: Text('BCA'),
            ),
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('Bank Central Asia (BCA)',
                        textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('Rekening : 5140303552'),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('an. Anthonius'))),
            ],
          ),
          ExpansionTile(
            title: Container(
              child: Text('BNI'),
            ),
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('Bank BNI',style: TextStyle(fontWeight: FontWeight.bold),),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('Rekening : 0389283202'),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('an. Anthonius'))),
            ],
          )
        ],
      )),
    );
  }
}
