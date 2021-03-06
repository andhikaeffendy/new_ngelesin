import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/verification_guru.dart';
import 'api_response_model/regis_guru_response.dart';
import 'list_kota.dart';
import 'list_kecamatan.dart';
import 'list_provinsi.dart';
import 'global_variable/temp_var.dart' as globTemp;
import 'global_variable/account_information.dart' as account_info;

class RegisterGuru extends StatefulWidget {
  @override
  _RegisterGuruState createState() => _RegisterGuruState();
}

class _RegisterGuruState extends State<RegisterGuru> {

  String txtProvinsi = '';
  String txtKota = '';
  String txtKecamatan = '';
  final TextEditingController valueProvinsi = TextEditingController();
  final TextEditingController valueKota = TextEditingController();
  final TextEditingController valueKecamatan = TextEditingController();
  final TextEditingController valueNama = TextEditingController();
  final TextEditingController valueEmail = TextEditingController();
  final TextEditingController valueHP = TextEditingController();
  final TextEditingController valuePass = TextEditingController();
  final TextEditingController valueConfirmPass = TextEditingController();
  final TextEditingController valueAlamatLengkap = TextEditingController();
  final TextEditingController valuePendidikanTerakhir = TextEditingController();

  listDropDown selectedJK;
  List<listDropDown> jenisKelamin = <listDropDown>[
    const listDropDown('Pria'),
    const listDropDown('Wanita')
  ];

  @override
  Widget build(BuildContext context) {

    valueProvinsi.text = txtProvinsi;
    valueKota.text = txtKota;
    valueKecamatan.text = txtKecamatan;

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
                controller: valueNama,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextField(
                controller: valueEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextField(
                controller: valueHP,
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
                controller: valueAlamatLengkap,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Alamat Lengkap"),
              ),TextField(
                controller: valuePendidikanTerakhir,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Pendidikan Terakhir"),
              ),
              TextField(
                controller: valuePass,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              TextField(
                controller: valueConfirmPass,
                obscureText: true,
                decoration: InputDecoration(labelText: "Ulangi Password"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {
          return FutureBuilder(
            future: registerGuruRequest().then((task){
              if(task.code=="200"){
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Verification()));
              }
            }),
            builder: (context, snapshot){
              if(snapshot.data == null){
                print("Ini Status Snapshot : " + snapshot.toString());
                return Container();
              }else{
                RegisGuruResponse response = snapshot.data;
                print("Ini Status Registrasi : " + response.status);
                print("Ini Message Registrasi : " + response.message);
                return null;
              }
            },
          );
        },
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

  Future<RegisGuruResponse> registerGuruRequest() async {
    String url =
        account_info.api_url+"?r=v1/guru/registrasi";
    Dio dio = new Dio();
    Response response;

    FormData formData =
    new FormData.fromMap({
      "email": valueEmail.text,
      "password": valuePass.text,
      "confirm_password" : valueConfirmPass.text,
      "nama_lengkap" : valueNama.text,
      "hp" : valueHP.text,
      "master_provinsi_id" : globTemp.provId,
      "master_kota_id" : globTemp.kotaId,
      "master_kecamatan_id" : globTemp.kecId,
      //masih static
      "pengalaman_organisasi" : "",
      "alamat_lengkap" : valueAlamatLengkap.text,
      //masih static
      "jenis_kelamin" : 1,
      //masih static
      "pendidikan_terakhir" : 1,
    });


    response = await dio.post(url, data: formData );
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    RegisGuruResponse regisGuruResponse =
    regisGuruResponseFromJson(response.toString());

    return regisGuruResponse;
  }

}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}





