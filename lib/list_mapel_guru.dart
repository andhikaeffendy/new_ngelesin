import 'package:flutter/material.dart';

class ListMapelGuru extends StatefulWidget {
  @override
  _ListMapelGuruState createState() => _ListMapelGuruState();
}

class _ListMapelGuruState extends State<ListMapelGuru>{

  final List<String> listMapel = <String>['Matematika','IPA','IPS'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Mapel Guru'),
      ),body: ListView.builder(
      itemCount: listMapel.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: ListTile(
            leading: Icon(Icons.location_on),
            dense: true,
            title: Text(listMapel[index]),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    )
    );
  }
}
