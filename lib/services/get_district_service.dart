import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/core/data/mockdata.dart';



import '../core/const/consts.dart';
import '../models/get_district_model.dart';


class GetDistrictService {
  Future<List<GetDistrictModel>> fetchDistrict( int id) async {
    try {
      var response = await http.get(Uri.parse(
        '${Const.baseUrl}api/region/get-district?region_id=$id',
      ),

      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List <GetDistrictModel> data = json.map((e) => GetDistrictModel.fromJson(e)).toList();
        // var data = TotalAdsModel.fromJson(jsonDecode(response.body));
        print('${data}+++++++++++');
        return data;

      }
      else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
