import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.history, size: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                ),
                Text('Riwayat Les', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom:12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.assignment, size: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                ),
                Text('Tagihan', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.account_balance_wallet, size: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                ),
                Text('Topup saldo', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.account_balance_wallet, size: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                ),
                Text('Topup LES Pay', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.info, size: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                ),
                Text('Tentang Kami', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.person, size: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                ),
                Text('Syarat Dan Ketentuan', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.contacts, size: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                ),
                Text('Kontak Dan Bantuan', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.exit_to_app, size: 30.0,),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                  ),
                  Text('Keluar', textAlign: TextAlign.start, style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),)
                ],
              )
          ),


        ],
      ),
    );
  }
}
