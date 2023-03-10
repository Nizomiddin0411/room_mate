import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Autorization/regirtratsiya_dart.dart';
import 'LoginPage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.fromLTRB(25.w, 115.h, 25.w, 120.h),
        child: Column(
          children: [
              Text("Assalomu alaykum , Xush kelibsiz ".tr(),style: TextStyle(fontSize: 18.sp),),
            SizedBox(
              height: 66.h,
            ),
            Center(
              child:Image.asset('assets/images/logo.png')
            ),
            SizedBox(
              height: 66.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>(const LoginPage())));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10.r),
                  side: const BorderSide(color: Colors.blue)

                ),
              ),
            child:  Container(
              width: 250.w,
              height: 48.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  // color: AppColors.buttonLinear
              ),
              child: Center(
                child: Text(
                  "Kirish".tr(
                  ),
                  style: TextStyle(color: Colors.blue,fontSize: 20.sp),
                ),
              ),
            ),

            ),
           SizedBox(height: 18.h,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registratsiya()));
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),

                ),
              ),
              child:  Container(
                width: 250.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  // color: AppColors.buttonLinear
                ),
                child: Center(
                  child: Text(
                    "Ro???yxatdan o???tish".tr(),
                    style: TextStyle(color: AppColors.backgroundWhite,fontSize: 20.sp),
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
