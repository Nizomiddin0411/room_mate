

import 'package:flutter/cupertino.dart';

import '../models/get_favorite_model.dart';
import '../services/get_favorite_service.dart';

class FavoriteProvider extends ChangeNotifier{
  List<FavoritemModel> Like = [];
  bool isFavorite = false;

  void _setFavorite(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  Future<void> getLike() async{
    _setFavorite(false);
    Like = await FavoriteService().fetchFavorite();
    _setFavorite(true);
  }
}
