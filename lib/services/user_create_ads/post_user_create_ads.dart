




import 'dart:io';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class UserCreateAds {
  Future FetchAds({
    required String? titleController,
    required String? roommate_gender,
    required String? gender_matter,
    required String? district_id,
    required String? subway,
    required String? addressController,
    required String? university_id,
    required String? university_id_matter,
    required String? phoneController,
    required String? house_type,
    required String? rent_type,
    required String? room_count,
    required String? floors_count,
    required String? in_floor,
    required String? costController,
    required String? cost_type,
    required String? live_with_owner,
    required String? utility_electricity,
    required String? unility_gaz,
    required String? utility_hot_water,
    required String? utility_cold_water,
    required String? utility_trash,
    required String? comfort,
    required String? description,
    required String? location,
    required File file1,
    required File file2,
    required File file3,
    required String? cost_period,
}) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/advertising/user-add-advertising',
      ),
      // headers: {
      //   HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'
      // }


    );

    var file_ = await file1.exists();
    var fileSecond = await file2.exists();
    var fileThreeth = await file3.exists();

    if(!file_){
      request.files.addAll([
        await http.MultipartFile.fromPath(
          'file1',
          file1.path,
        )
      ]);
    }
    
    else{
      request.files.addAll([
        await http.MultipartFile.fromPath(
          'file1',
          file1.path,
        )
      ]);
    }
    if(!fileSecond){
      request.files.addAll([
        await http.MultipartFile.fromPath(
          'file2',
          file1.path,
        )
      ]);
    }else{
      request.files.addAll([
        await http.MultipartFile.fromPath(
          'file2',
          file1.path,
        )
      ]);
    } if(!fileThreeth){
      request.files.addAll([
        await http.MultipartFile.fromPath(
          'file3',
          file1.path,
        )
      ]);
    }else{
      request.files.addAll([
        await http.MultipartFile.fromPath(
          'file3',
          file1.path,
        )
      ]);
    }
    print("=====");


    request.fields.addAll({'title': '${titleController}',});
    request.fields.addAll({'roommate_gender': '${roommate_gender}',});
    request.fields.addAll({'gender_matter': '${gender_matter}',});
    request.fields.addAll({'district_id': '${district_id}',});
    request.fields.addAll({'address': '${addressController}',});
    request.fields.addAll({'location': '${location}',});
    request.fields.addAll({'subway': '${subway}',});
    request.fields.addAll({'university_id': '${university_id}',});
    request.fields.addAll({'university_id_matter': '${university_id_matter}',});
    request.fields.addAll({'phone_number': '${phoneController}',});
    request.fields.addAll({'house_type': '${house_type}',});
    request.fields.addAll({'rent_type': '${rent_type}',});
    request.fields.addAll({'room_count': '${room_count}',});
    request.fields.addAll({'floors_count': '${floors_count}',});
    request.fields.addAll({'in_floor': '${in_floor}',});
    request.fields.addAll({'cost': '${costController}',});
    request.fields.addAll({'cost_type': '${cost_type}',});
    request.fields.addAll({'live_with_owner': '${live_with_owner}',});
    request.fields.addAll({'utility_electricity': '${utility_electricity}',});
    request.fields.addAll({'unility_gaz': '${unility_gaz}',});
    request.fields.addAll({'utility_hot_water': '${utility_hot_water}',});
    request.fields.addAll({'utility_cold_water': '${utility_cold_water}',});
    request.fields.addAll({'utility_trash': '${utility_trash}',});
    request.fields.addAll({'comfort': '${comfort}',});
    request.fields.addAll({'description': '${description}',});
    // request.fields.addAll({'file1': '${file1}',});
    request.fields.addAll({'cost_period': '${cost_period}',});
    // request.fields['advertising_id']='$id';
    request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get('token')}'});
    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var data = await response.stream.bytesToString();
      // await Hive.box('token').put('token', jsonDecode(data)["access_token"]);
      print(Hive.box('token').get('token'));
      print(Hive.box('type').get('type'));
      print(file1.toString() + 'filllllllll');
      return jsonDecode(data);
    }else{
      print('ishlamadi');
    }
  }
}