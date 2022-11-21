import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

import '../core/const/consts.dart';

class LoginService {
  Future loginService({
    required String phone,
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse('${Const.baseUrl}api/user/send-sms'),
    );
    request.fields.addAll({
      'phone': phone, 
    });

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put(
      //   'token', 
      //   jsonDecode(data)["access_token"]
      // );
      print(phone);
      return jsonDecode(data);
    }
  }
}