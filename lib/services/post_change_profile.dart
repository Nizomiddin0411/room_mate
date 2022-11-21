import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/const/consts.dart';
class ChangeProfile {
  Future ChangeProf({
    required String hideProfile,
    required String hidePhone,
  }) async {
    // print(Hive.box('token').get('token'));
    // ignore: unused_local_variable
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        '${Const.baseUrl}api/profile/change-searching',
      ),

      );
    request.fields.addAll({'hide_profile': hideProfile,});
    request.fields.addAll({'hide_phone': hidePhone,});
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);
      print("$hideProfile   prifilee idisi  ");
      print("$hidePhone   prifilee idisi  ");

      return jsonDecode(data);
    }
  }
}