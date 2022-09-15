import 'package:flutter/cupertino.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/services/get_district_service.dart';

import '../models/get_region_model.dart';
import '../services/get_district_for_create.dart';
import '../services/get_region_service.dart';

class RegionProvider extends ChangeNotifier{
  List<GetRegionModel> regions = [];
  List<GetDistrictModel> districts = [];
  bool isDistrict = false;
  String defaultvalue = 'Tumanni tanlang';


  void _setDistrict(bool value){
    isDistrict = value;
    notifyListeners();
  }


  Future<void> getRegion() async{
    regions = await GetRegionService().fetchRegion();
  }


  Future<void> getDistrict(int id) async{
    _setDistrict(false);
    districts = await GetDistrictForCreate().fetchDistrict(id);
    _setDistrict(true);
  }
}