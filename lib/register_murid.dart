import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:new_ngelesin/list_kecamatan.dart';
import 'package:new_ngelesin/list_kota.dart';
import 'package:new_ngelesin/list_provinsi.dart';
import 'package:new_ngelesin/verification.dart';

class RegisterMurid extends StatefulWidget {
  @override
  _RegisterMuridState createState() => _RegisterMuridState();
}

class _RegisterMuridState extends State<RegisterMurid> {
  String txtProvinsi = '';
  String txtKota = '';
  String txtKecamatan = '';
  final TextEditingController valueProvinsi = TextEditingController();
  final TextEditingController valueKota = TextEditingController();
  final TextEditingController valueKecamatan = TextEditingController();

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
    valueProvinsi.text = txtProvinsi;
    valueKota.text = txtKota;
    valueKecamatan.text = txtKecamatan;

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
                hint: new Text("Jenjang Pendidikan"),
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
                controller: valueProvinsi,
                enableInteractiveSelection: true,
                readOnly: true,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _navigateAndDisplaySelection(context, () => listProvinsi());
                },
                decoration: InputDecoration(
                  labelText: 'Provinsi',
                ),
              ),
              TextField(
                controller: valueKota,
                enableInteractiveSelection: true,
                readOnly: true,
                enabled: valueProvinsi.text.isEmpty ? false : true,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  valueProvinsi.text.isEmpty
                      ? showAlert("Pilih Provinsi Terlebih dahulu", context)
                      : _navigateAndDisplaySelection(context, () => ListKota());
                },
                decoration: InputDecoration(
                  labelText: 'Kota',
                ),
              ),
              TextField(
                controller: valueKecamatan,
                enableInteractiveSelection: true,
                readOnly: true,
                enabled: valueKota.text.isEmpty ? false : true,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setState(() {
                    valueKota.text.isEmpty
                        ? showAlert("Pilih Kota Terlebih dahulu", context)
                        : _navigateAndDisplaySelection(
                            context, () => ListKecamatan());
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Kecamatan',
                ),
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

  void _navigateAndDisplaySelection(
      BuildContext context, Widget Function() page) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page()),
    );

    print(page().toString() + " ANJENG");
    setState(() {
      if (page().toString() == "listProvinsi") {
        txtProvinsi = result;
      } else if (page().toString() == "ListKota") {
        print("TRUE");
        txtKota = result;
      } else if (page().toString() == "ListKecamatan") {
        txtKecamatan = result;
      }
    });
  }

  Future<void> showAlert(String message, BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Oops!! Something Wrong!!"),
            content: Text(message),
            actions: [
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}
