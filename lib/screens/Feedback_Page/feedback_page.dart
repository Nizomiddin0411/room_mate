import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/app_colors.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 68.w),
          child: const Text(
            "Feedback",
            style: TextStyle(color: AppColors.mainColor),
          ).tr(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(32.w, 18.h, 32.w, 100.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18.h,
              ),
              const Center(
                child: Text("Dasturga baxo bering"),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/1.png'
                  ),
                  Image.asset(
                      'assets/images/2.png'
                  ),
                  Image.asset(
                      'assets/images/3.png'
                  ),
                ],
              ),
              SizedBox(
                height: 54.h,
              ),
              Text("Talab takliflar bo’lsa yozing"),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Container(
                  padding: EdgeInsets.only(left: 16.w),
                  child: TextFormField(
                    onChanged: (e) {
                      // if (e.length > 0) {
                      //   _descriptionOnClick = true;
                      //   _descriptionColor = Colors.grey;
                      // } else {
                      //   _descriptionOnClick = false;
                      //   _descriptionColor = Colors.red;
                      // }
                      setState(() {});
                    },
                    // controller: descriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Shu yerga xabaringizni batafsil yozing ...'.tr(),
                      border: InputBorder.none,
                      hintStyle:
                      TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    cursorColor: Colors.grey.shade800,
                    cursorWidth: 1.5.w,
                  ),
                ),
              ),
                  SizedBox(
                    height: 10.h,
                  ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Yutuqli sovrinda qatnashing !",style: TextStyle(fontSize: 18.sp),).tr(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Ushbu  yutuqli o’yin haqida batafsil ma’lumot olish shartlari ",style: TextStyle(fontSize: 16.sp),
              ),
        Text('1.Dasturdagi xatolar haqida feedback qoldiring sizning fikringiz biz uchun qiziq .'),
        Text('2.Har oyning qaysidir sanasida 1 kishi tanlab olinadi .'),
              Padding(
                padding: EdgeInsets.fromLTRB(23.w, 45.h, 23.w, 10.h),
                child: Container(
                  width: 250.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.buttonLinear
                  ),
                  child: Center(child: Text("Jo’natish",style: TextStyle(fontSize: 20.sp,color: AppColors.backgroundWhite),)),
                ),
              )

            ],
        ),
      ),
    );
  }
}
