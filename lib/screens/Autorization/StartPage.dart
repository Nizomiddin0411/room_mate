import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

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
        padding: const EdgeInsets.fromLTRB(25, 155, 25, 150),
        child: Column(
          children: [
              Text("Assalomu alaykum , Xush kelibsiz 👋",style: TextStyle(fontSize: 18.sp),),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>(LoginPage())));
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
                  "Login",
                  style: TextStyle(color: AppColors.backgroundWhite,fontSize: 20.sp),
                ),
              ),
            ),

            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('yoki'),
            ),
            ElevatedButton(
              onPressed: () {  },
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
                    "Ro’yxatda o’tish",
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
