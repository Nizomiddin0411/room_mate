import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/chat/chat_page.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/core/data/mockdata.dart';
import 'package:talaba_uy/models/search_univer%20all.dart';
import 'package:talaba_uy/models/searching_students_model.dart';
import 'package:talaba_uy/screens/All_Ads_Page/detail_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';
import 'package:talaba_uy/screens/Search_University/details_page.dart';
import 'package:talaba_uy/screens/Search_University/filtr_university.dart';
import 'package:talaba_uy/services/searching_ads_service.dart';
import 'package:talaba_uy/services/searching_students_service.dart';

import '../../models/searching_ads_model.dart';
import '../../provider/universitet_provider.dart';
import 'result _filtr_search.universitety.dart';

class ResultUniversitetPage extends StatefulWidget {
  final String name;
  final String id;

  const ResultUniversitetPage({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<ResultUniversitetPage> createState() => _ResultUniversitetPageState();
}

class _ResultUniversitetPageState extends State<ResultUniversitetPage> {
  void initState() {
    super.initState();
    Provider.of<UniversitetProvider>(context, listen: false).getViloyat();
  }

  @override
  Widget build(BuildContext context) {
    TabController? _tabController;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(260.h),
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
                "Oliy o’quv yurti",
                style: TextStyle(color: AppColors.mainColor),
              ).tr(),
            ),
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(18.w, 100.h, 18.w, 18.h),
              child: Column(
                children: [
                  Container(
                    height: 87.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.secondBackgroud),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Row(
                        children: [
                          Image.asset('assets/images/image 7.png'),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 25,
                            width: 200,
                            child: AutoSizeText(
                              widget.name,
                              style: TextStyle(fontSize: 10),
                              maxLines: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.secondBackgroud),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Filtr",
                            style: TextStyle(color: Colors.black),
                          ).tr(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultFiltrPage(
                                            id: widget.id,
                                          )));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(2.0.w),
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
                ],
              ),
            ),
            bottom: TabBar(
              labelColor: AppColors.textColor,
              tabs: [
                Tab(
                  text: "Sherik kerak ",
                ),
                Tab(
                  text: "E’lonlar",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FutureBuilder<List<SearchingStudents>?>(
                future: SearchingStudentsService().fetchSearchingStudents(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<SearchingStudents>?> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext contex, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 324.w,
                                    height: 110.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
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
                                              padding: EdgeInsets.all(6.0.w),
                                              child: Text(
                                                snapshot.data![index].fullName!,
                                                style:
                                                    TextStyle(fontSize: 18.sp),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.w, 0, 8.w, 0),
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: AppColors.error,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              8.w, 0, 8.w, 0),
                                          child: Text(
                                            '',
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
                                              padding: EdgeInsets.fromLTRB(
                                                  8.w, 0, 8.w, 0),
                                              child: Text(
                                                snapshot.data![index].gender ==
                                                        1
                                                    ? "jinsi : Erkak"
                                                    : "jinsi : Ayol",
                                                style:
                                                    TextStyle(fontSize: 15.sp),
                                              ),
                                            ),
                                            Text(
                                                "Kursi : ${snapshot.data![index].course}"),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatPage(
                                                              snapshot
                                                                  .data![index]
                                                                  .fullName!,
                                                              snapshot
                                                                  .data![index]
                                                                  .id!),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 7.w, 0),
                                                  child: Container(
                                                    height: 35.h,
                                                    width: 90.w,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5.w, 0, 5.w, 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Icon(
                                                            Icons.email,
                                                            color: Colors.blue,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Text(
                                                            "Aloqa",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .backgroundWhite,
                                                        border: Border.all(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.r)),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            FutureBuilder<List<SearchingStudentAll>?>(
                future: SearchingAdsService().fetchSearchingAds(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext contex, int index) {
                          return Padding(
                            padding: EdgeInsets.all(18.0.w),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.0.w),
                                        child: Text(
                                          snapshot.data![index].type == 2
                                              ? 'Talaba'
                                              : "Elon beruvchi",
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(1.w, 0, 8.w, 0),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: AppColors.error,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                    child: Text(
                                      '${snapshot.data![index].cost}',
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
                                            EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                        child: Text(
                                          snapshot.data![index].address ?? "",
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UniverDetails(
                                                cost:
                                                    '${snapshot.data![index]}',
                                                roommate_count:
                                                    '${snapshot.data![index].roommateCount}',
                                                roommate_gender:
                                                    '${snapshot.data![index].roommateGender}',
                                                faculty:
                                                    '${snapshot.data![index].faculty}',
                                                subway:
                                                    '${snapshot.data![index].subway}',
                                                district_id:
                                                    '${snapshot.data![index].districtId}',
                                                university:
                                                    '${snapshot.data![index].university}',
                                                live_with_owner:
                                                    '${snapshot.data![index].liveWithOwner}',
                                                addres:
                                                    '${snapshot.data![index].address}',
                                                description:
                                                    '${snapshot.data![index].description}',
                                                cost_type:
                                                    '${snapshot.data![index].costType}',
                                                room_count:
                                                    '${snapshot.data![index].roomCount}',
                                                title: '',
                                                region:
                                                    '${snapshot.data![index].title}',
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              8.w, 0, 8.w, 0),
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
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
