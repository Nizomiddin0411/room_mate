import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talaba_uy/models/search_universitety_model.dart';


import '../models/get_univer_model.dart';

class GetSearchUniverService {
  Future<List<SearchUniversitetyModel>?> fetchUniverSearch() async {
    try {
      var response = await http.get(Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/university/index?term=урду',
      ),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer VVuDO41zOoYY2KvUUHYPOJ9PzKsnnJeD'
          }
      );
      if(response.statusCode == 200){

        List json = jsonDecode(response.body);
        List <SearchUniversitetyModel> data = json.map((e) => SearchUniversitetyModel.fromJson(e)).toList();
        // var data = TotalAdsModel.fromJson(jsonDecode(response.body));
        print('${data}+++++++++++malumot kelyapti');
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
