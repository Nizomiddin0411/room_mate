import 'dart:io';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;



import '../core/const/consts.dart';
import '../models/profile_model.dart';


class ProfileService {
  Future<ProfileModel> fetchProfile() async {
    try {
      var response = await http.get(Uri.parse(
        '${Const.baseUrl}api/user/get-profile',
      ),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'
          }
      );
      if(response.statusCode == 200){
        print('--------');
        // List json = jsonDecode(response.body);
        // List <GetRegionModel> data = json.map((e) => GetRegionModel.fromJson(e)).toList();
        var data = ProfileModel.fromJson(jsonDecode(response.body));
        print('${data.fullName}+++++++++++');

        return data;

      }
      else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      rethrow;
    }

  }
}
