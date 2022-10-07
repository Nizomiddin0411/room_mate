import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class ChangeProfile {
  Future ChangeProf({
    required String id,
  }) async {
    // print(Hive.box('token').get('token'));
    // ignore: unused_local_variable
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/profile/change-searching',
      ),

      );
    request.fields.addAll({'hide_profile': id,});
    request.fields.addAll({'hide_phone': id,});
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);
      print("$id   prifilee idisi  ");

      return jsonDecode(data);
    }
  }
}