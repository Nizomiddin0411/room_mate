


import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DeleteMyAds {
  Future DeleteAds({required int? id,}) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/advertising/delete-my-advertising',
      ),
        // headers: {
        //   HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
        // }


    );

    // request.fields.addAll({'advertising_id': id,});
    request.fields['advertising_id']='$id';
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'});
    http.StreamedResponse response = await request.send();
    // print('$id');
    // return  http.post(
    //   Uri.parse('http://164.68.114.231:8081/roommate/backend/web/api/advertising/delete-my-advertising'),
    //   headers: {
    //     HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD',
    //   },
    //   body: jsonEncode({
    //     'advertising_id': id,
    //   }),
    // );

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);

      return jsonDecode(data);
    }
  }
}