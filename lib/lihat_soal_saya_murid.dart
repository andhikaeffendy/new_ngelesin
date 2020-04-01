import 'package:flutter/material.dart';

class LihatSoalSaya extends StatefulWidget {
  @override
  _LihatSoalSayaState createState() => _LihatSoalSayaState();
}

class _LihatSoalSayaState extends State<LihatSoalSaya> {
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lihat Soal Saya'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: GestureDetector(
                    onTap: _showAlertDialog,
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
                  ),),
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
                    ),SizedBox(
                      height: 16.0,
                    ),Text(
                        'Status'
                    ),Text(
                      'Selesai', style: TextStyle(fontWeight: FontWeight.bold),
                    ),ButtonTheme(
                      minWidth: 300.0,
                      child: RaisedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('TUTUP', style: TextStyle(color: Colors.white),),
                        color: Colors.blue,),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
