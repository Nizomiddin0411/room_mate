import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import 'package:talaba_uy/screens/All_Ads_Page/detail_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';

import '../../models/get_all_ads.dart';
import '../../provider/region_provider.dart';
import '../../services/get_all_ads_sevice.dart';
import '../../services/get_all_ads_user.dart';
import '../../services/post_change_favoritr_service.dart';

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
    Provider.of<RegionProvider>(context, listen: false).getRegion().asStream();
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
                "E’lonlar",
                style: TextStyle(color: AppColors.mainColor),
              ),
            ),
            flexibleSpace: Consumer<RegionProvider>(
              builder: (_, data, __) {
                return Padding(
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
            Consumer<RegionProvider>(
              builder: (_, data, __) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.Ads.length,
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
                                        // isFavorite: snapshot.data![index].favorite == '0'? false : true,

                                        iconSize: 35.0,
                                        valueChanged: (_isFavorite) {
                                          // print('Is Favorite $_isFavorite)');
                                          setState(() {
                                            // FavoriteChange().Favoritefetch(id: snapshot.data![index].id.toString());
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  '${data.Ads[index].cost.toString()}${data.Ads[index].costType.toString()}',
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
                                      "${data.Ads[index].address.toString()}",
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
            FutureBuilder<List<AllAdsModel>?>(
                future: GetAllAdsUser().fetchAllADSUser(),
                builder: (context, AsyncSnapshot<List<AllAdsModel>?> snapshot) {
                  if (snapshot.hasData) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          '${snapshot.data![index].title.toString()}',
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              1, 0, 8, 0),
                                          child: FavoriteButton(
                                            isFavorite: snapshot.data![index]
                                                        .favorite ==
                                                    '0'
                                                ? false
                                                : true,
                                            iconSize: 35.0,
                                            valueChanged: (_isFavorite) {
                                              print(
                                                  'Is Favorite $_isFavorite)');
                                              setState(() {
                                                FavoriteChange().Favoritefetch(
                                                    id: snapshot.data![index].id
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 8, 0),
                                        child: Text(
                                          "${snapshot.data![index].address.toString()}",
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
                                          padding:
                                              EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                    child: const CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
