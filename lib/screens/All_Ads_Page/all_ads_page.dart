import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

class AllAdsPage extends StatefulWidget {
  const AllAdsPage({Key? key}) : super(key: key);

  @override
  State<AllAdsPage> createState() => _AllAdsPageState();
}

class _AllAdsPageState extends State<AllAdsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          title: const Center(
            child: Text(
              "Barcha e'lonlar",
              style: TextStyle(color: AppColors.mainColor),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
                child: Container(
                  width: 324.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.secondBackgroud),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Text(
                        "Joylashuvni sozlash",
                        style: TextStyle(
                            color: AppColors.iconColor, fontSize: 16.sp),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(11.0),
                        child: Icon(
                          Icons.tune,
                          color: AppColors.mainColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext contex, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: 324.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: AppColors.secondBackgroud),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    'Student bolalarga kvartira',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(1,0,8,0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: AppColors.error,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                '300 y.e/oyiga',
                                style: TextStyle(
                                    color: AppColors.mainColor, fontSize: 24.sp),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                  child: Text("Chilonzor tumani 2 kv 5/34 4 xonadon",style: TextStyle(
                                    fontSize: 10.sp
                                  ),),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8,0,8,0),
                                  child: Text('Batafsil',style: TextStyle( decoration: TextDecoration.underline,color: AppColors.mainColor),),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 18.h,
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
