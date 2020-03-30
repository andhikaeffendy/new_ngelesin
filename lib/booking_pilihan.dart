import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_ngelesin/api_response_model/list_guru_response.dart';
import 'package:new_ngelesin/api_response_model/list_jam_mapel_response.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'global_variable/account_information.dart' as account_info;

class BookingPilihan extends StatefulWidget {
  final Guru guru;
  final String mapel_name;

  BookingPilihan({Key key, @required this.guru, @required this.mapel_name}) : super(key: key);

  @override
  _BookingPilihanState createState() => _BookingPilihanState(guru: this.guru, mapel_name: this.mapel_name);
}

class _BookingPilihanState extends State<BookingPilihan> {
  final Guru guru;
  final String mapel_name;

  int selectedMurid;
  int selectedPembayaran;

  TimeOfDay time;
  DateTime selectedDate;

  List<JamMapel> jamMapels = new List();
  JamMapel selectedJadwal;

  _BookingPilihanState({@required this.guru, @required this.mapel_name}) : super();

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay t =
        await showTimePicker(context: context, initialTime: time);
    if (time != null) {
      setState(() {
        time = t;
      });
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    var initial = selectedDate != null ? selectedDate : DateTime.now().add(new Duration(days: 1));

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initial,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedJadwal = null;
      });
      pilJamMapel().then((task) {
        if (task.status == "success") {
          setState(() {
            jamMapels = task.data;
          });
        }
      });
    }
  }

  Future<ListJamMapelResponse> pilJamMapel() async {
    String url =
        "http://apingelesin.com/app/api/web/index.php?r=v1/booking2/jam-mapel2";
    Dio dio = new Dio();
    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              var customHeaders = {
                'content-type': 'application/json',
                'email': account_info.email,
                'password': account_info.password,
              };
              options.headers.addAll(customHeaders);
              return options;
            }
        )
    );
    Response response;

    var hari = selectedDate.weekday;
    var tgl = new DateFormat("yyyy-MM-dd").format(selectedDate);

    response = await dio.get(url, queryParameters: {
      "hari": hari,
      "tb_guru_id": guru.tb_guru_id,
      "tb_guru_mapel_id": guru.tb_guru_mapel_id,
      "tgl": tgl,
    });
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    ListJamMapelResponse listJamMapelResponse =
    listJamMapelResponseFromJson(response.toString());

    return listJamMapelResponse;
  }

  setSelectedMurid(int val) {
    setState(() {
      selectedMurid = val;
    });
  }

  setSelectedPembayaran(int val) {
    setState(() {
      selectedPembayaran = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = TimeOfDay.now();
    selectedMurid = 0;
    selectedPembayaran = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Image(
                    image: NetworkImage(
                        guru.foto_profil),
                    width: 100.0,
                    height: 150.0,
                  ),
                  new Container(
                    padding: const EdgeInsets.all(20.0),
                    child: new Center(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            guru.nama_guru,
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.black),
                          ),
                          new Row(
                            children: <Widget>[
                              SmoothStarRating(
                                allowHalfRating: false,
                                starCount: 5,
                                rating: guru.rating_guru.toDouble(),
                                size: 20.0,
                                color: Colors.yellow,
                                borderColor: Colors.yellow,
                                spacing: 0.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                              ),
                              new Text(guru.suara.toString()  +' Suara')
                            ],
                          ),
                          new Wrap(
                            children: <Widget>[
                              new Container(
                                width: 180.0,
                                child: new Text(
                                  guru.pendidikan_terakhir,
                                  style: new TextStyle(
                                      color: Colors.black, fontSize: 12.0),
                                  textAlign: TextAlign.start,
                                ),
                              )
                            ],
                          ),
                          new Text(mapel_name,
                              style: new TextStyle(
                                  fontSize: 16.0, color: Colors.red))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('Pilih tanggal : '),
                  Text(selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : ""),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    alignment: Alignment.centerRight,
                    tooltip: 'Pilih Tanggal',
                    onPressed: () => _selectDate(context),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Jam : "),
                  Text(selectedJadwal != null ? selectedJadwal.jadwal() : ""),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      showJadwal(context);
                    },
                  )
                ],
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Lokasi'),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: Text('Jumlah Murid'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: selectedMurid,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedMurid(val);
                        },
                      ),
                      Text('1 Orang'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        value: 2,
                        groupValue: selectedMurid,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedMurid(val);
                        },
                      ),
                      Text('2 Orang'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        value: 3,
                        groupValue: selectedMurid,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedMurid(val);
                        },
                      ),
                      Text('3 Orang'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        value: 4,
                        groupValue: selectedMurid,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedMurid(val);
                        },
                      ),
                      Text('4 Orang'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: Text('Pembayaran'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                  ),
                  ImageIcon(
                    AssetImage("assets/Bahasa.png"),
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  new Container(
                      width: 250.0,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Gunakan/Masukkan kode',
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: selectedPembayaran,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedMurid(val);
                        },
                      ),
                      Text('Saldo saya : Rp. 0'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 2,
                        groupValue: selectedPembayaran,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedMurid(val);
                        },
                      ),
                      Text('Tunai'),
                    ],
                  )
                ],
              )
            ],
          ),
        )),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: _showAlertDialog,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text('BOOKING SEKARANG'),
      ),
    );
  }

  //alertDialog untuk detail booking
  void _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Detail Booking'),
            content: Container(
              width: 330.0,
              height: 310.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    height: 1.0,
                    width: 350.0,
                    color: Colors.black,
                  ),
                ),SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Text(
                      'Tanggal :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('31-Mar-2020',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Mapel / Bidang :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('Matematika SD',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Nama Guru :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('Riska yunitasari',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Jumlah Murid :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text('1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Total Biaya',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Rp. 75.000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                      height: 1.0,
                      width: 350.0,
                      color: Colors.black,
                    ),
                  ),SizedBox(
                    height: 34.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text('BATAL',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text('PROSES',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  void showJadwal(BuildContext context){
    List<Widget> result = new List();
    for(int i=0; i< jamMapels.length; i++) {
      JamMapel jamMapel = jamMapels[i];
      result.add(new SimpleDialogOption(
        child: new Card(
          child: ListTile(
            title: Text(jamMapel.jadwal()),
            subtitle: Text(
                jamMapel.status_jam, style: TextStyle(color: Colors.red)),
            onTap: () {
              if (jamMapel.status_jam == "")
                setState(() {
                  selectedJadwal = jamMapel;
                });
              Navigator.of(context).pop();
            },
          ),
        ),
      )
      );
    }

    SimpleDialog dialog = new SimpleDialog(
      title: Text('Pilih Jam : '),
      children: result,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void paint(Canvas canvas, Size size) {
    final p1 = Offset(50, 50);
    final p2 = Offset(250, 150);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null) {
      setState(() {
        time = t;
      });
    }
  }
}
