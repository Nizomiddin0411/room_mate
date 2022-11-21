


import 'dart:io';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/const/consts.dart';

class DeleteMyAds {
  Future DeleteAds({required int? id,}) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        '${Const.baseUrl}api/advertising/delete-my-advertising',
      ),
        // headers: {
        //   HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
        // }


    );

    // request.fields.addAll({'advertising_id': id,});
    request.fields['advertising_id']='$id';
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);

      return jsonDecode(data);
    }
  }
}