import 'package:flutter/material.dart';

class AkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  new Text('Detail Profile', style: new TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Icon(Icons.person_pin, size: 50.0),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Saldo Saya:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('Rp.0,-', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Nama Lengkap:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('Andhika Dwi Putra Effendy', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Jenis Kelamin:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('Laki-laki', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Alamat:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('Antapani', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Wilayah:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('Kabupaten Bandung', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Kecamatan:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('Cileunyi', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('Jenjang:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('Tinggi bet dah', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                  ),
                  new Text('No Handphone:', style: new TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.start),
                  new Text('082198113362', style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),textAlign: TextAlign.start, softWrap: true,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
