import 'package:flutter/material.dart';

class PendapatanLes extends StatefulWidget {
  @override
  _PendapatanLesState createState() => _PendapatanLesState();
}

class _PendapatanLesState extends State<PendapatanLes> {

  final List<String> kode = <String> ['M14296','2]JFK98','MPOD3','EIRKD4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendapatan Les'),
      ),
      body: ListView.builder(
          itemCount: kode.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
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
                          child: Text(kode[index], style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('13-Okt-2018'),
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
                          child: Text('Tono', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: 150.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('082198113362'),
                        )
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          child: Text(
                            'Saldo',style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 120.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Rp. 100.000', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        bottomNavigationBar: Container(
          height: 35.0,
          padding: const EdgeInsets.only(right: 12.0),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('Total Rp. 80.000',style: TextStyle(color: Colors.white),),
            ],
          )
        )
    );
  }

}


//jika datanya kosong, pakai yang ini

//Container(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: <Widget>[
//Icon(
//Icons.unarchive,
//size: 80.0,
//),
//Padding(
//padding: EdgeInsets.all(12.0),
//),
//Text(
//"Oops No Data",
//style: new TextStyle(
//fontWeight: FontWeight.w300,
//color: Colors.blueGrey,
//fontSize: 16.0),
//textAlign: TextAlign.center,
//),
//],
//),
//),