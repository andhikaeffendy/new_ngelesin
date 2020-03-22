import 'package:flutter/material.dart';

class SettingBiayaLes extends StatefulWidget {
  @override
  _SettingBiayaLesState createState() => _SettingBiayaLesState();
}

class _SettingBiayaLesState extends State<SettingBiayaLes> {

  listDropDown SelectedKategoriLes;
  listDropDown SelectedBidangLes;

  List<listDropDown> mKatergoriLes = <listDropDown>[
    const listDropDown('Akademik'),
    const listDropDown('Bahasa'),
    const listDropDown('Olahraga'),
    const listDropDown('Keterampilan'),
    const listDropDown('Anak anak'),
    const listDropDown('Musik'),
    const listDropDown('Lainnya'),
    const listDropDown('Tanya Soal'),
    const listDropDown('Help Center'),
  ];

  List<listDropDown> mBidangLes = <listDropDown>[
    const listDropDown('Matematika SD'),
    const listDropDown('Matematika SMP'),
    const listDropDown('Matematika SMA'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Biaya Les'),
      ),body: Container(
      margin: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DropdownButton<listDropDown>(
              isExpanded: true,
              hint: new Text("Pilih Kategori Les"),
              value: SelectedKategoriLes,
              onChanged: (listDropDown newValue) {
                setState(() {
                  SelectedKategoriLes = newValue;
                });
              },
              items: mKatergoriLes.map((listDropDown user) {
                return new DropdownMenuItem<listDropDown>(
                  value: user,
                  child: new Text(
                    user.name,
                    style: new TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),DropdownButton<listDropDown>(
              isExpanded: true,
              hint: new Text("Pilih Bidang Les"),
              value: SelectedBidangLes,
              onChanged: (listDropDown newValue) {
                setState(() {
                  SelectedBidangLes = newValue;
                });
              },
              items: mBidangLes.map((listDropDown user) {
                return new DropdownMenuItem<listDropDown>(
                  value: user,
                  child: new Text(
                    user.name,
                    style: new TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),TextField(
              decoration: InputDecoration(
                labelText: 'Isi Biaya / 2 jam',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){},
                  child: const Text('Simpan'),
                )
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}