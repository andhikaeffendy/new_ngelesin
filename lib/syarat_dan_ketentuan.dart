import 'package:flutter/material.dart';

class SyaratDanKetentuan extends StatefulWidget {
  @override
  _SyaratDanKetentuanState createState() => _SyaratDanKetentuanState();
}

class _SyaratDanKetentuanState extends State<SyaratDanKetentuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syarat dan Ketentuan"),
      ),body: Container(
      margin: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("Syarat dan ketentuan Penggunaan Aplikasi ngeLESin", style: TextStyle(fontWeight: FontWeight.bold),),
            ),SizedBox(
              height: 12.0,
            ),
            Container(
              child: Text('Silahkan membaca persyaratan ini secara cermat. Dengan menggunakan layanan kami, maka anda menyatakan '
                  'diri telah membaca, memahami, menerima dan menyetujui syarat penggunaan. Silahkan membatalkan akun anda ('
                  'jika anda telah mendaftar untuk Aplikasi) dan menghapus aplikasi dari perangkat anda jika anda'
                  'tidak setuju atau tidak ingin masuk ke dalam ketentuan penggunaan.'),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: Text('Dengan menggunakan Aplikasi ngelesin, anda setuju bahwa : '),
            ),SizedBox(
              height: 12.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Menggunakan Aplikasi untuk tujuan yang sah'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Menggunakan layanan untuk tujuan yang dimaksudkan'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Tidak akan menggunakan untuk hal yang melanggar hukum atau untuk tujuan penipuan'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Tidak akan menggunakan Aolikasi yang menyebabkan gangguan dan ketidaknyamanan pada pihak lain atau membuat pemesanan palsu'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Tidak akan dengan sengaja ataupun tidak sengaja melakukan sesuatu yang menyebabkan kerugian pada pihak ngeLESin'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Tidak akan mencoba untuk melakukan sesuatu yang membahayakan layanan, Aplikasi dan/tidak software dengan cara apapun'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Tetap menjaga rahasia  password akun anda atau data yang kami sediakan pada anda yang memungkinkan akses ke Aplikasi'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Akan memberikan bukti identitas yang kami minta atau perlukan secara benar.'
                ),
              ),
            ),Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    '• Setuju bahwa hanya satu (1) akun dapat didaftarkan pada satu perangkat'
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
