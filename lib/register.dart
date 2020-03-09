import 'package:flutter/material.dart';
import 'package:new_ngelesin/register_guru.dart';
import 'package:new_ngelesin/register_murid.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Sebagai"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 12.0,
              ),
              GestureDetector(
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new RegisterGuru())),
                child: Container(
                  color: Colors.white24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: NetworkImage('https://cdn0.iconfinder.com/data/icons/people-occupations-icons-rounded/110/Teacher-512.png'),
                        width: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 180.0, 0),
                        child: Text('Daftar Guru'),
                      ),
                      IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          alignment: Alignment.centerRight,
                          tooltip: 'Pilih Tanggal')
                    ],
                  ),
                ),
              ),SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new RegisterMurid())),
                child: Container(
                  color: Colors.white24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: NetworkImage('https://www.freeiconspng.com/uploads/school-student-icon-18.png'),
                        width: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 180.0, 0),
                        child: Text('Daftar Murid'),
                      ),
                      IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          alignment: Alignment.centerRight,
                          tooltip: 'Pilih Tanggal')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}