import 'package:flutter/material.dart';
import 'package:new_ngelesin/list_mapel_guru.dart';

class KelolaJadwal extends StatefulWidget {
  @override
  _KelolaJadwalState createState() => _KelolaJadwalState();
}

class _KelolaJadwalState extends State<KelolaJadwal> {

  bool _isChecked = true;


  //Alert Dialog Pilih Hari
  _PilHari(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Pilih Hari'),
            content: Container(
              height: 380.0,
              width: 300.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                      title: Text("Senin"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Selasa"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Rabu"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Kamis"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Jumat"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Sabtu"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Minggu"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SIMPAN'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),new FlatButton(
                child: new Text('BATAL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  //Alert Dialog Jam Les

  _PilJamLes(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Pilih Jam'),
            content: Container(
              height: 380.0,
              width: 300.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                      title: Text("08:00 - 10:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("09:00 - 11:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("10:00 - 12:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("11:00 - 13:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("12:00 - 14:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("13:00 - 15:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("14:00 - 16:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("15:00 - 17:00"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SIMPAN'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),new FlatButton(
                child: new Text('BATAL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  //Alert Dialog Pilih Area

  _PilAreaLokasi(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Pilih Area Mengajar'),
            content: Container(
              height: 380.0,
              width: 300.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                      title: Text("Arjasari"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Baleendah"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Banjaran"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Bojongsoang"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Cangkuang (kabupaten Bandung"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Sabtu"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),CheckboxListTile(
                      title: Text("Minggu"),
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SIMPAN'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),new FlatButton(
                child: new Text('BATAL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Jadwal'),
      ),body: Container(
      margin: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ListMapelGuru())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Mata Pelajaran Bidang",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                  ),
                ],
              ),
            ),GestureDetector(
              onTap: () => _PilHari(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Atur Hari",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                  ),
                ],
              ),
            ),GestureDetector(
              onTap: () => _PilJamLes(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Atur Jam Les",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                  ),
                ],
              ),
            ),GestureDetector(
              onTap: () => _PilAreaLokasi(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Atur Area Lokasi Les",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    tooltip: 'Pilih Tanggal',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
        bottomNavigationBar: RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("SIMPAN JADWAL"),
        )
    );
  }
}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}
