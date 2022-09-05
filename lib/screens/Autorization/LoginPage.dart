import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Autorization/sms_confirmation.dart';

import '../../core/const/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 155, 25, 150),
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
              "Login",
              style: TextStyle(color: AppColors.mainColor, fontSize: 32.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150.w,
              child: Text(
                "Shaxsiy xisobga kirish uchun maydonlarni to’ldiring",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 232, 6),
              child: Text(
                'Telefon raqamingiz',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '+ 998 ** *** ** **',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.iconColor)),
              ),
            ),
            SizedBox(
              height: 118.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (SmsConfirmationPage())));
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
