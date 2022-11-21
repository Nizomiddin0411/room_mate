import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/const/consts.dart';
class ChatApprove {
  Future fetchApprov({
    required String PermitId,
    required String Approved,
  }) async {
    // print(Hive.box('token').get('token'));
    // ignore: unused_local_variable
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        '${Const.baseUrl}api/user/approve-chat-permit',
      ),

    );

    request.fields.addAll({'chat_permit_id': PermitId,});
    request.fields.addAll({'approved': Approved,});
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);
      // print(Hive.box('id').get('id'));
      print(Approved);

      print('okeyyyy');

      return jsonDecode(data);
    }
  }
}