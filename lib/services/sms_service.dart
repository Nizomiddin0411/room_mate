import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

import '../core/const/consts.dart';
class SmsService {
  
  Future smsService({
    required String phone, 
    required String sms
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse('${Const.baseUrl}api/user/check-sms'),
    );
    request.fields.addAll({
      'phone': phone, 
      'sms': sms
    });

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      await Hive.box('token').put(
        'token', 
        jsonDecode(data)["access_token"]
      );
       await Hive.box('id').put(
        'id', 
        jsonDecode(data)["user_id"]
      );
      await Hive.box('fullname').put(
        'fullname', 
        jsonDecode(data)["full_name"]
      );
      await Hive.box('type').put(
        'type',
        jsonDecode(data)["role_id"]
      );
      await Hive.box('hide_profile').put(
          'hide_profile',
          jsonDecode(data)["hide_profile"]
      );
      await Hive.box('hide_phone').put(
          'hide_phone',
          jsonDecode(data)["hide_phone"]
      );
      return jsonDecode(data);
    }
  }
}