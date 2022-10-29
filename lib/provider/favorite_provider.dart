

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:talaba_uy/services/post_student_adds.dart';

import '../models/get_favorite_model.dart';
import '../models/get_my_ads_model.dart';
import '../services/get_favorite_service.dart';
import '../services/get_my_ads_service.dart';
import '../services/user_create_ads/post_user_create_ads.dart';

class FavoriteProvider extends ChangeNotifier{
  List<FavoritemModel> Like = [];
  List<FavoritemModel> Image = [];
  FavoritemModel Image2 = FavoritemModel();
  List<GetMyAdsModel> MyAds = [];
  bool isFavorite = false;
  bool isLoading = false;
  bool isMyAds = false;
  bool isload = false;
  bool locationFor = false;
  String Local = '';
  String? imagess;
  String forMap='41.311081';
  void _setFavorite(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  void _setMyAds(bool value) {
    isMyAds = value;
    notifyListeners();
  }
 void _setPostAds(bool value){
  isLoading = value;
  notifyListeners();
  }
  void _sendstudents(bool value){
    isLoading = value;
    notifyListeners();
  }
  Future<void> getLike() async{
    _setFavorite(false);
    Like = await FavoriteService().fetchFavorite();
    // List.generate(Like.length, (index)
    // {
    //   List.generate(Like[index].images!.length, (index1) {
    //     Image = Like[index].images![index1].image.toList() ;}
    //   );
    // }
    // );
    // for(var i in Like){
    //   for(var j in i.images!) {
    //     Image = j.image.toList();
    //   }
    // }
    _setFavorite(true);
  }
  // Future<void> getImage() async{
  //   _setFavorite(false);
  //   Image.images?.map((e) => imagess = e.image
  //   );
  //   _setFavorite(true);
  // }
  
  
  
  Future<void> getMyAds() async{
    _setMyAds(false);
    MyAds = await GetMyAdsService().fetchADS();
    _setMyAds(true);
  }

  Future<void> PostUser({

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

  }) async{
    _setPostAds(false);
    // isload = true;
   await UserCreateAds().FetchAds(
      titleController: titleController,
      roommate_gender: roommate_gender,
      gender_matter: gender_matter,
      district_id: district_id,
      subway: subway,
      addressController: addressController,
      university_id: university_id,
      university_id_matter:university_id_matter,
      phoneController: phoneController,
      house_type: house_type,
      rent_type: rent_type,
      room_count: room_count,
      floors_count: floors_count,
      in_floor: in_floor,
      costController: costController,
      cost_type: cost_type,
      live_with_owner: live_with_owner,
      utility_electricity: utility_electricity,
      unility_gaz: unility_gaz,
      utility_hot_water: utility_hot_water,
      utility_cold_water: utility_cold_water,
      utility_trash: utility_trash,
      comfort: comfort,
      description: description,
      location: location,
      file1: file1,
      // FileExist[0] ? FileList[0] : FileList[3],
      cost_period: cost_period,
      file2: file2,
      // FileExist[1] ? FileList[1] : FileList[4],
      file3: file3,
      // FileExist[2] ? FileList[2] : FileList[5],
    );
    _setPostAds(true);
    // isload = false;

  }
  Future<void> StudentsAdds({
    required String title,
    required String stay_region_id,
    required String stay_region_matter,
    required String stay_university_id,
    //live
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
    required String howcountroom,
    required String cost,
    required String cost_type,
    required String live_with_owner,
    required String utility_bills,
    required String comfort,
    required String renttype,
    required String cost_period,
    required File file1,
    required File file2,
    required File file3,
  })async{
    _sendstudents(false);
    await CreateStudent().StudentsAdds(
        title:title,
        stay_region_id:stay_region_id,
        stay_region_matter:stay_region_matter,
        stay_university_id:stay_university_id,
      //live
        stay_university_matter:stay_university_matter,
        roommate_gender:roommate_gender,
        roommate_count:roommate_count,
        phone_number:phone_number,
        phone_number_show:phone_number_show,
        have_living_home:have_living_home,
        description:description,
        district_id:district_id,
        address:address,
        location:location,
        subway:subway,
        house_type:house_type,
        room_count:roommate_count,
        floors_count:floors_count,
        howcountroom:howcountroom,
        cost:cost,
        cost_type:cost_type,
        live_with_owner:live_with_owner,
        utility_bills:utility_bills,
        comfort:comfort,
        renttype:renttype,
        cost_period:cost_period,
        file1:file1,
        file2:file2,
        file3:file3,
    );
  }
}
