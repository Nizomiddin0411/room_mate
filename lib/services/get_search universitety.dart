import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/search_universitety_model.dart';

import '../core/const/consts.dart';
import '../models/get_univer_model.dart';

class GetSearchUniverService {
  Future<List<SearchUniversitetyModel>> fetchUniverSearch(String query,{
  required String region,
  required String district,
}) async {
    try {
      var _response = await http.get(
        Uri.parse(
            '${Const.baseUrl}api/university/index?term=$query&region_id=$region&district_id=$district'),
      );
      if (_response.statusCode == 200) {
        List json = jsonDecode(_response.body);
        List<SearchUniversitetyModel> data =
            json.map((e) => SearchUniversitetyModel.fromJson(e)).toList();
        return data;
      } else {
        return jsonDecode(_response.body);
      }
    } catch (e) {
      print('${e}');
      return [];
    }
  }
}
