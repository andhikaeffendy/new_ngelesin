import 'package:flutter/material.dart';

class BiayaLes extends StatefulWidget {
  @override
  _BiayaLesState createState() => _BiayaLesState();
}

class _BiayaLesState extends State<BiayaLes> {

  final List<String> listMapel = <String>['Matematika','IPA','IPS'];
  final List<String> listHarga = <String>['Rp. 500000', 'Rp. 123123', 'Rp. 21312'];

  //Alert Dialog Harga
  _EditHarga(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Mapel'),
            content: Container(
              width: 400.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Isi Biaya / 2 jam',
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('BATAL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),new FlatButton(
                child: new Text('SIMPAN'),
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
        title: Text('Biaya Les'),
      ),body: ListView.builder(
      itemCount: listMapel.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: ListTile(
            leading: Text(listMapel[index]),
            dense: true,
            trailing: Text(listHarga[index]),
            onTap: () => _EditHarga(context),
          ),
        );
      },
    ),
    );
  }
}
