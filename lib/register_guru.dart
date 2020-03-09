import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:new_ngelesin/verification.dart';

class RegisterGuru extends StatefulWidget {
  @override
  _RegisterGuruState createState() => _RegisterGuruState();
}

class _RegisterGuruState extends State<RegisterGuru> {
  listDropDown selectedJK;
  List<listDropDown> jenisKelamin = <listDropDown>[
    const listDropDown('Pria'),
    const listDropDown('Wanita')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Daftar Guru"),
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
              TextField(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new listProvinsi())),
                decoration: InputDecoration(labelText: "Provinsi"),
              ),
              TextField(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new ListKota())),
                decoration: InputDecoration(labelText: "Kota"),
              ),
              TextField(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new ListKecamatan())),
                decoration: InputDecoration(labelText: "Kecamatan"),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Alamat Lengkap"),
              ),TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Pendidikan Terakhir"),
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

class listProvinsi extends StatefulWidget {
  @override
  _listProvinsiState createState() => _listProvinsiState();
}

class _listProvinsiState extends State<listProvinsi> {

  List mProvinsi = [
    'Bandung',
    'Jakarta',
    'Surabaya',
    'Ambon',
    'Makassar',
    'Medan',
    'Jogjakarta',
    'Bali',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: mProvinsi.length,
            itemBuilder: (BuildContext context, int index){
              final provinsi = mProvinsi[index].toString();
              return Card(
                child: ListTile(
                  title: Text(provinsi),
                ),
              );
            }),
      ),
    );
  }
}

class ListKecamatan extends StatefulWidget {
  @override
  _ListKecamatanState createState() => _ListKecamatanState();
}

class _ListKecamatanState extends State<ListKecamatan> {

  List mKecamatan = [
    'Bandung',
    'Jakarta',
    'Surabaya',
    'Ambon',
    'Makassar',
    'Medan',
    'Jogjakarta',
    'Bali',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: mKecamatan.length,
            itemBuilder: (BuildContext context, int index){
              final provinsi = mKecamatan[index].toString();
              return Card(
                child: ListTile(
                  title: Text(provinsi),
                ),
              );
            }),
      ),
    );
  }
}

class ListKota extends StatefulWidget {
  @override
  _ListKotaState createState() => _ListKotaState();
}

class _ListKotaState extends State<ListKota> {

  List mDaerah = [
    'Bandung',
    'Jakarta',
    'Surabaya',
    'Ambon',
    'Makassar',
    'Medan',
    'Jogjakarta',
    'Bali',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: mDaerah.length,
            itemBuilder: (BuildContext context, int index){
              final provinsi = mDaerah[index].toString();
              return Card(
                child: ListTile(
                  title: Text(provinsi),
                ),
              );
            }),
      ),
    );
  }
}





