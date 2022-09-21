

import 'package:flutter/cupertino.dart';

import '../models/get_favorite_model.dart';
import '../models/get_my_ads_model.dart';
import '../services/get_favorite_service.dart';
import '../services/get_my_ads_service.dart';

class FavoriteProvider extends ChangeNotifier{
  List<FavoritemModel> Like = [];
  List<GetMyAdsModel> MyAds = [];
  bool isFavorite = false;
  bool isMyAds = false;
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
    _setFavorite(true);
  }

  Future<void> getMyAds() async{
    _setMyAds(false);
    MyAds = await GetMyAdsService().fetchADS();
    _setMyAds(true);
  }
}
