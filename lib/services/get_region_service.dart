import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/get_region_model.dart';


import '../core/const/consts.dart';
import '../models/get_univer_model.dart';

class GetRegionService {
  Future<List<GetRegionModel>> fetchRegion() async {
    try {
      var response = await http.get(Uri.parse(
        '${Const.baseUrl}api/region',
      ),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
          }
      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List <GetRegionModel> data = json.map((e) => GetRegionModel.fromJson(e)).toList();
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
