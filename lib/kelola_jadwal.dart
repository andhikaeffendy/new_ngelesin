import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/simpan_jadwal_mengajar_response.dart';
import 'package:new_ngelesin/global_variable/app_dialog.dart';
import 'package:new_ngelesin/list_mapel_guru.dart';

import 'api_response_model/kelola_wilayah_les_guru_reponse.dart';
import 'global_variable/account_information.dart' as account_info;
import 'global_variable/temp_var.dart' as globalTemp;

class KelolaJadwal extends StatefulWidget {
  @override
  _KelolaJadwalState createState() => _KelolaJadwalState();
}

class _KelolaJadwalState extends State<KelolaJadwal> {
  bool _isChecked = false;
  List<String> checkedHari = new List<String>();
  List<String> checkedKodeMapel = new List<String>();
  List<String> checkedJam = new List<String>();
  List<String> checkedLokasi = new List<String>();


  List<checkedList> hariLes = new List<checkedList>();
  List<checkedListWilayah> wilayahLes = new List<checkedListWilayah>();
  List<checkedList> jamLes = new List<checkedList>();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      initHariLes();
      getWilayah();
      initJamLes();

    });
  }


  void initHariLes(){
    hariLes.add(checkedList("Senin", false, "0"));
    hariLes.add(checkedList("Selasa", false, "1"));
    hariLes.add(checkedList("Rabu", false, "2"));
    hariLes.add(checkedList("Kamis", false, "3"));
    hariLes.add(checkedList("Jumat", false, "4"));
    hariLes.add(checkedList("Sabtu", false, "5"));
    hariLes.add(checkedList("Minggu", false, "6"));
  }

  void initJamLes(){
    jamLes.add(checkedList("08:00 - 10:00", false, "0"));
    jamLes.add(checkedList("09:00 - 11:00", false, "1"));
    jamLes.add(checkedList("10:00 - 12:00", false, "2"));
    jamLes.add(checkedList("11:00 - 13:00", false, "3"));
    jamLes.add(checkedList("12:00 - 14:00", false, "4"));
    jamLes.add(checkedList("13:00 - 15:00", false, "5"));
    jamLes.add(checkedList("14:00 - 16:00", false, "6"));
    jamLes.add(checkedList("15:00 - 17:00", false, "7"));
    jamLes.add(checkedList("16:00 - 18:00", false, "8"));
    jamLes.add(checkedList("17:00 - 19:00", false, "9"));
    jamLes.add(checkedList("18:00 - 20:00", false, "10"));
    jamLes.add(checkedList("19:00 - 21:00", false, "11"));
    jamLes.add(checkedList("20:00 - 22:00", false, "12"));
  }

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
              child: ListView.builder(
                  itemCount: hariLes.length,
                  itemBuilder: (BuildContext context, int index){
                    return new Card(
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          children: <Widget>[
                            StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Center(
                                    child: CheckboxListTile(
                                      title: Text(hariLes[index].name),
                                      value: hariLes[index].value,
                                      onChanged: (bool value) {
                                        setState(() {
                                          hariLes[index].value = value;
                                        });
                                      },
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SIMPAN'),
                onPressed: () {
                  print("Hari Les : ");
                  checkedHari.clear();
                  for(checkedList i in hariLes){
                    int j = 0;
                    if(i.value==true){
                      checkedHari.add(i.id);
                      print(checkedHari);
                    }
                    j++;
                  }
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
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
              child: ListView.builder(
                  itemCount: jamLes.length,
                  itemBuilder: (BuildContext context, int index){
                    return new Card(
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          children: <Widget>[
                            StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Center(
                                    child: CheckboxListTile(
                                      title: Text(jamLes[index].name),
                                      value: jamLes[index].value,
                                      onChanged: (bool value) {
                                        setState(() {
                                          jamLes[index].value = value;
                                        });
                                      },
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SIMPAN'),
                onPressed: () {
                  checkedJam.clear();
                  for(checkedList i in jamLes){
                    int j = 0;
                    if(i.value==true){
                      checkedJam.add(i.id);
                    }
                    j++;
                  }
                  print("Checked Jam");
                  print(checkedJam);
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
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
              child: ListView.builder(
                  itemCount: wilayahLes.length,
                  itemBuilder: (BuildContext context, int index){
                    return new Card(
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          children: <Widget>[
                            StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Center(
                                    child: CheckboxListTile(
                                      title: Text(wilayahLes[index].data.kecamatan),
                                      value: wilayahLes[index].value,
                                      onChanged: (bool value) {
                                        setState(() {
                                          wilayahLes[index].value = value;
                                        });
                                      },
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SIMPAN'),
                onPressed: () {
                  checkedLokasi.clear();
                  for(checkedListWilayah i in wilayahLes){
                    int j = 0;
                    if(i.value==true){
                      checkedLokasi.add(i.id);
                    }
                    j++;
                  }
                  print("Checked Lokasi");
                  print(checkedLokasi);
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
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
        ),
        body: Container(
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
                ),
                GestureDetector(
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
                ),
                GestureDetector(
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
                ),
                GestureDetector(
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
            makeRequest().then((task){
              if(task.pesan=="Proses Registrasi Jadwal Berhasil"){
                alerDialogLoginSucces(context, "Simpan Jadwal", task.pesan).then((task){
                  Navigator.of(context).pop();
                });
              }else{
                alerDialogLoginFail(context, "Simpan Jadwal", task.pesan);
              }
            });

          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("SIMPAN JADWAL"),
        ));
  }

  getWilayah() async{
    print("get wilayah jalan");
    String url = account_info.api_url + "?r=v1/home/wilayah&email="+account_info.email;
    var dio = Dio();
    Response response = await dio.get(url);
    print("Wilayah Reponse : " + response.data.toString());
    KelolaWilayahLesGuruResponse kelolaWilayahLesGuruResponse;
    kelolaWilayahLesGuruResponse = kelolaWilayahLesGuruResponseFromJson(response.toString());

    for(Datum i in kelolaWilayahLesGuruResponse.data){
      wilayahLes.add(checkedListWilayah(i, false,i.id.toString()));
    }
    print("Banyak Wilayah = " + wilayahLes.length.toString());
  }

  Future<SimpanJadwalMengajarResponse> makeRequest() async {
    String url = account_info.api_url + "?r=/jadwal2/simpan-jadwal";

    var dio = Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var customHeaders = {
        'content-type': 'application/json',
        'email': account_info.email,
        'password': account_info.password,
      };
      options.headers.addAll(customHeaders);
      return options;
    }));

    FormData formData = new FormData.fromMap({
      "tb_guru_mapel_id": globalTemp.idKelolaMapel.toString(),
      "hari" : ["1","2"],
      "jam" : ["1","2"],
      "area_list" : ["1","2"],
    });

    FormData formData2 = new FormData.fromMap({
      "tb_guru_mapel_id": globalTemp.idKelolaMapel.toString(),
      "hari" : checkedHari,
      "jam" : checkedJam,
      //"jam" : ["1","2","3"],
      "area_list" : checkedLokasi,
    });

    print("formData : ");
    print(globalTemp.idKelolaMapel.toString());
    print(checkedHari);
    print(checkedJam);
    print(checkedLokasi);
    Response response;
    try{
      response = await dio.post(url, data: formData2);
      print("SIMPAN KELOLA JADWAL RESPONSE : " + response.data.toString());
      SimpanJadwalMengajarResponse simpanJadwalMengajarResponse;
      simpanJadwalMengajarResponse =
          simpanJadwalMengajarResponseFromJson(response.toString());
      return simpanJadwalMengajarResponse;
    }catch(e){
      print(e);
      return new SimpanJadwalMengajarResponse(status: false,kode: 0,data: null,post: null,pesan: e.toString());
    }
  }


}

class checkedList {
  checkedList(this.name, this.value, this.id);

  bool value;
  String id;
  final String name;
}

class checkedListWilayah {
  checkedListWilayah(this.data, this.value, this.id);

  Datum data;
  String id;
  bool value;
}
