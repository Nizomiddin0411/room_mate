import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/const/consts.dart';
import '../models/get_all_ads.dart';


class GetAllAdsUser {
  Future<List<AllAdsModel>?> fetchAllADSUser() async {
    try {
      var response = await http.get(
          Uri.parse(
            '${Const.baseUrl}api/advertising/get-advertising?region_id=1&district_id=1&university_id=1&faculty_id=1&course=1&live_with_owner=1&house_type=1&room_count=0&rent_type=1&subway=1&cost_from=100&cost_to=160000&type=0&roommate_gender=0',
          ),
          // headers: {
          //   HttpHeaders.authorizationHeader:
          //   'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
          // }
          );
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
    }
  }
}
