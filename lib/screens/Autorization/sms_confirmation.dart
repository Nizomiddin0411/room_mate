import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:talaba_uy/screens/menu/menu.dart';
import 'package:talaba_uy/services/login_service.dart';
import 'package:talaba_uy/services/sms_service.dart';

import '../../core/const/app_colors.dart';

class SmsConfirmationPage extends StatefulWidget {
  String? _phone;
  String? _message;
  SmsConfirmationPage(this._phone, this._message);

  @override
  State<SmsConfirmationPage> createState() => _SmsConfirmationPageState();
}

class _SmsConfirmationPageState extends State<SmsConfirmationPage> {
  String? _message;
  TextEditingController? _smsController;
  String _code = "";

  Timer? _timer;
  int _secoundCount = 59;
  int _minutCount = 2;
  bool _timeOf = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // do what you want here
      final snackBar = SnackBar(
        content: Text(widget._message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        this._secoundCount -= 1;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String func() {
      List<String> _listPhone = widget._phone!.split('');
      String _partPhone =
          _listPhone[8] + _listPhone[9] + _listPhone[10] + _listPhone[11];
      return _partPhone;
    }

    String _partPhone = func();
    setState(() {
      if (_secoundCount == 0 && _minutCount != 0) {
        _secoundCount = 59;
        _minutCount -= 1;
      }
      if (_minutCount == 0 && _secoundCount == 0) {
        _timer!.cancel();
        _timeOf = true;
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'assets/images/logo.png',
              width: 109.w,
              height: 116.h,
            )),
            SizedBox(
              height: 26.h,
            ),
            Text(
              "SMS tasdiqlash",
              style: TextStyle(color: AppColors.mainColor, fontSize: 32.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150.w,
              child: Text(
                "Biz *** $_partPhone raqamga SMS xabar jo’natdik, SMS xabardagi kod bilan tasdiqlang!".tr(),
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            PinFieldAutoFill(
              decoration: BoxLooseDecoration(
                textStyle: TextStyle(fontSize: 20, color: Colors.black),
                strokeColorBuilder: FixedColorBuilder(AppColors.mainColor),
              ),
              currentCode: _code, // prefill with a code
              codeLength: 5, //code length, default 6
              onCodeChanged: (code) {
                setState(() {
                  _code = code!;
                  print(_code);
                });
              },
            ),
            SizedBox(height: 10.h,),
            Text("SMS habardagi kodni kiriting".tr()),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Text(
                _secoundCount > 9
                    ? "0" +
                        _minutCount.toString() +
                        ":" +
                        _secoundCount.toString()
                    : "0" +
                        _minutCount.toString() +
                        ":" +
                        "0" +
                        _secoundCount.toString(),
                style: TextStyle(color: AppColors.mainColor),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (_timeOf) {
                    _timeOf = false;
                    _minutCount = 2;
                    _secoundCount = 59;
                    _timer = Timer.periodic(
                      Duration(seconds: 1),
                      (timer) {
                        this._secoundCount -= 1;
                        setState(() {});
                      },
                    );
                    var dataService = await LoginService()
                        .loginService(phone: widget._phone!);
                    if (dataService['status']) {
                      _message = dataService['content'];
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(_message!)));
                    } else {
                      _message = dataService['content'];
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(_message!)));
                    }
                  }
                },
                child: Text(
                  "Qayta jo’natish",
                  style: TextStyle(
                      color: !_timeOf
                          ? Colors.grey.shade400
                          : AppColors.mainColor),
                ),
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            ElevatedButton(
              onPressed: () async {


                var dataService = await SmsService()
                    .smsService(phone: widget._phone!, sms: _code);
                if (dataService['status']) {
                  _message = dataService['content'];
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                      (route) => false);
                } else {
                  _message = dataService['content'];
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(_message!)));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Container(
                width: 250.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  // color: AppColors.buttonLinear
                ),
                child: Center(
                  child: Text(
                    "Keyingi".tr(),
                    style: TextStyle(
                        color: AppColors.backgroundWhite, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
