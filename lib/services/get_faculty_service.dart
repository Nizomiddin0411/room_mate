import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/get_faculty_model.dart';

import '../core/const/consts.dart';
class GetFacultyService {
  Future<List<GetFacultyModel>> fetchFaculty(int id) async {
    try {
      var response = await http.get(Uri.parse(
        '${Const.baseUrl}api/university/get-faculty?university_id=$id',
      ),

      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List <GetFacultyModel> data = json.map((e) => GetFacultyModel.fromJson(e)).toList();
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
