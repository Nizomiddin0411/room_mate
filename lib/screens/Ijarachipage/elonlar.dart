import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';
import '../../provider/region_provider.dart';
import '../../services/post_change_favoritr_service.dart';
import '../Ads_Detail/ads_detail.dart';

class Elonlar extends StatefulWidget {
  const Elonlar({Key? key}) : super(key: key);

  @override
  State<Elonlar> createState() => _ElonlarState();
}

class _ElonlarState extends State<Elonlar> {
  @override
  void initState() {
    super.initState();
    Provider.of<RegionProvider>(context, listen: false).getUnivers();
    Provider.of<RegionProvider>(context, listen: false).getFiltrForStudent(
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
    );
    Provider.of<RegionProvider>(context, listen: false).getRegion();
    Provider.of<RegionProvider>(context, listen: false).getFiltrApi(
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
    );
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
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Text(
                "E’lonlar",
                style: TextStyle(color: AppColors.mainColor),
              ).tr(),
            ),
            flexibleSpace: Consumer<RegionProvider>(
              builder: (_, data, __) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(18.w, 85.h, 18.w, 18.h),
                  child: Container(
                    width: 324.w,
                    height: 50.h,
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
                          ).tr(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FiltrPage()))
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
            bottom: TabBar(
              labelColor: AppColors.textColor,
              onTap: (String) {},
              tabs: [
                Tab(
                  text: tr("Ijarachi kerak"),
                ),
                Tab(
                  text: tr("Kvartira kerak"),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          // physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            Consumer<RegionProvider>(
              builder: (_, data, __) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.isChanded
                        ? data.Ads.length
                        : data.AdsForZero.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 324.w,
                          height: 358.h,
                          decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6.r),bottomRight: Radius.circular(6.r)),
                              // borderRadius: BorderRadius.circular(6.r),
                              color: AppColors.secondBackgroud),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children:[ CachedNetworkImage(
                                    imageUrl: "https://source.unsplash.com/random/324x235",
                                  width: 324.w,
                                  height: 235.h,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(child:
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 112.w,
                                        height: 24.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2.r),
                                          color: AppColors.iconColor,
                                        ),

                                       child: Center(child: Text("21 Sentabr,14:01",style: TextStyle(color: AppColors.backgroundWhite),)),
                                      ),
                                      Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(1.w, 0, 8.w, 0),
                                          child: FavoriteButton(
                                            isFavorite: data.isChanded
                                                ? (data.Ads[index].favorite == '0'
                                                ? false
                                                : true)
                                                : (data.AdsForZero[index]
                                                .favorite ==
                                                '0'
                                                ? false
                                                : true),
                                            iconSize: 35.0,
                                            valueChanged: (_isFavorite) {
                                              // print('Is Favorite $_isFavorite)');
                                              setState(() {
                                                FavoriteChange().Favoritefetch(
                                                    id: data.isChanded
                                                        ? data.Ads[index].id
                                                        .toString()
                                                        : data.AdsForZero[index].id
                                                        .toString());
                                              });
                                            },
                                          )
                                        // InkWell(
                                        //   onTap: (){},
                                        //   child:  Icon(
                                        //     snapshot.data![index].favorite == '0' ? Icons.favorite_border:Icons.favorite,
                                        //     color: AppColors.error,
                                        //   ),
                                        // ),
                                      )
                                    ],
                                  ),
                                )
                                )
                                ],

                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      data.isChanded
                                          ? data.Ads[index].title.toString()
                                          : data.AdsForZero[index].title
                                              .toString(),
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
                                  ),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  '${data.isChanded ? data.Ads[index].cost.toString() : data.AdsForZero[index].cost.toString()} ${data.isChanded ? (data.Ads[index].costType.toString() == 1 ? "so'm" : 'y.e') : ''}',
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
                                      data.isChanded
                                          ? data.Ads[index].address
                                              .toString()
                                              .toString()
                                          : data.AdsForZero[index].address
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
                                                    userId:
                                                        data.Ads[index].userId!,
                                                    userFullName: data
                                                        .Ads[index].userFullName
                                                        .toString(),
                                                    chatApproved: data
                                                        .Ads[index]
                                                        .chatApproved!,
                                                  )));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                      child: Text(
                                        'Batafsil',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: AppColors.mainColor),
                                      ).tr(),
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
            Consumer<RegionProvider>(
              builder: (_, data, __) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.AdsForStudent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 324.w,
                          height: 358.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: AppColors.secondBackgroud),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children:[ CachedNetworkImage(
                                  imageUrl: "https://source.unsplash.com/random/324x235",
                                  width: 324.w,
                                  height: 235.h,
                                  fit: BoxFit.cover,
                                ),
                                  Positioned(child:
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 112.w,
                                          height: 24.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2.r),
                                            color: AppColors.iconColor,
                                          ),

                                          child: Center(child: Text("21 Sentabr,14:01",style: TextStyle(color: AppColors.backgroundWhite),)),
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
                                  )
                                  )
                                ],

                              ),
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

                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                child: Text(
                                  '${data.AdsForStudent[index].cost.toString()} ${data.AdsForStudent[index].costType.toString() == 1 ? "so'm" : 'y.e'}',
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
                                                    userId: data
                                                        .AdsForStudent[index]
                                                        .userId!,
                                                    userFullName: data
                                                        .AdsForStudent[index]
                                                        .userFullName
                                                        .toString(),
                                                    chatApproved: data
                                                        .AdsForStudent[index]
                                                        .chatApproved!,
                                                  )));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                      child: Text(
                                        'Batafsil',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: AppColors.mainColor),
                                      ).tr(),
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
