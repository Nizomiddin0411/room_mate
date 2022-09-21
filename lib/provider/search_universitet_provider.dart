import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/search_universitety_model.dart';
import 'package:talaba_uy/models/searching_students_model.dart';
import 'package:talaba_uy/services/get_district_service.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_region_service.dart';
import 'package:talaba_uy/services/get_search%20universitety.dart';
import 'package:talaba_uy/services/searching_students_service.dart';

import '../models/get_region_model.dart';

class SearchUniversitet  extends ChangeNotifier{
  List<SearchUniversitetyModel> searchuniversitet =[];

  List<GetFacultyModel> searchfakultet = [];
  List<SearchingStudents> searchstudentsuniver = [];
  List<GetRegionModel> Viloyat = [];
  List<GetDistrictModel> tumanlar = [];
  List<SearchingStudents> ads = [];
  String defaultvalue1 = 'Tumanni tanlang';
  bool ischanging=false;
  bool isChanging = false;
  bool istuman = false;


  void setChange(bool value){
    ischanging = value;
    notifyListeners();
  }
  void setChanges(bool value){
    isChanging = value;
    notifyListeners();
  }
  void _settuman(bool value){
    istuman=value;
    notifyListeners();
  }

  Future<void>
  getSearchUniver(String query) async{
    setChange(false);
    searchuniversitet = (await GetSearchUniverService().fetchUniverSearch(query));
    setChange(true);
  }
  Future<void> getFakultet(int id) async{
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
  Future<void> getAds(String Fakultetid,String Regionid,String Districtid) async{
    _settuman(false);
    ads = await SearchingStudentsService().fetchSearchingStudents(faculty_id: Fakultetid, birth_region_id: Regionid, birth_district_id: Districtid);
    _settuman(true);
  }
}
