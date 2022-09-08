import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import '../All_Ads_Page/detail_page.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: const Center(
          child: Text(
            "Sevimlilar",
            style: TextStyle(color: AppColors.mainColor),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: AppColors.textColor,),
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 324.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: AppColors.secondBackgroud),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Student bolalarga kv!!!',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(1, 0, 8, 0),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: AppColors.error,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8, 0, 8, 0),
                                child: Text(
                                  '300/oyiga',
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 24.sp),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8, 0, 8, 0),
                                    child: Text(
                                      "Yunusobod tumani  2 kv 5/34 3 xona ",
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage()));
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          8, 0, 8, 0),
                                      child: Text(
                                        'Batafsil',
                                        style: TextStyle(
                                            decoration: TextDecoration
                                                .underline,
                                            color: AppColors.mainColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
