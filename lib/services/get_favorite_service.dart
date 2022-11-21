import 'dart:io';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:talaba_uy/models/get_favorite_model.dart';
import 'package:http/http.dart' as http;

import '../core/const/consts.dart';

class FavoriteService {
  Future<List<FavoritemModel>> fetchFavorite() async {
    try {
      var response = await http.get(Uri.parse(
          '${Const.baseUrl}api/favorite/get-favorite'),
          headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'
          }

      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List<FavoritemModel> data = json.map((e) => FavoritemModel.fromJson(e)).toList();
        // var data = TotalAdsModel.fromJson(jsonDecode(response.body));
        print('${data}+++++++++++');
        return data;

      }
      else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
