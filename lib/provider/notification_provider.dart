

import 'package:cron/cron.dart';
import 'package:flutter/cupertino.dart';

import '../models/count_notification_model.dart';
import '../services/get_count_notification.dart';

class NotificationProvider extends ChangeNotifier{
  CountNoficationModel count = CountNoficationModel();
  bool isCount = false;


  setCount(bool value){
    isCount = value;
    notifyListeners();
  }


  Future<void> getCount() async {
    setCount(false);
    // final cron = Cron();
    // try{
    // cron.schedule(Schedule.parse('*/6 * * * * *'), () async {
      count = await GetCountNotification().fetchCount();
    // });
    // } on ScheduleParseException{
    //   await cron.close();
    // }

    setCount(true);
  }
}