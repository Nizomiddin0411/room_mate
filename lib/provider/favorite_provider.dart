

import 'package:flutter/cupertino.dart';

import '../models/get_favorite_model.dart';
import '../models/get_my_ads_model.dart';
import '../services/get_favorite_service.dart';
import '../services/get_my_ads_service.dart';

class FavoriteProvider extends ChangeNotifier{
  List<FavoritemModel> Like = [];
  List<FavoritemModel> Image = [];
  FavoritemModel Image2 = FavoritemModel();
  List<GetMyAdsModel> MyAds = [];
  bool isFavorite = false;
  bool isMyAds = false;
  String? imagess;
  String? forMap;
  void _setFavorite(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  void _setMyAds(bool value) {
    isMyAds = value;
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
    for(var i in Like){
      for(var j in i.images!) {
        Image = j.image.toList();
      }
    }
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
}
