import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:talaba_uy/services/post_create_ads_student.dart';

class RegistratsiyaStudent {
  Future CreateAdsStudent({
    required String Phonenumber,
    required String FullName,
    required String gender,
    required String fakultetId,
    required String UniderId,
    required String Course,
    required String Roommate,
    required String District,
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/user/student-registration',
      ),
    );

    request.fields.addAll({
      'phone': Phonenumber,
      'full_name':FullName,
      'gender': gender,
      'faculty_id': fakultetId,
      'university_id': UniderId,
      'course': Course,
      'roommate': Roommate,
      'birth_district_id': District
    });
    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      print('---------------------');
      print("$gender ##########");
      print("$Roommate sherik kerakkkk ");
      print("$fakultetId sherik kerakkkkcbdshcbbhdcbd ");
      print("$Course sheri kursi ");
      print("$District tugilgan joyyyy ");
      print("$FullName Ismiiiiiii ");

      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);

      return jsonDecode(data);
    }
  }
}
