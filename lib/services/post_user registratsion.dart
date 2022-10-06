import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:talaba_uy/services/post_create_ads_student.dart';

class RegistratsiyaUser {
  Future CreateAdsUser({
    required String Phonenumber,
    required String FullName,

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
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      print('---------------------');
      print("$FullName ismi");
      print("$Phonenumber nomer");
      return jsonDecode(data);
    }
  }
}
