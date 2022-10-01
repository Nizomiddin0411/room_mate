import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Autorization/LoginPage.dart';

import '../../core/const/app_colors.dart';
class SuccedfulPage extends StatefulWidget {
  const SuccedfulPage({Key? key}) : super(key: key);

  @override
  State<SuccedfulPage> createState() => _SuccedfulPageState();
}

class _SuccedfulPageState extends State<SuccedfulPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 115, 25, 100),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
                child:Image.asset('assets/images/illustration.png')
            ),
            SizedBox(height: 50,),
            Text("Siz muvaffaqiyatli ro’yxatdan o’tdingiz !!! \n",style: TextStyle(fontSize: 18),),
            SizedBox(height: 100.h,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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
                    "Keyingi".tr(),
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
