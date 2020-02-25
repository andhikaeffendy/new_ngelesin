import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:new_ngelesin/verification.dart';


class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Sebagai"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new DaftarSiswa())),
              child: Card(
                child: Column(
                  children: <Widget>[
                    new listDaftar(
                      gambar:
                      'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png',
                      nama: 'Guru',
                    ),
                    new listDaftar(
                      gambar:
                      'https://66.media.tumblr.com/7b1790aa4b0e76318f62da5d4a0dd69f/tumblr_pf7xynYOGR1t2c4f8o2_250.png',
                      nama: 'Murid',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class listDaftar extends StatelessWidget {
  listDaftar({this.gambar, this.nama});
  String gambar;
  String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(gambar),
              width: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 180.0, 0),
              child: Text(nama),
            ),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                alignment: Alignment.centerRight,
                tooltip: 'Pilih Tanggal')
          ],
        ),
      ),
    );
  }
}

class DaftarSiswa extends StatefulWidget {
  @override
  _DaftarSiswaState createState() => _DaftarSiswaState();
}

class _DaftarSiswaState extends State<DaftarSiswa> {
  listDropDown selectedSekolah;
  listDropDown selectedJK;
  listDropDown selectedNgelesin;
  List<listDropDown> jenisKelamin = <listDropDown>[
    const listDropDown('Pria'),
    const listDropDown('Wanita')
  ];
  List<listDropDown> sekolah = <listDropDown>[
    const listDropDown('SD'),
    const listDropDown('SMP'),
    const listDropDown('SMA'),
    const listDropDown('SMK')
  ];
  List<listDropDown> ngelesin = <listDropDown>[
    const listDropDown('Teman'),
    const listDropDown('Keluarga'),
    const listDropDown('Orang Lain'),
    const listDropDown('Lain-lain')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Daftar Siswa"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'No. Handphone'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              DropdownButton<listDropDown>(
                isExpanded: true,
                hint: new Text("Pilih Jenis Kelamin"),
                value: selectedJK,
                onChanged: (listDropDown newValue) {
                  setState(() {
                    selectedJK = newValue;
                  });
                },
                items: jenisKelamin.map((listDropDown user) {
                  return new DropdownMenuItem<listDropDown>(
                    value: user,
                    child: new Text(
                      user.name,
                      style: new TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              DropdownButton<listDropDown>(
                isExpanded: true,
                hint: new Text("Pilih Sekolah"),
                value: selectedSekolah,
                onChanged: (listDropDown newValue) {
                  setState(() {
                    selectedSekolah = newValue;
                  });
                },
                items: sekolah.map((listDropDown user) {
                  return new DropdownMenuItem<listDropDown>(
                    value: user,
                    child: new Text(
                      user.name,
                      style: new TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
              ),
              Text(
                "Dari mana kamu tau ngelesin?",
                style: new TextStyle(fontSize: 16.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              DropdownButton<listDropDown>(
                isExpanded: true,
                hint: new Text("Pilih Salah Satu"),
                value: selectedNgelesin,
                onChanged: (listDropDown newValue) {
                  setState(() {
                    selectedNgelesin = newValue;
                  });
                },
                items: ngelesin.map((listDropDown user) {
                  return new DropdownMenuItem<listDropDown>(
                    value: user,
                    child: new Text(
                      user.name,
                      style: new TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Kecamatan"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Asal Daerah"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Kota"),
              ),
              TextField(
                decoration:
                InputDecoration(labelText: "gatau gua hint nya apa"),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Alamat Lengkap"),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Ulangi Password"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Verification())),
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("REGISTER"),
      ),
    );
  }
}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}




