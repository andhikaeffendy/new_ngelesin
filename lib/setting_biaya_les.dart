import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_ngelesin/api_response_model/get_kategori_response.dart';
import 'api_response_model/biaya_les_response.dart';
import 'global_variable/account_information.dart' as account_info;
import 'global_variable/temp_var.dart' as globTemp;
import 'api_response_model/update_biaya_les_response.dart';


class SettingBiayaLes extends StatefulWidget {
  @override
  _SettingBiayaLesState createState() => _SettingBiayaLesState();
}

class _SettingBiayaLesState extends State<SettingBiayaLes> {
  final biayaController = TextEditingController();
  Datum SelectedKategoriLes;
  Mapel SelectedBidangLes;

  List<Datum> mKatergoriLes;

  List<Mapel> mBidangLes ;


  @override
  Widget build(BuildContext context) {
    List<Datum> listKategori = globTemp.listKategoriMapel.data;
    List<Mapel> listMapel = globTemp.biayaLesResponse.data.mapel;
    mKatergoriLes = listKategori;
    mBidangLes = listMapel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Biaya Les'),
      ),body: Container(
      margin: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DropdownButton<Datum>(
              isExpanded: true,
              hint: new Text("Pilih Kategori Les"),
              value: SelectedKategoriLes,
              onChanged: (Datum newValue) {
                setState(() {
                  SelectedKategoriLes = newValue;
                });
              },
              items: mKatergoriLes.map((Datum user) {
                return new DropdownMenuItem<Datum>(
                  value: user,
                  child: new Text(
                    user.nama,
                    style: new TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),DropdownButton<Mapel>(
              isExpanded: true,
              hint: new Text("Pilih Bidang Les"),
              value: SelectedBidangLes,
              onChanged: (Mapel newValue) {
                setState(() {
                  SelectedBidangLes = newValue;
                });
              },
              items: mBidangLes.map((Mapel user) {
                return new DropdownMenuItem<Mapel>(
                  value: user,
                  child: new Text(
                    user.nama,
                    style: new TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),TextField(
              controller: biayaController,
              decoration: InputDecoration(
                labelText: 'Isi Biaya / 2 jam',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => updateBiayaMapel(SelectedBidangLes.tbGuruMapelId, biayaController.text, context),
                  child: const Text('Simpan'),
                )
              ],
            )
          ],
        ),
      ),
    ),
    );
  }

  Future<UpdateBiayaLesResponse> updateBiayaMapel(int tb_guru_mapel_id, String biaya, context) async{
    String url = account_info.api_url+"/dev/api/web/index.php?r=/guru-mapel/update-mapel";
    Dio dio = new Dio();
    print(account_info.email + account_info.password);
    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              var customHeaders = {
                'email': account_info.email,
                'password': account_info.password,
              };
              options.headers.addAll(customHeaders);
              return options;
            }
        )
    );

    FormData formData = new FormData.fromMap({"tb_guru_mapel_id": tb_guru_mapel_id, "biaya": biaya});
    Response response;

    response = await dio.post(url, data: formData);

    print("Ini Response : " + response.toString());
    print("Ini Response Stat : " + response.statusMessage );

    UpdateBiayaLesResponse updateBiayaLesResponse =
    updateBiayaLesResponseFromJson(response.toString());

    return updateBiayaLesResponse;
  }


}

