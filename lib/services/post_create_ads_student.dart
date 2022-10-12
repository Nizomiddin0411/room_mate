import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CreateAdsStudent {
  Future CreateAds({
    required String districtId,
    required String UniderId,
    required String fakultetId,
    required String Course,
    //live
    required String roomOwner,
    required String TypeHouse,
    required String TypeOfRent,
    required String? cost,
    required String typePayment,
    required String subway,
    required String gender,
    required String CountRoom,
    required String? title,
    required String? description
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/advertising/student-add-advertising',
      ),
    );

    request.fields.addAll({
      'district_id': '${districtId}',
      'university_id': UniderId,
      'faculty_id': fakultetId,
      'course': Course,
      'live_with_owner': roomOwner,
      'house_type': TypeHouse,
      'rent_type': TypeOfRent,
      'cost': '${cost}',
      'cost_type': typePayment,
      'subway': subway,
      'roommate_gender': gender,
      'roommate_count': CountRoom,
      'title': '${title}',
      'description': '${description}'
    });
    // request.fields['district_id']='1';
    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      print("okokokkok");
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);

      return jsonDecode(data);
    }
  }
}
