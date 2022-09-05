import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

class LanguageSettting extends StatefulWidget {
  const LanguageSettting({Key? key}) : super(key: key);

  @override
  State<LanguageSettting> createState() => _LanguageSetttingState();
}

class _LanguageSetttingState extends State<LanguageSettting> {
  String? _groupValue;
  String _language = 'uz';

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
        elevation: 0,
        title: Text(
          "Til sozlamalari",
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 48.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.iconBack)),
              child: InkWell(
                onTap: () {
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
                  setState(() {
                    _language = 'rus';
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
          ],
        ),
      ),
    );
  }
}
