import 'dart:convert';

import 'package:talaba_uy/models/get_favorite_model.dart';
import 'package:http/http.dart' as http;

class FavoriteService {
  Future<List<FavoritemModel>?> fetchFavorite() async {
    try {
      var response = await http.get(Uri.parse(
          'http://164.68.114.231:8081/roommate/backend/web/api/favorite/get-favorite'));
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
    }
  }
}
