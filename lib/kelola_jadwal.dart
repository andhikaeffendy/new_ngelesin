import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/simpan_jadwal_mengajar_response.dart';
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
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Center(
                        child: CheckboxListTile(
                          title: const Text('Senin'),
                          value: _isChecked,
                          onChanged: (bool value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                      );
                    }),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Selasa'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Rabu'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Kamis'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Jumat'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Sabtu'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Minggu'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('10:00 - 12:00'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('10:00 - 12:00'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('10:00 - 12:00'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('10:00 - 12:00'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('10:00 - 12:00'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('10:00 - 12:00'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        })
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Balendah'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Balendah'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Balendah'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Center(
                            child: CheckboxListTile(
                              title: const Text('Balendah'),
                              value: _isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          );
                        }),
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
            Navigator.of(context).pop();
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("SIMPAN JADWAL"),
        ));
  }

  Future<KelolaWilayahLesGuruResponse> getWilayah() async{
    String url = account_info.api_url + "?r=v1/home/wilayah&email="+account_info.email;
    var dio = Dio();
    Response response = await dio.get(url);
    print("Wilayah Reponse : " + response.data.toString());
    KelolaWilayahLesGuruResponse kelolaWilayahLesGuruResponse;
    kelolaWilayahLesGuruResponse = kelolaWilayahLesGuruResponseFromJson(response.toString());

    return kelolaWilayahLesGuruResponse;
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
      "tb_guru_mapel_id": "",
      "hari[0]": "",
      "hari[1]": "",
      "jam[0]": "",
      "jam[1]": "",
      "area_list[0]]": "",
      "area_list[1]": "",
      "area_list[2]": "",
    });

    Response response = await dio.post(url, data: formData);
    print("SIMPAN KELOLA JADWAL RESPONSE : " + response.data.toString());
    SimpanJadwalMengajarResponse simpanJadwalMengajarResponse;
    simpanJadwalMengajarResponse =
        simpanJadwalMengajarResponseFromJson(response.toString());

    return simpanJadwalMengajarResponse;
  }


}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}
