import 'package:easy_localization/easy_localization.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import '../../provider/favorite_provider.dart';
import '../../services/post_change_favoritr_service.dart';
import '../Ads_Detail/ads_detail.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {

  @override
  void initState() {
    Provider.of<FavoriteProvider>(context, listen: false).getLike().asStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 68.w),
            child: Text(
              "Sevimlilar",
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
        body: Consumer<FavoriteProvider>(builder: (_, data, __) {
          return SingleChildScrollView(
            child: Column(
                children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.Like.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 324.w,
                              height: 105.h,
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
                                          '${data.Like[index].title} !!!',
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(1.w, 0, 8.w, 0),
                                          child: FavoriteButton(
                                            isFavorite: data.Like[index].favorite
                                                        .toString() ==
                                                    '0'
                                                ? false
                                                : true,
                                            iconSize: 35.0,
                                            valueChanged: (_isFavorite) async{


                                              await FavoriteChange().Favoritefetch(
                                                  id: data.Like[index].id
                                                      .toString());
                                              // data.isFavorite = !data.isFavorite;
                                             await data.getLike();
                                            },
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                    child: Text(
                                      '${data.Like[index].cost}',
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
                                          "${data.Like[index].address}",
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
                                                        title: data.Like[index].title
                                                            .toString(),
                                                        description: data
                                                            .Like[index].description
                                                            .toString(),
                                                        houseType: data
                                                            .Like[index].houseType
                                                            .toString(),
                                                        cost: data.Like[index].cost
                                                            .toString(),
                                                        costTayp: data
                                                            .Like[index].costType
                                                            .toString(),
                                                        countRoom: data
                                                            .Like[index].roomCount
                                                            .toString(),
                                                        countPeople: data.Like[index]
                                                            .roommateCount
                                                            .toString(),
                                                        region: data
                                                            .Like[index].region?.name
                                                            .toString(),
                                                        district: data.Like[index]
                                                            .district?.name
                                                            .toString(),
                                                        univer: data.Like[index]
                                                            .university?.name
                                                            .toString(),
                                                        facultet: data.Like[index]
                                                            .faculty?.name
                                                            .toString(),
                                                        liveWithOwner: data
                                                            .Like[index]
                                                            .liveWithOwner
                                                            .toString(),
                                                        subway: data
                                                            .Like[index].subway
                                                            .toString(),
                                                        favorite: data
                                                            .Like[index].favorite
                                                            .toString(),
                                                        id: data.Like[index].id
                                                            .toString(),
                                                        type: data.Like[index].type
                                                            .toString(),
                                                        userId: data.Like[index].userId!,
                                                        userFullName: data.Like[index].userFullName.toString(),
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
                          ],
                        ),
                      ),
                    );
                  }),
            ]),
          );
        }));
  }
}
