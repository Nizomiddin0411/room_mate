import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/core/data/mockdata.dart';
import '../models/get_faculty_model.dart';


class GetFacultyCreateAds {
  Future<List<GetFacultyModel>> fetchFaculty(int id) async {
    try {
      var response = await http.get(Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/university/get-faculty?university_id=$id',
      ),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
          }
      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List <GetFacultyModel> data = json.map((e) => GetFacultyModel.fromJson(e)).toList();
        // var data = TotalAdsModel.fromJson(jsonDecode(response.body));
        // print('${data}+++++++++++');
        return data;

      }
      else {
        return jsonDecode(response.body);
      }
    } catch (e) {
     return [];
    }
  }
}
