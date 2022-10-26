import 'package:flutter/foundation.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/search_universitety_model.dart';
import 'package:talaba_uy/models/searching_students_model.dart';
import 'package:talaba_uy/services/get_district_service.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_region_service.dart';
import 'package:talaba_uy/services/get_search%20universitety.dart';
import 'package:talaba_uy/services/search_universitet_filtr.dart';
import 'package:talaba_uy/services/searching_students_service.dart';

import '../models/get_region_model.dart';

class SearchUniversitet extends ChangeNotifier {
  List<SearchUniversitetyModel> searchuniversitet = [];
  List<SearchUniversitetyModel> searchuniversitetfiltr = [];

  List<GetFacultyModel> searchfakultet = [];
  List<SearchingStudents> searchstudentsuniver = [];
  List<GetRegionModel> Viloyat = [];
  List<GetDistrictModel> tumanlar = [];

  List<SearchingStudents> ads = [];
  String defaultvalue1 = 'Tumanni tanlang';
  String RegionId = '';
  String query = '0';
  String DistrickId = '';
  bool ischanging = false;
  bool isChanging = false;
  bool istuman = false;
  bool searchfilter =false;

  void setChange(bool value) {
    ischanging = value;
    notifyListeners();
  }

  void setChanges(bool value) {
    isChanging = value;
    notifyListeners();
  }

  void _settuman(bool value) {
    istuman = value;
    notifyListeners();
  }

  Future<void> getSearchUniver(String query, String Regionid,
      String Districtid,) async {
    setChange(false);
    searchuniversitet =
        (await GetSearchUniverService().fetchUniverSearch(query,region: Regionid, district: Districtid,
          ));
    setChange(true);
  }

  Future<void>getFilter(
      String query,
    String Regionid,
    String Districtid,
  ) async {
    setChange(false);
    searchuniversitetfiltr = (await GetSearchUniverServiceFiltr()
        .fetchUniverSearch1(query,region: Regionid, district: Districtid,));
    setChange(true);
  }

  Future<void> getAds(
    String id,
    String Fakultetid,
    String Regionid,
    String Districtid,
  ) async {
    _settuman(false);
    ads = await SearchingStudentsService().fetchSearchingStudents(
      univerid: id,
      faculty_id: Fakultetid,
      birth_region_id: Regionid,
      birth_district_id: Districtid,
    );
    _settuman(true);
  }

  Future<void> getFakultet(int id) async {
    searchfakultet = await GetFacultyService().fetchFaculty(id);
  }


  Future<void> getViloyat() async{
    Viloyat=await GetRegionService().fetchRegion();
  }
  Future<void>  getTuman(int id)async{
    _settuman(false);
    tumanlar=await GetDistrictService().fetchDistrict(id);
    _settuman(true);
  }


}
