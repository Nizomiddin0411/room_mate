
import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/get_all_ads.dart';
import '../provider/search_universitet_provider.dart';


class GetAdsForStudent2 {
  Future fetchuniver(
      // String regionId,
      // String districtId,
      // String univerId,
      // // String course,
      // String houseType,
      // String roomCount,
      // String rentType,
      // String subway,
      // String costFrom,
      // String costTo,

      ) async {
    try {
      String token = Hive.box('token').get('token');
      var response = await http.get(
          Uri.parse(
            // 'http://164.68.114.231:8081/roommate/backend/web/api/advertising/get-advertising?region_id=$regionId&district_id=$districtId&university_id=$univerId&faculty_id=0&course=$course&live_with_owner=0&house_type=$houseType&room_count=$roomCount&rent_type=$rentType&subway=$subway&cost_from=$costFrom&cost_to=$costTo&type=1&roommate_gender=0',
              'http://164.68.114.231:8081/roommate/backend/web/api/advertising/get-advertising?stay_university_id=0&university_id=0&house_type=1&room_count=0&rent_type=1&subway=1&cost_from=100&cost_to=160000&type=0&roommate_gender=0&district_id=10&user_course=2&user_university_id=1&user_faculty_id=1'
          ),
          headers: {
            HttpHeaders.authorizationHeader:
            'Bearer $token'
          });
      if (response.statusCode == 200) {
        List json = jsonDecode(response.body);
        List<AllAdsModel> data =
        json.map((e) => AllAdsModel.fromJson(e)).toList();
        // var data = TotalAdsModel.fromJson(jsonDecode(response.body));
        print('${data}+++++++++++');
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
