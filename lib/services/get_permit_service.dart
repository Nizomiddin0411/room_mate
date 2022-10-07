import 'dart:io';

import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/get_permit_model.dart';
import 'package:http/http.dart'as http;
class GetPermitSevice {
  Future<List<chatPermitModel>> fetchPermit() async {
    try {
      var response = await http.get(Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/user/chat-permit-list',
      ),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'
          }
      );
      if(response.statusCode == 200){
        List json = jsonDecode(response.body);
        List<chatPermitModel> data = json.map((e) => chatPermitModel.fromJson(e)).toList();
        print('${data}+++++++++++');
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
