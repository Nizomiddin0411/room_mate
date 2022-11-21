import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/total_ads_model.dart';

import '../core/const/consts.dart';

class MonthAdsService {
  Future<List<TotalAdsModel>?> fetchMonth() async {
    try {
      var response = await http.get(Uri.parse(
          '${Const.baseUrl}api/advertising/get-advertising?region_id=1&district_id=1&university_id=1&faculty_id=1&course=1&live_with_owner=1&house_type=1&room_count=0&rent_type=0&subway=1&cost_from=100&cost_to=160000'));
    if(response.statusCode == 200){

      List json = jsonDecode(response.body);
      List<TotalAdsModel> data = json.map((e) => TotalAdsModel.fromJson(e)).toList();
      // var data = TotalAdsModel.fromJson(jsonDecode(response.body));
      print('${data}+++++++++++');
      return data;

    }
    else {
      return jsonDecode(response.body);
    }
    } catch (e) {
      print(e);
    }
  }
}
