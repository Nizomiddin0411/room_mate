import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/chat/chat_page.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/searching_students_model.dart';
import 'package:talaba_uy/screens/All_Ads_Page/detail_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';
import 'package:talaba_uy/screens/Search_University/filtr_university.dart';
import 'package:talaba_uy/services/searching_ads_service.dart';
import 'package:talaba_uy/services/searching_students_service.dart';

import '../../models/searching_ads_model.dart';
import 'result _filtr_search.universitety.dart';

class ResultUniversitetPage extends StatefulWidget {
  const ResultUniversitetPage({Key? key}) : super(key: key);

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
          preferredSize: Size.fromHeight(260),
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
              padding: const EdgeInsets.fromLTRB(18, 100, 18, 18),
              child: Column(
                children: [
                  Container(
                    height: 87,
                    width: 324,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.secondBackgroud),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/image 7.png'),
                          Text(
                              'Muhammad al-Xorazmiy nomidagi\n Toshkent axborot\n texnologiyalari universiteti\n Samarqand filiali\n')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
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
                          Text(
                            "Filtr",
                            style: TextStyle(color: Colors.black),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultFiltrPage()));
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
                                                  const EdgeInsets.all(6.0),
                                              child: Text(snapshot.data![index].fullName!,
                                                style:
                                                    TextStyle(fontSize: 18.sp),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1, 0, 8, 0),
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
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 8, 0),
                                              child: Text(snapshot.data![index].gender == 1 ? "jinsi : Erkak" : "jinsi : Ayol"
                                                ,
                                                style:
                                                    TextStyle(fontSize: 15.sp),
                                              ),
                                            ),
                                            Text("Kursi : ${snapshot.data![index].course}"),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ChatPage(
                                                                  name:
                                                                      "Polat Alemdar")));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 7, 0),
                                                  child: Container(
                                                    height: 35,
                                                    width: 90,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(5, 0, 5, 0),
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
                                                            width: 10,
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
                                                                .circular(10)),
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
                                child: Text(snapshot.data![index].type == 1 ?
                                  'Talaba' : "Elon beruvchi",
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
                            child: Text(snapshot.data![index].rentType == 1 ? snapshot.data![index].cost.toString() + (snapshot.data![index].costType == 1 ? " so'm" : " \$") + '/kunlik' : snapshot.data![index].cost.toString() + snapshot.data![index].costType.toString() + '/oylik',
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
                                  snapshot.data![index].address ?? "",
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
                });
          }
                }),
            ],
        ),
      ),
    );
  }
}
