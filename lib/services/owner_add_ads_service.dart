import 'dart:_http';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

import '../core/const/consts.dart';

class RegistrationService {
  Future Registor({
    required String title,
    required String roommate_gender,
    required String gender_matter,
    required String district_id,
    required String address,
    required String subway,
    required String university_id,
    required String university_id_matter,
    required String phone_number,
    required String house_type,
    required String rent_type,
    required String room_count,
    required String floors_count,
    required String in_floor,
    required String cost,
    required String cost_type,
    required String live_with_owner,
    required String utility_electricity,
    required String unility_gaz,
    required String utility_hot_water,
    required String utility_cold_water,
    required String utility_trash,
    required String comfort,
    required String description
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
          '${Const.baseUrl}api/advertising/user-add-advertising'),
    );
    request.fields.addAll({
      'title': title,
      'roommate_gender': roommate_gender,
      'gender_matter': gender_matter,
      'district_id': district_id,
      'address': address,
      'subway': subway,
      'university_id': university_id,
      'university_id_matter': university_id_matter,
      'phone_number': phone_number,
      'house_type': house_type,
      'rent_type': rent_type,
      'room_count': room_count,
      'floors_count': floors_count,
      'in_floor': in_floor,
      'cost': cost,
      'cost_type': cost_type,
      'live_with_owner': live_with_owner,
      'utility_electricity': utility_electricity,
      'unility_gaz': unility_gaz,
      'utility_hot_water': utility_hot_water,
      'utility_cold_water': utility_cold_water,
      'utility_trash': utility_trash,
      'comfort': comfort,
      'description': description,
    });
    String token = Hive.box('token').get('token');
    request.headers.addAll({
       HttpHeaders.authorizationHeader: 'Bearer $token'
    });
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    }
  }
}
