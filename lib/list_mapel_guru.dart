import 'package:flutter/material.dart';
import 'api_response_model/biaya_les_response.dart';
import 'global_variable/temp_var.dart' as globTemp;


class ListMapelGuru extends StatefulWidget {
  @override
  _ListMapelGuruState createState() => _ListMapelGuruState();
}

class _ListMapelGuruState extends State<ListMapelGuru>{

  //final List<String> listMapel = <String>['Matematika','IPA','IPS'];
  List<Mapel> mBidangLes ;

  @override
  Widget build(BuildContext context) {
    List<Mapel> listMapel = globTemp.biayaLesResponse.data.mapel;
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
            title: Text(listMapel[index].nama),
            onTap: () {
              globTemp.idKelolaMapel = listMapel[index].tbGuruMapelId;
              Navigator.pop(context);
              print("globtemp baru = " + globTemp.idKelolaMapel.toString());
            },
          ),
        );
      },
    )
    );
  }
}
