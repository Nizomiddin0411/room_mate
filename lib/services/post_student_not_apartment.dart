import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CreateStudentHouse {
  Future StudentsCreateAds(
      {
        required String title,
        required String stay_region_id,
        required String stay_region_matter,
        required String stay_university_id,
        required String stay_university_matter,
        required String roommate_gender,
        required String roommate_count,
        required String phone_number,
        required String phone_number_show,
        required String have_living_home,
        required String description,
        required String district_id,
        required String address,
        required String location,
        required String subway,
        required String house_type,
        required String room_count,
        required String floors_count,
        required int howcountroom,
        required String cost,
        required String cost_type,
        required String live_with_owner,
        required String utility_bills,
        required String comfort,
        required String renttype,
        required String cost_period,

      } ) async {
    var request = http.MultipartRequest(
      'post',
      Uri.parse(
        'http://164.68.114.231:8081/roommate/backend/web/api/advertising/student-add-advertising',
      ),
    );
      request.fields.addAll({
        'title': title,
        'stay_region_id': stay_region_id,
        'stay_region_matter': stay_region_matter,
        'stay_university_id': stay_university_id,
        'stay_university_matter': stay_university_matter,
        'roommate_gender': roommate_gender,
        'roommate_count': roommate_count,
        'phone_number': phone_number,
        'phone_number_show': phone_number_show,
        'have_living_home': have_living_home,
        'description': description,
        'district_id': district_id,
        'address': address,
        'location': location,
        'subway': subway,
        'house_type': house_type,
        'room_count': room_count,
        'floors_count': floors_count,
        'in_floor': '${howcountroom}',
        'cost': cost,
        'cost_type': cost_type,
        'live_with_owner': live_with_owner,
        'utility_bills': utility_bills,
        'comfort': comfort,
        'rent_type': renttype,
        'cost_period': cost_period,
      });
      print('${title} titletitle nomi +++++++++++');
      print('${stay_region_id} stay_region_id id+++++++++++');
      print('${stay_region_matter} stay_region_matter yooo+++++++++++');
      print('${stay_university_id} stay_university_id +++++++++++');
      print('${stay_university_matter} stay_university_matter+++++++++++');
      print('${roommate_gender} roommate_gender+++++++++++');
      print('${roommate_count} roommate_count+++++++++++');
      print('${phone_number} phone_number +++++++++++');
      print('${phone_number_show} phone_number_show +++++++++++');
      print('${description} description +++++++++++');
      print('${district_id} district_id +++++++++++');
      print('${address} address +++++++++++');
      print('${location} location +++++++++++');
      print('${subway} subway +++++++++++');
      print('${house_type} house_type +++++++++++');
      print('${room_count} room_count +++++++++++');
      print('${floors_count} floors_count +++++++++++');
      print('${howcountroom} howcountroom +++++++++++');
      print('${cost} cost +++++++++++');
      print('${cost_type} cost_type +++++++++++');
      print('${live_with_owner} live_with_owner +++++++++++');
      print('${utility_bills} utility_bills +++++++++++');
      print('${comfort} comfort +++++++++++');
      print('${renttype} renttype +++++++++++');
      print('${cost_period} cost_period +++++++++++');
      print('${File} File +++++++++++');
      // request.fields['district_id']='1';
      request.headers.addAll(
          {
            HttpHeaders.authorizationHeader: 'Bearer ${Hive.box('token').get(
                'token')}'
          }
      );
      http.StreamedResponse response = await request.send();

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var data = await response.stream.bytesToString();
        print(data);
        return jsonDecode(data);
      }
  }}