import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/get_all_ads.dart';


class GetAllAdsService {
  Future<List<AllAdsModel>> fetchAllADS(
      String regionId,
      String districtId,
      String univerId,
      // String course,
      String houseType,
      String roomCount,
      String rentType,
      String subway,
      String costFrom,
      String costTo,

      ) async {
    try {
      var response = await http.get(
          Uri.parse(
            //http://164.68.114.231:8081/roommate/backend/web/api/advertising/get-advertising?region_id=$regionId&district_id=$districtId&university_id=$univerId&faculty_id=0&course=$course&live_with_owner=0&house_type=$houseType&room_count=$roomCount&rent_type=$rentType&subway=$subway&cost_from=$costFrom&cost_to=$costTo&type=2&roommate_gender=0
            'http://164.68.114.231:8081/roommate/backend/web/api/advertising/get-advertising?stay_university_id=$univerId&university_id=$univerId&house_type=$houseType&room_count=$roomCount&rent_type=$rentType&subway=$subway&cost_from=$costFrom&cost_to=$costTo&type=2&roommate_gender=0&district_id=$districtId',
          ),
          headers: {
            HttpHeaders.authorizationHeader:
                'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
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
