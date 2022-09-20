import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Autorization/StartPage.dart';
class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  bool value2 = false;
  bool value1 = false;
  String _language = 'uz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 80, 25, 100),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Center(
                child:Image.asset('assets/images/Vector (3).png'),
            ),
            SizedBox(height: 10,),
            Text('Пожалуйста, выберите язык !!!'),
            SizedBox(height: 15,),
            Text("Iltimos tilni tanlang !!!"),
            SizedBox(
              height: 66.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.iconBack)),
              child: InkWell(
                onTap: () {
                  context.locale=Locale('uz','UZ');
                  setState(() {
                    _language = 'uz';
                  });
                },
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: Image.asset("assets/images/uzb.png"),
                  title: SizedBox(
                      child: Text(
                        "O’zbek (Lotin)",
                        style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      )),
                  trailing: _language == 'uz'
                      ? CircleAvatar(
                    radius: 12.r,
                    child: Icon(
                      Icons.check,
                      size: 14.sp,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(149, 149, 149, 1),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.w)),
                    child: CircleAvatar(
                      backgroundColor: AppColors.backgroundWhite,
                      radius: 10.r,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.iconBack)),
              child: InkWell(
                onTap: () {
                  context.locale=Locale('ru','RU');
                  setState(() {
                    _language = 'rus';
                    value1=false;
                  });
                },
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: Image.asset("assets/images/rus.png"),
                  title: SizedBox(
                      child: Text(
                        "Русский",
                        style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      )),
                  trailing: _language == 'rus'
                      ? CircleAvatar(
                    radius: 12.r,
                    child: Icon(
                      Icons.check,
                      size: 14.sp,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(149, 149, 149, 1),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.w)),
                    child: CircleAvatar(
                      backgroundColor: AppColors.backgroundWhite,
                      radius: 10.r,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 66.h,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StartPage()));
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
