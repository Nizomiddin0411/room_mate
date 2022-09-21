import 'dart:io';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;



import '../models/get_district_model.dart';
import '../models/get_my_ads_model.dart';


class GetMyAdsService {
  Future<List<GetMyAdsModel>?> fetchADS() async {
    try {
      var response = await http.get(Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/advertising/get-my-advertising',

      ),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'
      }

      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List <GetMyAdsModel> data = json.map((e) => GetMyAdsModel.fromJson(e)).toList();
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
