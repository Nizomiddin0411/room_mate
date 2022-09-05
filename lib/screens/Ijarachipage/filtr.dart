import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/All_Ads_Page/all_ads_page.dart';

class FiltrPage extends StatefulWidget {
  const FiltrPage({Key? key}) : super(key: key);

  @override
  State<FiltrPage> createState() => _FiltrPageState();
}

class _FiltrPageState extends State<FiltrPage> {
  bool _checkHome = false;
  bool _checkMetro = false;
  String? _dropownUsd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        title: Text(
          "Filtr",
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Joylashuv",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12.h),
              Text(
                "Viloyat",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4.r)),
                child: ExpansionTile(
                  title: Text(
                    "Viloyatni tanlang",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  children: [],
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Tuman",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4.r)),
                child: ExpansionTile(
                  title: Text(
                    "Tumanni tanlang",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  children: [],
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Oliy o’quv yurti",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4.r)),
                child: ExpansionTile(
                  title: Text(
                    "Oliy o’quv yurtingizni tanlang",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  children: [],
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Kursingiz",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4.r)),
                child: ExpansionTile(
                  title: Text(
                    "Kursingizni kiriting",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  children: [],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                "Xonadon ma’lumoti",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Uy turi",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Container(
                          width: 152.w,
                          child: ExpansionTile(
                            title: Text(
                              "Kvartira , Xovli",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.sp),
                            ),
                            children: [],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Necha xona",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Container(
                          width: 152.w,
                          child: ExpansionTile(
                            title: Text(
                              "Xonalar soni",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.sp),
                            ),
                            children: [],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                "Ijara muddatini kiriting",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Container(
                  width: 152.w,
                  child: ExpansionTile(
                    title: Text(
                      "Ijara muddati",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    children: [],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: _checkMetro,
                      onChanged: (e) {
                        setState(() {
                          // _checkMetro = e!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text("Metroga yaqin")
                ],
              ),
              SizedBox(height: 22.h),
              Text(
                "Narxi",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12.h),
              Text("Dan"),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        padding: EdgeInsets.only(left: 16.w),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "dan",
                            hintStyle:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                          cursorColor: Colors.grey.shade800,
                          cursorWidth: 1.5.w,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        padding: EdgeInsets.only(left: 16.w),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "gacha",
                            hintStyle:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                          cursorColor: Colors.grey.shade800,
                          cursorWidth: 1.5.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 31.w),
                child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          primary: AppColors.buttonLinear),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllAdsPage()),
                            (route) => false);
                      },
                      child: Text(
                        "Saqlash",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
