import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/services/post_create_ads_student.dart';

class RegistratsiyaStudent {
  Future CreateAdsStudent({
    required String FullName,
    required String Phonenumber,
    required String Hidenumber,
    required String gender,
    required String fakultetId,
    required String UniderId,
    required String Course,
    required String District,
    required String HideProfile,
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/user/student-registration',
      ),
    );

    request.fields.addAll({
      'full_name': FullName,
      'phone':Phonenumber,
      'hide_phone':Hidenumber,
      'gender': gender,
      'faculty_id': fakultetId,
      'university_id': UniderId,
      'course': Course,
      'birth_district_id': District,
      'hide_profile': HideProfile,
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      print('$Phonenumber jjfhhfhdsdvtsdfstd');
      print("$gender    jinsi ");
      print("$fakultetId fakulted id si  ");
      print("$Course sheri kursi ");
      print("$District  viloyattt idisi  ");
      print("$UniderId  univer idhbdjydfujedhedjreyehjfkdsi   ");
      print("$HideProfile   number hide   ");
      print("$Hidenumber  profile hide   ");
      return jsonDecode(data);
    }
  }
}
