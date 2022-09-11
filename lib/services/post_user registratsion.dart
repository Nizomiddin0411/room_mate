import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:talaba_uy/services/post_create_ads_student.dart';

class RegistratsiyaUser {
  Future CreateAdsUser({
    required String Phonenumber,
    required String FullName,
    required String gender,

  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/user/user-registration',
      ),
    );

    request.fields.addAll({
      'phone': Phonenumber,
      'full_name':FullName,
      'gender': gender,
    });
    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      print('---------------------');
      print("$gender ##########");

      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);

      return jsonDecode(data);
    }
  }
}
