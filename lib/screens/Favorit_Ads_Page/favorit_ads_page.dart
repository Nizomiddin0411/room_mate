import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/const/app_colors.dart';
import '../../provider/favorite_provider.dart';
import '../../services/post_my_ads_delete_Service.dart';
import '../Ads_Detail/ads_detail.dart';

class FavoritAds extends StatefulWidget {
  const FavoritAds({Key? key}) : super(key: key);

  @override
  State<FavoritAds> createState() => _FavoritAdsState();
}

class _FavoritAdsState extends State<FavoritAds> {
  @override
  void initState() {
    Provider.of<FavoriteProvider>(context, listen: false).getMyAds().asStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: const Text(
            "E’lonlarim",
            style: TextStyle(color: AppColors.mainColor),
          ).tr(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<FavoriteProvider>(
              builder: (_, data, __) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.MyAds.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 324.w,
                                height: 117.h,
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
                                            data.MyAds[index].title.toString(),
                                            style: TextStyle(fontSize: 18.sp),
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 25,
                                          icon: const Icon(
                                            Icons.delete,
                                            color: AppColors.error,
                                          ),
                                          // the method which is called
                                          // when button is pressed
                                          onPressed: () {
                                            _showDialog(
                                              data.MyAds[index].id,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                      child: Text(
                                        data.MyAds[index].cost.toString(),
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
                                            data.MyAds[index].address
                                                .toString(),
                                            style: TextStyle(fontSize: 10.sp),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AdsDetail(
                                                          title: data
                                                              .MyAds[index]
                                                              .title
                                                              .toString(),
                                                          description: data
                                                              .MyAds[index]
                                                              .description
                                                              .toString(),
                                                          houseType: data
                                                              .MyAds[index]
                                                              .houseType
                                                              .toString(),
                                                          cost: data
                                                              .MyAds[index].cost
                                                              .toString(),
                                                          costTayp: data
                                                              .MyAds[index]
                                                              .costType
                                                              .toString(),
                                                          countRoom: data
                                                              .MyAds[index]
                                                              .roomCount
                                                              .toString(),
                                                          countPeople: data
                                                              .MyAds[index]
                                                              .roommateCount
                                                              .toString(),
                                                          region: data
                                                              .MyAds[index]
                                                              .region
                                                              ?.name
                                                              .toString(),
                                                          district: data
                                                              .MyAds[index]
                                                              .district
                                                              ?.name
                                                              .toString(),
                                                          univer: data
                                                              .MyAds[index]
                                                              .university
                                                              ?.name
                                                              .toString(),
                                                          facultet: data
                                                              .MyAds[index]
                                                              .faculty
                                                              ?.name
                                                              .toString(),
                                                          liveWithOwner: data
                                                              .MyAds[index]
                                                              .liveWithOwner
                                                              .toString(),
                                                          subway: data
                                                              .MyAds[index]
                                                              .subway
                                                              .toString(),
                                                          favorite: data
                                                              .MyAds[index]
                                                              .favorite
                                                              .toString(),
                                                          id: data
                                                              .MyAds[index].id
                                                              .toString(),
                                                          type: data
                                                              .MyAds[index].type
                                                              .toString(),
                                                          userId: data
                                                              .MyAds[index]
                                                              .userId!,
                                                          userFullName: data
                                                              .MyAds[index]
                                                              .userFullName,
                                                          chatApproved: data
                                                              .MyAds[index]
                                                              .chatApproved!,
                                                        )));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.w, 0, 8.w, 0),
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

  void _showDialog(int? adsId) {
    // flutter defined function
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("E’lonni o’chirish "),
            actions: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.w),
                    child: Text(
                        "Ushbu e’lonni o’chirishga ishonchingiz komilmi ? "),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130.w,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: Colors.blue)),
                          ),
                          child: Text(
                            "Bekor qilish",
                            style: TextStyle(
                                color: AppColors.backgroundWhite,
                                fontSize: 18.sp),
                          ).tr(),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 130.w,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            await DeleteMyAds().DeleteAds(id: adsId);
                            // await Data();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: Colors.red)),
                          ),
                          child: Text(
                            "O’chirish",
                            style: TextStyle(
                                color: AppColors.backgroundWhite,
                                fontSize: 18.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }
}
