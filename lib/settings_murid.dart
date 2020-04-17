import 'package:flutter/material.dart';
import 'package:new_ngelesin/les_pay_murid.dart';
import 'package:new_ngelesin/riwayat_les_murid.dart';
import 'package:new_ngelesin/syarat_dan_ketentuan.dart';
import 'package:new_ngelesin/tagihan_murid.dart';
import 'package:new_ngelesin/tentang_kami_murid.dart';
import 'package:new_ngelesin/topup_saldo_murid.dart';
import 'global_variable/AppSession.dart';

import 'login_murid.dart';

class SettingsMurid extends StatefulWidget {
  @override
  _SettingsMuridState createState() => _SettingsMuridState();
}

class _SettingsMuridState extends State<SettingsMurid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Riwayat Les"),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new RiwayatLesMurid())),
            ),ListTile(
              leading: Icon(Icons.description),
              title: Text("Tagihan"),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new TagihanMurid())),
            ),ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Topup Saldo"),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new TopupSaldoMurid())),
            ),ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Topup Les"),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LesPayMurid())),
            ),ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Tentang Kami"),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new TentangKamiMurid())),
            ),ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text("Syarat dan Ketentuan"),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new SyaratDanKetentuan())),
            ),ListTile(
              leading: Icon(Icons.live_help),
              title: Text("Kontak dan Bantuan"),
              onTap: (){},
            ),ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Keluar"),
              onTap: (){
                print('keluar murid');
                destroySession();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LoginMurid()));
                },
            ),
          ],
        ),
      ),
    );
  }
}
