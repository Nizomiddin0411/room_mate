import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class ChatPermit {
  Future fetchApprov({
    required int Askid,
    required int Approvid,
  }) async {
    // print(Hive.box('token').get('token'));
    // ignore: unused_local_variable
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/user/approve-chat-permit',
      ),

    );
    request.fields.addAll({'user_asked': '${Askid}',});
    request.fields.addAll({'user_asked': '${Approvid}',});
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);
      print(Hive.box('id').get('id'));
      print(Askid);
      print(Approvid);

      return jsonDecode(data);
    }
  }
}