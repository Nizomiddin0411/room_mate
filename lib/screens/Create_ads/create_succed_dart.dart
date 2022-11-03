import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/menu/menu.dart';
import 'package:talaba_uy/screens/menu/menu_for.dart';

import '../../core/const/app_colors.dart';
class CreateSuccedful extends StatefulWidget {
  const CreateSuccedful({Key? key}) : super(key: key);

  @override
  State<CreateSuccedful> createState() => _CreateSuccedfulState();
}

class _CreateSuccedfulState extends State<CreateSuccedful> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(25.w, 115.h, 25.w, 0.h),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
                child:Image.asset('assets/images/illustration.png')
            ),
            SizedBox(height: 50.h,),
            Center(child: Text("Muvaffaqiyatli e'lon yaratildi !!!",style: TextStyle(fontSize: 18.sp),).tr()),
            SizedBox(height: 236.h,),
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
              child:  Container(
                width: 250.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  // color: AppColors.buttonLinear
                ),
                child: Center(
                  child: Text(
                    "Asosiyga qaytish".tr(),
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
