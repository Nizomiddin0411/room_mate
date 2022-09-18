import 'package:flutter/foundation.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/get_region_model.dart';
import 'package:talaba_uy/models/get_univer_model.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_univer_service.dart';

import '../services/get_district_service.dart';
import '../services/get_region_service.dart';

class UniversitetProvider extends ChangeNotifier{
  List<GetUniverModel> universitet = [];
  List<GetFacultyModel> fakultet = [];
  List<GetRegionModel> Viloyat = [];
  List<GetDistrictModel> tumanlar = [];
  bool isFakultet = false;
  String defaultvalue = 'Fakultetni tanlang';
  String defaultvalue1 = 'Tumanni tanlang';
  bool istuman=false;
  String universiterid='';
  String fakultetid='';
  String district_id='';


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
}