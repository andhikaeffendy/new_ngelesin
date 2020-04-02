import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/global_response.dart';
import 'package:new_ngelesin/api_response_model/list_booking_response.dart';
import 'package:intl/intl.dart';
import 'global_variable/account_information.dart' as account_info;

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final formatDate = new DateFormat("dd-MMM-yyyy");
  final currency = new NumberFormat("###,###,###.#");
  List<Booking> bookingList = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getBookings(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            ListBookingResponse listBookingResponse = snapshot.data;
            bookingList = listBookingResponse.data;
            return listBooking();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _showAlertDialog(Booking booking) async {
    int pilihan = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 330.0,
              height: booking.status_kelas=="1" || account_info.role=="guru" ? 520.0 : 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        account_info.role == "murid" ? booking.foto_guru : booking.foto_siswa,
                        fit: BoxFit.contain,
                        height: 100.0,
                        width: 100.0,
                      )
                    ],
                  ),SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'No Order',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(booking.kode_kelas),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Pembayaran',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(booking.metode_pembayaran == "1" ? "Saldo" : "Tunai" ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Mapel / Bidang',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(booking.mapel),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Jumlah Murid',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(booking.jumlah_siswa),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Tanggal Dan Waktu',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(formatDate.format(booking.tgl) + ' '+ booking.jam_mulai +' - '+ booking.jam_selesai),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Nama '+ account_info.role == "murid" ? "Guru" : "Siswa" ,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(account_info.role == "murid" ? booking.guru : booking.siswa),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Nomor Handphone',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(account_info.role == "murid" ? booking.hp_guru : booking.hp_siswa ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Lokasi: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(booking.alamat, maxLines: 1,),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: Text(
                      'Biaya:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Rp. '+ currency.format(int.parse(booking.biaya)),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: bookingActions(context, booking),
                  )
                ],
              ),
            ),
          );
        });

    //CHECK hasil dari pilihan 5:batal oleh siswa, 4:batal oleh guru, 3:selesai, 1:terima, 0:tutup, 10:chat
    if(pilihan > 0 && pilihan < 6)
      updateKelasRequest(booking.id, pilihan).then((task){
        if (task.status == "success") {
          getBookings().then((task){
            ListBookingResponse listBookingResponse = task;
            bookingList = listBookingResponse.data;
          });
        }
      });
  }

  List<Widget> bookingActions(BuildContext context, Booking booking){
    List<Widget> actions = new List();
    actions.add(new ButtonTheme(
      minWidth: 130.0,
      child: RaisedButton(
        onPressed: () => Navigator.of(context).pop(account_info.role=="murid" ? 5 : 4),
        child: Text('BATALKAN', style: TextStyle(color: Colors.white),),
        color: Colors.blue,),
    ));

    if(booking.status_kelas=="1") {
      actions.add(new ButtonTheme(
        minWidth: 130.0,
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(3),
          child: Text('SELESAI', style: TextStyle(color: Colors.white),),
          color: Colors.blue,),
      ));
      actions.add(new ButtonTheme(
        minWidth: 130.0,
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(10),
          child: Text('CHAT', style: TextStyle(color: Colors.white),),
          color: Colors.blue,),
      ));
    }

    if(booking.status_kelas=="2" && account_info.role == "guru")
      actions.add(new ButtonTheme(
        minWidth: 130.0,
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(1),
          child: Text('TERIMA', style: TextStyle(color: Colors.white),),
          color: Colors.blue,),
      ));

    actions.add(new ButtonTheme(
      minWidth: 130.0,
      child: RaisedButton(
        onPressed: () => Navigator.of(context).pop(0),
        child: Text('TUTUP',style: TextStyle(color: Colors.white),),
        color: Colors.blue,),
    ));

    List<Widget> row1 = new List();
    row1.add(actions[0]);
    row1.add(actions[1]);

    List<Widget> row2 = new List();
    if(actions.length>2)
      row2.add(actions[2]);
    if(actions.length>3)
      row2.add(actions[3]);

    List<Widget> result = new List();
    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: row1,
    ));

    if(actions.length>2)
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: row2,
      ));

    return result;
  }

  Widget listBooking(){
    if(bookingList.length == 0)
      return emptyBooking();
    return ListView.builder(
        itemCount: bookingList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _showAlertDialog(bookingList[index]),
            child: Container(
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            bookingList[index].kode_kelas,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(formatDate.format(bookingList[index].tgl)),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150.0,
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            bookingList[index].mapel + bookingList[index].tingkatan,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 150.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(account_info.role=="murid" ? bookingList[index].guru : bookingList[index].siswa),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          child: Text(
                            bookingList[index].status_kelas == "1" ? "Proses" : "Pending" ,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Rp. '+ currency.format(int.parse(bookingList[index].biaya)),
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget emptyBooking(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.unarchive,
            size: 80.0,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Text(
            "Oops No Data",
            style: new TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.blueGrey,
                fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<ListBookingResponse> getBookings() async {
    String url = account_info.role == "murid" ?
        account_info.api_url+"?r=v1/siswa/history-kelas" :
        account_info.api_url+"?r=v1/guru/history-order";
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

    response = await dio.get(url);
    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    ListBookingResponse listBookingResponse =
    listBookingResponseFromJson(response.toString());

    return listBookingResponse;
  }

  Future<GlobalResponse> updateKelasRequest(String id, int status) async {
    String url = account_info.role == "murid" ?
      account_info.api_url+"?r=v1/siswa/update-kelas" :
      account_info.api_url+"?r=guru/update-kelas" ;
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
    FormData formData = account_info.role == "murid" ?
      new FormData.fromMap({"id": id, "status_kelas": status}) :
      new FormData.fromMap({"id": id, "status_kelas": status, "tb_guru_id": account_info.loginGuruResponse.data.id});

    response = await dio.post(url, data: formData);
    print(response.toString());

    GlobalResponse globalResponse =
    globalResponseFromJson(response.toString());

    return globalResponse;
  }
}

