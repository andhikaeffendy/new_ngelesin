import 'package:flutter/material.dart';

class TentangKamiMurid extends StatefulWidget {
  @override
  _TentangKamiMuridState createState() => _TentangKamiMuridState();
}

class _TentangKamiMuridState extends State<TentangKamiMurid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Who We Are', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: Text(
                'Ngelesin merupakan start up di bidang jasa pendidikan berbasis teknologi terlengkap dalam melayani kebutuhan'
                    'berbagai macam bidang dan jenis les di seluruh indonesia'
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text('Our Visi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: Text(
                  'Menjadi Start up jasa les berbasis teknologi terbaik dan terlengkap di Indonesia'
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text('Our Misi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: Text(
                  'Melakukan service excellent dengan target mencapai service level 100% setiap harinya. '
                      'Memberikan kepuasan konsumen dengan target setiap konsumen memberikan rating 5 setiap transaksi'
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
