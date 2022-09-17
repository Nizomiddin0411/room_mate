import 'package:flutter/cupertino.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/services/get_district_service.dart';

import '../models/get_all_ads.dart';
import '../models/get_faculty_model.dart';
import '../models/get_region_model.dart';
import '../models/get_univer_model.dart';
import '../services/get_all_ads_sevice.dart';
import '../services/get_district_for_create.dart';
import '../services/get_faculty_create_ads.dart';
import '../services/get_region_service.dart';
import '../services/get_univer_create_ads.dart';

class RegionProvider extends ChangeNotifier{
  List<GetRegionModel> regions = [];
  List<GetDistrictModel> districts = [];
  List<GetUniverModel> univer = [];
  List<GetFacultyModel> faculty = [];
  List<AllAdsModel> Ads = [];
  String RegionId = '';
  String districtId = '';
  String UniverId = '';
  String FacutyId = '';
  String districtOwnerId = '';
  bool isDistrict = false;
  String defaultvalue = 'Tumanni tanlang';
  bool isFaculty = false;
  String defaultFaculty = 'Faqutetni tanlang';
  bool isChanded = false;

  void _setFiltr(bool value){
    isChanded = value;
    notifyListeners();
  }

  void _setDistrict(bool value){
    isDistrict = value;
    notifyListeners();
  }
  void _setFacuty(bool val){
    isFaculty = val;
    notifyListeners();
  }



  Future<void> getRegion() async{
    regions = await GetRegionService().fetchRegion();
  }

  Future<void> getUnivers() async{
    univer = await GetUniverCrateAds().fetchUniver();
  }
  Future<void> getFaculty(int id) async{
    _setFacuty(false);
    faculty = await GetFacultyCreateAds().fetchFaculty(id);
    _setFacuty(true);
  }


  Future<void> getDistrict(int id) async{
    _setDistrict(false);
    districts = await GetDistrictForCreate().fetchDistrict(id);
    _setDistrict(true);
  }


  Future<void> getFiltrApi(
      String regionId,
      String districtId,
      String univerId,
      String course,
      String houseType,
      String roomCount,
      String rentType,
      String subway,
      String costFrom,
      String costTo,
      // String Type,

      ) async{
    _setFiltr(false);
    Ads = await GetAllAdsService().fetchAllADS(
        regionId,
        districtId,
        univerId,

        course,

        houseType,
        roomCount,
        rentType,
        subway,
        costFrom,
        costTo,
        // Type,

    );
    _setFiltr(true);
  }


}