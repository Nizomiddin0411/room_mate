import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import 'package:talaba_uy/screens/All_Ads_Page/detail_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';

import '../../models/get_all_ads.dart';
import '../../provider/day_provider.dart';
import '../../provider/region_provider.dart';
import '../../services/get_all_ads_sevice.dart';
import '../../services/get_all_ads_user.dart';
import '../../services/post_change_favoritr_service.dart';
import '../Ads_Detail/ads_detail.dart';
import 'filtr_for_day.dart';

class KunlikIjara extends StatefulWidget {
  const KunlikIjara({Key? key}) : super(key: key);

  @override
  State<KunlikIjara> createState() => _KunlikIjaraState();
}

class _KunlikIjaraState extends State<KunlikIjara> {
  @override
  void initState() {
    super.initState();
    Provider.of<DayProvider>(context, listen: false).getUnivers();
    Provider.of<DayProvider>(context, listen: false).getRegion().asStream();
    Provider.of<DayProvider>(context, listen: false)
        .getFiltrForStudent(
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
        )
        .asStream();
    Provider.of<DayProvider>(context, listen: false)
        .getFiltrApi(
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
        )
        .asStream();
  }

  @override
  Widget build(BuildContext context) {
    TabController? _tabController;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(155),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.iconColor,
              ),
            ),
            backgroundColor: AppColors.backgroundWhite,
            title: const Center(
              child: Text(
                "Kunlik kvartira",
                style: TextStyle(color: AppColors.mainColor),
              ),
            ),
            flexibleSpace: Consumer<DayProvider>(
              builder: (_, data, __) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(18, 85, 18, 18),
                  child: Container(
                    height: 50.h,
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.secondBackgroud),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
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
                                          builder: (context) => FiltrForDay()))
                                  .then((value) => data.isChanded);
                              data.isRegion = false;
                              data.isDistricts = false;
                              data.isUniver = false;
                              data.isCourse = false;
                              data.isTypeHouse = false;
                              data.isCount = false;
                              data.isRent = false;
                              data.isSubway = false;
                              data.isFromCost = false;
                              data.isToCost = false;
                            },
                            child: const Center(
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
                );
              },
            ),
            bottom: const TabBar(
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
            Consumer<DayProvider>(
              builder: (_, data, __) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.Ads.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      data.isChanded
                                          ? data.Ads[index].title.toString()
                                          : 'Studentlar uchun',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(1, 0, 8, 0),
                                      child: FavoriteButton(
                                        isFavorite:
                                            data.Ads[index].favorite == '0'
                                                ? false
                                                : true,
                                        iconSize: 35.0,
                                        valueChanged: (_isFavorite) {
                                          // print('Is Favorite $_isFavorite)');
                                          setState(() {
                                            FavoriteChange().Favoritefetch(
                                                id: data.Ads[index].id
                                                    .toString());
                                          });
                                        },
                                      ))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  '${data.Ads[index].cost.toString()} ${data.Ads[index].costType.toString() == "1" ? "so'm" : "y.e"}',
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
                                      data.Ads[index].address.toString(),
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AdsDetail(
                                                    title: data.Ads[index].title
                                                        .toString(),
                                                    description: data
                                                        .Ads[index].description
                                                        .toString(),
                                                    houseType: data
                                                        .Ads[index].houseType
                                                        .toString(),
                                                    cost: data.Ads[index].cost
                                                        .toString(),
                                                    costTayp: data
                                                        .Ads[index].costType
                                                        .toString(),
                                                    countRoom: data
                                                        .Ads[index].roomCount
                                                        .toString(),
                                                    countPeople: data.Ads[index]
                                                        .roommateCount
                                                        .toString(),
                                                    region: data
                                                        .Ads[index].region?.name
                                                        .toString(),
                                                    district: data.Ads[index]
                                                        .district?.name
                                                        .toString(),
                                                    univer: data.Ads[index]
                                                        .university?.name
                                                        .toString(),
                                                    facultet: data.Ads[index]
                                                        .faculty?.name
                                                        .toString(),
                                                    liveWithOwner: data
                                                        .Ads[index]
                                                        .liveWithOwner
                                                        .toString(),
                                                    subway: data
                                                        .Ads[index].subway
                                                        .toString(),
                                                    favorite: data
                                                        .Ads[index].favorite
                                                        .toString(),
                                                    id: data.Ads[index].id
                                                        .toString(),
                                                    type: data.Ads[index].type
                                                        .toString(),
                                                  )));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                      child: const Text(
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
              },
            ),
            Consumer<DayProvider>(
              builder: (_, data, __) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.AdsForStudent.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      data.isChanded
                                          ? data.AdsForStudent[index].title
                                              .toString()
                                          : 'Studentlar uchun',
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(1.w, 0, 8.w, 0),
                                      child: FavoriteButton(
                                        isFavorite: data.AdsForStudent[index]
                                                    .favorite ==
                                                '0'
                                            ? false
                                            : true,
                                        iconSize: 35.0,
                                        valueChanged: (_isFavorite) {
                                          // print('Is Favorite $_isFavorite)');
                                          setState(() {
                                            FavoriteChange().Favoritefetch(
                                                id: data.AdsForStudent[index].id
                                                    .toString());
                                          });
                                        },
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                child: Text(
                                  '${data.AdsForStudent[index].cost.toString()}   ${data.AdsForStudent[index].costType.toString() == "1" ? "so'm" : "y.e"}',
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
                                      data.AdsForStudent[index].address
                                          .toString(),
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AdsDetail(
                                                    title: data
                                                        .AdsForStudent[index]
                                                        .title
                                                        .toString(),
                                                    description: data
                                                        .AdsForStudent[index]
                                                        .description
                                                        .toString(),
                                                    houseType: data
                                                        .AdsForStudent[index]
                                                        .houseType
                                                        .toString(),
                                                    cost: data
                                                        .AdsForStudent[index]
                                                        .cost
                                                        .toString(),
                                                    costTayp: data
                                                        .AdsForStudent[index]
                                                        .costType
                                                        .toString(),
                                                    countRoom: data
                                                        .AdsForStudent[index]
                                                        .roomCount
                                                        .toString(),
                                                    countPeople: data
                                                        .AdsForStudent[index]
                                                        .roommateCount
                                                        .toString(),
                                                    region: data
                                                        .AdsForStudent[index]
                                                        .region
                                                        ?.name
                                                        .toString(),
                                                    district: data
                                                        .AdsForStudent[index]
                                                        .district
                                                        ?.name
                                                        .toString(),
                                                    univer: data
                                                        .AdsForStudent[index]
                                                        .university
                                                        ?.name
                                                        .toString(),
                                                    facultet: data
                                                        .AdsForStudent[index]
                                                        .faculty
                                                        ?.name
                                                        .toString(),
                                                    liveWithOwner: data
                                                        .AdsForStudent[index]
                                                        .liveWithOwner
                                                        .toString(),
                                                    subway: data
                                                        .AdsForStudent[index]
                                                        .subway
                                                        .toString(),
                                                    favorite: data
                                                        .AdsForStudent[index]
                                                        .favorite
                                                        .toString(),
                                                    id: data
                                                        .AdsForStudent[index].id
                                                        .toString(),
                                                    type: data
                                                        .AdsForStudent[index]
                                                        .type
                                                        .toString(),
                                                  )));
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
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
