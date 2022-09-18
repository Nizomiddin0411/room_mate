import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:talaba_uy/chat/chat_page.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/core/data/mockdata.dart';
import 'package:talaba_uy/models/searching_students_model.dart';
import 'package:talaba_uy/screens/All_Ads_Page/detail_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';
import 'package:talaba_uy/screens/Search_University/filtr_university.dart';
import 'package:talaba_uy/services/searching_ads_service.dart';
import 'package:talaba_uy/services/searching_students_service.dart';

import '../../models/searching_ads_model.dart';
import 'result _filtr_search.universitety.dart';

class ResultUniversitetPage extends StatefulWidget {


 final  String name;
 final  String id;
  const ResultUniversitetPage({Key? key,required this.name, required this.id}) : super(key: key);

  @override
  State<ResultUniversitetPage> createState() => _ResultUniversitetPageState();
}

class _ResultUniversitetPageState extends State<ResultUniversitetPage> {


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
              ),
            ),
            flexibleSpace: Padding(
              padding:  EdgeInsets.fromLTRB(18.w, 100.h, 18.w, 18.h),
              child: Column(
                children: [
                  Container(
                    height: 87.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.secondBackgroud),
                    child: Padding(
                      padding:  EdgeInsets.all(10.0.w),
                      child: Row(

                        children: [
                          Image.asset('assets/images/image 7.png'),
                          SizedBox(width: 20,),
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
                      padding:  EdgeInsets.all(10.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Filtr",
                            style: TextStyle(color: Colors.black),
                          ),
                          InkWell(
                            onTap: (
                                ) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultFiltrPage()));
                            },
                            child:  Padding(
                              padding: EdgeInsets.all(11.0.w),
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
                future: SearchingStudentsService().fetchSearchingStudents(widget.id),
                builder: (BuildContext context,
                    AsyncSnapshot<List<SearchingStudents>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("ERROR");
                  } else {
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
                                              padding:
                                                   EdgeInsets.all(6.0.w),
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
                                          padding:  EdgeInsets.fromLTRB(
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
                                              padding:
                                                   EdgeInsets.fromLTRB(
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
                                                                  .fullName!, snapshot.data![index].id!),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                       EdgeInsets.fromLTRB(
                                                          0, 0, 7.w, 0),
                                                  child: Container(
                                                    height: 35.h,
                                                    width: 90.w,
                                                    child: Padding(
                                                      padding:  EdgeInsets
                                                          .fromLTRB(5.w, 0, 5.w, 0),
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
                                                                .circular(10.r)),
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
                }),
            FutureBuilder<List<SearchingAdsModel>?>(
                future: SearchingAdsService().fetchSearchingAds(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<SearchingAdsModel>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("ERROR");
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext contex, int index) {
                          return Padding(
                            padding:  EdgeInsets.all(18.0.w),
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
                                        padding:  EdgeInsets.all(6.0.w),
                                        child: Text(
                                          snapshot.data![index].type == 1
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
                                      snapshot.data![index].rentType == 1
                                          ? snapshot.data![index].cost
                                                  .toString() +
                                              (snapshot.data![index].costType ==
                                                      1
                                                  ? " so'm"
                                                  : " \$") +
                                              '/kunlik'
                                          : snapshot.data![index].cost
                                                  .toString() +
                                              snapshot.data![index].costType
                                                  .toString() +
                                              '/oylik',
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
                                        padding:  EdgeInsets.fromLTRB(
                                            8.w, 0, 8.w, 0),
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
                                                      DetailPage()));
                                        },
                                        child:  Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
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
                }),
          ],
        ),
      ),
    );
  }
}
