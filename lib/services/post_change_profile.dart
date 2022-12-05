import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/const/consts.dart';
class ChangeProfile {
  Future ChangeProf({
    required String hide,
    // required String hidePhone,
    required String isHide,
  }) async {
    // print(Hive.box('token').get('token'));
    // ignore: unused_local_variable
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        '${Const.baseUrl}api/profile/change-searching',
      ),

      );
    if(isHide == '2'){
    request.fields.addAll({'hide_profile': hide,});
    }
    if(isHide == '1'){
    request.fields.addAll({'hide_phone': hide,});
    }
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);
      print("$hide   prifilee and phone");
      print("$isHide   for check  ");

      return jsonDecode(data);
    }
  }
}