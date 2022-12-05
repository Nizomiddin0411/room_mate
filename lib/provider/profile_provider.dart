
import 'package:flutter/cupertino.dart';

import '../models/profile_model.dart';
import '../services/get_profile_service.dart';

class ProfieleProvider extends ChangeNotifier{
  ProfileModel profile = ProfileModel();
  bool isProfile = false;

  setProfile(bool value){
    isProfile = value;
    notifyListeners();
  }


  Future<void> getProfile() async {
    setProfile(false);
    profile = await ProfileService().fetchProfile();
    setProfile(true);
  }


}