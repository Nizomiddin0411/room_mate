import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/total_ads_model.dart';

import '../models/days_apartment.dart';

class DaysAdsService {
  Future<List<DaysKvModel>?> fetchDays() async {
    try {
      var response = await http.get(Uri.parse(
          'http://164.68.114.231:8081/roommate/backend/web/api/advertising/get-advertising?region_id=1&district_id=1&university_id=1&faculty_id=1&course=1&live_with_owner=1&house_type=1&room_count=0&rent_type=1&subway=1&cost_from=100&cost_to=160000'));
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List<DaysKvModel> data = json.map((e) => DaysKvModel.fromJson(e)).toList();
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
