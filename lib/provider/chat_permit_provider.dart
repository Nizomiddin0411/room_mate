

import 'package:flutter/cupertino.dart';

import '../models/get_permit_model.dart';
import '../services/get_permit_service.dart';

class ChatPermit extends ChangeNotifier{
  List<chatPermitModel> permit = [];
  bool isPermit = false;

  void setPermit(bool val){
    isPermit = val;
    notifyListeners();
  }


  Future<void> Permit() async {
    setPermit(false);
    permit = await GetPermitSevice().fetchPermit();
    setPermit(true);
  }
}