import 'dart:io';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/searching_students_model.dart';

import '../models/searching_ads_model.dart';
class SearchingAdsService{
  Future<List<SearchingAdsModel>?> fetchSearchingAds() async{
    try{
      // String token = Hive.box('token').get('token');
      var _response = await http.get(Uri.parse('http://164.68.114.231:8081/roommate/backend/web/api/advertising/get-advertising'),
        // headers: {
        //   HttpHeaders.authorizationHeader: 'Bearer $token',
        // },
      );
      if (_response.statusCode == 200) {
        List json = jsonDecode(_response.body);
        List<SearchingAdsModel> data= json.map((e)=>SearchingAdsModel.fromJson(e)).toList();
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