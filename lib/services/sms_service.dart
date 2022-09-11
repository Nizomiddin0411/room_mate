import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
class SmsService {
  
  Future smsService({
    required String phone, 
    required String sms
  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse('https://ads.bolakayjon.uz/mobile/user/login'),
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
      return jsonDecode(data);
    }
  }
}