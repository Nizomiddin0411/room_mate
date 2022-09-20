import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Autorization/sms_confirmation.dart';
import 'package:talaba_uy/services/login_service.dart';
import 'package:easy_mask/easy_mask.dart';

import '../../core/const/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController(text: '+998');
  String _message = '';
  GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(18.w, 0.h, 25.w, 100.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Center(
                  child: Text(
                    "Login",
                    style:
                        TextStyle(color: AppColors.mainColor, fontSize: 32.sp),
                  ).tr(),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 150.w,
                    child: Text(
                      "Shaxsiy xisobga kirish uchun maydonlarni to’ldiring",
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Text(
                  'Telefon raqamingiz'.tr(),
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6.h,
                ),
                TextFormField(
                  inputFormatters: [
                    TextInputMask(
                      mask: '\\+ 999 99 999 99 99',
                      placeholder: '_ ',
                      maxPlaceHolders: 13,
                    )
                  ],
                  key: _key,
                  controller: _phoneController,
                  onChanged: (e){
                    print(_phoneController.text);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '998  _ _  _ _ _  _ _  _ _ ',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.iconColor)),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                var dataService = await LoginService()
                    .loginService(phone: _phoneController.text);
                if (dataService['status']) {
                  _message = dataService['content'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SmsConfirmationPage(
                              _phoneController.text, _message)));
                  print(_message);
                } else {
                  _message = dataService['content'];
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(_message)));
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
