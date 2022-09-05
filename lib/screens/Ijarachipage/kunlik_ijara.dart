import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/All_Ads_Page/detail_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';

class KunlikIjara extends StatefulWidget {
  const KunlikIjara({Key? key}) : super(key: key);

  @override
  State<KunlikIjara> createState() => _KunlikIjaraState();
}

class _KunlikIjaraState extends State<KunlikIjara> {
  @override
  Widget build(BuildContext context) {
    TabController? _tabController;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(155),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.iconColor,
              ),
            ),
            backgroundColor: AppColors.backgroundWhite,
            title: Center(
              child: Text(
                "Kunlik kvartira",
                style: TextStyle(color: AppColors.mainColor),
              ),
            ),
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(18, 85, 18, 18),
              child: Container(
                height: 50,
                width: 324,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.secondBackgroud),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.mainColor,
                      ),
                      Text(
                        "Joylashuvni sozlash",
                        style: TextStyle(
                            color: AppColors.iconColor, fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FiltrPage()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Icon(
                            Icons.tune,
                            color: AppColors.mainColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              labelColor: AppColors.textColor,
              tabs: [
                Tab(
                  text: "Ijarachi kerak",
                ),
                Tab(
                  text: "Kvartira kerak",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext contex, int index) {
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        'Student bollarga kvartira !!!',
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(1, 0, 8, 0),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: AppColors.error,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    '300 y.e/oyiga',
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
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: Text(
                                        "Chilonzor tumani 2 kv 5/34 4 xonadon",
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                        child: Text(
                                          'Batafsil',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
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
                }),
            ListView.builder(
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
                                  'Talabalarmiz , Kvartira kerak',
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(1, 0, 8, 0),
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
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  "Chilonzor tumani 2 kv 5/34 4 xonadon",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                                      },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    'Batafsil',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                  );
                })
          ],
        ),
      ),
    );
  }
}
