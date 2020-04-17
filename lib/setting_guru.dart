import 'package:flutter/material.dart';
import 'package:new_ngelesin/riwayat_mengajar.dart';
import 'package:new_ngelesin/biaya_les.dart';
import 'package:new_ngelesin/kelola_jadwal.dart';
import 'package:new_ngelesin/login_guru.dart';
import 'package:new_ngelesin/pendapatan_jawab_soal.dart';
import 'package:new_ngelesin/pendapatan_les.dart';
import 'package:new_ngelesin/setting_biaya_les.dart';
import 'package:new_ngelesin/syarat_dan_ketentuan.dart';
import 'package:new_ngelesin/tentang_kami_murid.dart';
import 'global_variable/AppSession.dart';

class SettingGuru extends StatefulWidget {
  @override
  _SettingGuruState createState() => _SettingGuruState();
}

class _SettingGuruState extends State<SettingGuru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Settings Biaya Les"),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new SettingBiayaLes())),
              ),ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Kelola Jadwal Les"),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new KelolaJadwal())),
              ),ListTile(
                leading: Icon(Icons.mode_edit),
                title: Text("Lihat Biaya Les"),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new BiayaLes())),
              ),ListTile(
                leading: Icon(Icons.history),
                title: Text("Riwayat Mengajar"),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new RiwayatMengajar())),
              ),ListTile(
                leading: Icon(Icons.receipt),
                title: Text("Pendapatan Les"),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new PendapatanLes())),
              ),ListTile(
                leading: Icon(Icons.receipt),
                title: Text("Pendapatan Jawab Soal"),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new PendapatanJawabSoal())),
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
                  print('keluar guru');
                  destroySession();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new LoginGuru()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
