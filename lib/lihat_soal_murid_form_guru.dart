import 'package:flutter/material.dart';
class LihatSoalMuridFormGuru extends StatefulWidget {
  @override
  _LihatSoalMuridFormGuruState createState() => _LihatSoalMuridFormGuruState();
}

class _LihatSoalMuridFormGuruState extends State<LihatSoalMuridFormGuru> {

  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soal Murid'),
      ),body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: _showAlertDialog,
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
                          width: 250.0,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('eysd', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: 250.0,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('FERA NANDA ACHIR SAPUTRI'),
                        )
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          child: Text(
                              '04-Okt-2018'
                          ),
                        ),
                        Container(
                          width: 120.0,
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Rp. 20.000', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
    );
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 330.0,
              height: 350.0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 200,
                            minHeight: 200,
                            maxWidth: 200,
                            maxHeight: 200,
                          ),
                          child: Image.network(
                            'https://1.bp.blogspot.com/-HWkGNHZImAI/Xkvwo-IcyTI/AAAAAAAACQM/4gzZQeZpdeUMuUU89xCQlK1KHnDqhXeOACLcBGAsYHQ/s1600/gambar%2Bkartun%2Bkeren%2Babis%2B3d.jpg',
                          )
                      ),
                    ),Text(
                        'Nama Guru : '
                    ),Text(
                      'Tedi Guru',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),SizedBox(
                      height: 16.0,
                    ),Text(
                        'No Handphone: '
                    ),Text(
                      '082198113362', style: TextStyle(fontWeight: FontWeight.bold),
                    ),SizedBox(
                      height: 16.0,
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 100.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('AMBIL', style: TextStyle(color: Colors.white),),
                            color: Colors.blue,),
                        ),ButtonTheme(
                          minWidth: 100.0,
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('TUTUP', style: TextStyle(color: Colors.white),),
                            color: Colors.blue,),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
