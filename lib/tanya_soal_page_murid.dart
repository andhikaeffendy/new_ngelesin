import 'package:flutter/material.dart';
import 'package:new_ngelesin/foto_soal_page.dart';
import 'package:new_ngelesin/lihat_soal_saya_murid.dart';
import 'package:new_ngelesin/list_jawaban_soal_murid.dart';

class TanyaSoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tanya Soal"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LihatSoalSaya())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Lihat Soal Saya'),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                    onPressed: (){},
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ListJawabanSoal())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Lihat Jawaban Soal'),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                    onPressed: (){},
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => new FotoSoalPage())),
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("TANYA SOAL"),
      ),
    );
  }
}