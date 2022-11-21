import 'dart:io';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/search_univer%20all.dart';
import 'package:talaba_uy/models/searching_students_model.dart';

import '../core/const/consts.dart';
import '../models/searching_ads_model.dart';
class SearchingAdsService{
  Future<List<SearchingStudentAll>?> fetchSearchingAds( ) async{
    try{
      // String token = Hive.box('token').get('token');
      var _response = await http.get(Uri.parse('${Const.baseUrl}api/advertising/get-advertising?region_id=0&district_id=0&university_id=0&faculty_id=0&course=1&live_with_owner=0&house_type=1&room_count=0&rent_type=1&subway=0&cost_from=100&cost_to=160000&type=0&roommate_gender=0'),
        // headers: {
        //   HttpHeaders.authorizationHeader: 'Bearer $token',
        // },
      );
      if (_response.statusCode == 200) {
        List json = jsonDecode(_response.body);
        List<SearchingStudentAll> data= json.map((e)=>SearchingStudentAll.fromJson(e)).toList();
        return data;
      }
      else {
        return jsonDecode(_response.body);
      }
    }
    catch(e){
      print('${e}');
    }
  }
}