import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/const/consts.dart';

class CreateAdsUserServeice {
  Future CreateAds({
    required String? address,
    required String districtId,
    required String roomOwner,
    required String TypeHouse,
    required String CountRoom,
    required String TypeOfRent,
    required String? cost,
    required String typePayment,
    required String subway,
    required String gender,
    required String countRoom,
    required String? title,
    required String? description
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        '${Const.baseUrl}api/advertising/user-add-advertising',
      ),
    );

    request.fields.addAll({
      'district_id': '$districtId',
      'address': '$address',
      'live_with_owner': roomOwner,
      'house_type': TypeHouse,
      'rent_type': TypeOfRent,
      'room_count':CountRoom,
      'cost': '${cost}',
      'cost_type': typePayment,
      'subway': subway,
      'roommate_gender': gender,
      'roommate_count': countRoom,
      'title': '${title}',
      'description': '${description}'
      // 'district_id': '56',
      // 'address': 'forfun',
      // 'live_with_owner': '1',
      // 'house_type': '2',
      // 'rent_type': '1',
      // 'room_count': '4',
      // 'cost': '155000',
      // 'cost_type': '1',
      // 'subway': '1',
      // 'roommate_gender': '1',
      // 'roommate_count': '4',
      // 'title': 'For Students',
      // 'description': 'lllll'
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
