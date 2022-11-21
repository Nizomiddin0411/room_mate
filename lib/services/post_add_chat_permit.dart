import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/const/consts.dart';
class PostChatPermit {
  Future fetchApprov({
    required String Askid,

  }) async {
    // print(Hive.box('token').get('token'));
    // ignore: unused_local_variable
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        '${Const.baseUrl}api/user/add-chat-permit',
      ),

    );
    request.fields.addAll({'user_asked': '${Hive.box('id').get('id').toString()}',});
    request.fields.addAll({'user_approved': '${Askid}',});
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();

      print(Hive.box('id').get('id'));
      print('${Askid} other');
      // print(Approvid);

      return jsonDecode(data);
    }
  }
}