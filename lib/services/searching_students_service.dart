import 'dart:io';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/searching_students_model.dart';

class SearchingStudentsService {
  Future<List<SearchingStudents>> fetchSearchingStudents({
    required String course,
    required String faculty_id,
    required String birth_region_id,
    required String birth_district_id,
    required String univerId,
  }) async {
    try {
      // String token = Hive.box('token').get('token');
      var _response = await http.get(
        Uri.parse(
            'http://164.68.114.231:8081/roommate/backend/web/api/university/get-searching-students?faculty_id=$faculty_id&birth_region_id=$birth_region_id&birth_district_id=$birth_district_id&university_id=$univerId&course=$course'),
        // headers: {
        //   HttpHeaders.authorizationHeader: 'Bearer $token',
        // },
      );
      if (_response.statusCode == 200) {
        List json = jsonDecode(_response.body);
        List<SearchingStudents> data =
            json.map((e) => SearchingStudents.fromJson(e)).toList();
        return data;
      } else {
        return jsonDecode(_response.body);
      }
    } catch (e) {
      print('${e}');
      return [];
    }
  }
}
