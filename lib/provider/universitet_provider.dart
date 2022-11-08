import 'package:flutter/foundation.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/get_region_model.dart';
import 'package:talaba_uy/models/get_univer_model.dart';
import 'package:talaba_uy/models/search_universitety_model.dart';
import 'package:talaba_uy/models/searching_students_model.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_univer_service.dart';
import 'package:talaba_uy/services/search_universitet_filtr.dart';
import 'package:talaba_uy/services/searching_students_service.dart';

import '../services/get_district_service.dart';
import '../services/get_region_service.dart';

class UniversitetProvider extends ChangeNotifier{
  List<GetUniverModel> universitet = [];
  List<GetFacultyModel> fakultet = [];
  List<GetRegionModel> Viloyat = [];
  List<GetDistrictModel> tumanlar = [];
  List<SearchingStudents> ads = [];
  bool isFakultet = false;

  String RegionId = '';
  String UniversiterId = '';
  String DistrickId = '';
  String districtId = '';
  String FacultyID = '';
  String defaultvalue = 'Fakultetni tanlang';
  String defaultvalue1 = 'Tumanni tanlang';
  bool istuman=false;
  bool isUniver = false;
  String? fakultetid;
  int? isId;
  String? districtid;
  bool ischanging = false;

  void setChange(bool value) {
    ischanging = value;
    notifyListeners();
  }
  void _setFakultet(bool value){
    isFakultet = value;
    notifyListeners();
  }
void _settuman(bool value){
    istuman=value;
    notifyListeners();
}
Future<void> getViloyat() async{
  Viloyat=await GetRegionService().fetchRegion();
}
Future<void>  getTuman(int id)async{
  _settuman(false);
  tumanlar=await GetDistrictService().fetchDistrict(id);
  _settuman(true);
}
  Future<void> getUniver() async{
    universitet = await GetUniverService().fetchUniver();
  }

  Future<void> getFakultet(int id) async{
    _setFakultet(false);
    fakultet = await GetFacultyService().fetchFaculty(id);
    _setFakultet(true);
  }
  Future<void> getAds(
      String course,
      String Fakultetid,
      String Regionid,
      String Districtid,
  {required String UniverId,}
      ) async {
    _settuman(false);
    ads = await SearchingStudentsService().fetchSearchingStudents(
      course: course,
      faculty_id: Fakultetid,
      birth_region_id: Regionid,
      birth_district_id: Districtid, univerId: UniverId,
    );
    _settuman(true);
  }
}