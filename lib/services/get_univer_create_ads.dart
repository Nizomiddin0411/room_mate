import 'dart:io';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;


import '../core/const/consts.dart';
import '../models/get_univer_model.dart';

class GetUniverCrateAds {
  Future<List<GetUniverModel>> fetchUniver() async {
    try {
      String token = Hive.box('token').get('token');
      var response = await http.get(Uri.parse(
        '${Const.baseUrl}api/university',
      ),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token'
          }
      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List <GetUniverModel> data = json.map((e) => GetUniverModel.fromJson(e)).toList();
        // var data = TotalAdsModel.fromJson(jsonDecode(response.body));
        // print('${data}+++++++++++');
        return data;

      }
      else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
