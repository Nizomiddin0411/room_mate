import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/search_universitety_model.dart';

class GetSearchUniverServiceFiltr {
  Future<List<SearchUniversitetyModel>> fetchUniverSearch1(  String query,{
    required String region,
    required String district,
  }) async {
    try {
      var _response = await http.get(
        Uri.parse(
            'http://164.68.114.231:8081/roommate/backend/web/api/university/index?term=$query&region_id=22&district_id=198'),
      );
      if (_response.statusCode == 200) {
        List json = jsonDecode(_response.body);
        List<SearchUniversitetyModel> data =
            json.map((e) => SearchUniversitetyModel.fromJson(e)).toList();
        return data;
      } else {
        return jsonDecode(_response.body);
      }
    } catch (e) {
      print('${e}');
      return [];
    }
  }
}
