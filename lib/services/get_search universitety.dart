import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/search_universitety_model.dart';

import '../models/get_univer_model.dart';

class GetSearchUniverService {
  Future<List<SearchUniversitetyModel>> fetchUniverSearch(String query) async {
    try {
      var _response = await http.get(
        Uri.parse(
            'http://164.68.114.231:8081/roommate/backend/web/api/university/index?term=$query'),
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
