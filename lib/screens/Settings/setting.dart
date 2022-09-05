import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Settings/language_setting.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        title: Text(
          "Sozlamalar",
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 56.h),
        child: Column(
          children: [
            Container(
              height: 56.h,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSettting()));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.only(right: 12.w),
                  leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.iconBack),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Icon(
                        Icons.g_translate_outlined,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                  title: Text(
                    "Dastur tilini sozlash",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 19.sp,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 56.h,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.iconBack),
                  child: Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Icon(Icons.notification_important_outlined,
                        color: AppColors.mainColor),
                  ),
                ),
                title: Text(
                  "Bildirishnomani sozlash",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                trailing: Switch(
                  onChanged: (e) {
                    setState(() {
                      _switchValue = e;
                    });
                  },
                  value: _switchValue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
