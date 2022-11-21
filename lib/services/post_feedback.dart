import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/services/post_create_ads_student.dart';

import '../core/const/consts.dart';

class FeedbackPost {
  Future postFeedback({
    required String rate,
    required String description,

  }) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        '${Const.baseUrl}api/user/feedback',
      ),
    );

    request.fields.addAll({
      'rate': rate,
      'description':description,
    });
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      print('---------------------');

      return jsonDecode(data);
    }
  }
}
