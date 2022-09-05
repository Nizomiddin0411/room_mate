import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:talaba_uy/screens/menu/menu.dart';

import '../../core/const/app_colors.dart';

class SmsConfirmationPage extends StatefulWidget {
  const SmsConfirmationPage({Key? key}) : super(key: key);

  @override
  State<SmsConfirmationPage> createState() => _SmsConfirmationPageState();
}

class _SmsConfirmationPageState extends State<SmsConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,color: AppColors.textColor,),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.w),
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
              style: TextStyle(color: AppColors.mainColor,fontSize: 32.sp),),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width -150.w,
              child: Text(
                "Biz *** 7886 raqamga SMS xabar jo’natdik,SMS xabardagi kod bilan tasdiqlang ! ",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            const PinFieldAutoFill(
                decoration: BoxLooseDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                     strokeColorBuilder: FixedColorBuilder(AppColors.mainColor),
                ),// UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration see https://github.com/TinoGuo/pin_input_text_field for more info,
                currentCode: "",// prefill with a code
                // onCodeSubmitted:, //code submitted callback
                // onCodeChanged: //code changed callback
                codeLength: 5,//code length, default 6
            ),
            SizedBox(
              height: 32.h,
            ),
            const Center(
              child: Text(
                "02:59",style: TextStyle(color: AppColors.mainColor),
              ),
            ),
            SizedBox(
              height: 85.h,
            ),
             Center(
              child: GestureDetector(
                onTap: (){},
                child: const Text(
                  "Qayta jo’natish",style: TextStyle(color: AppColors.mainColor),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MenuPage()), (route) => false);
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
                    "Keyingi",
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
