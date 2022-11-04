import 'package:cached_network_image/cached_network_image.dart';
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
    // Provider.of<FavoriteProvider>(context, listen: false).getImage().asStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 68.w),
            child: const Text(
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
          if (!data.isFavorite) {
            return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
          if (data.Like.isEmpty) {
            return Center(
              child: const Text("Ma'lumot yo'q"),
            );
          }
          return SingleChildScrollView(
            child: Column(children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.Like.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdsDetail(
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
                                              countPeople: data
                                                  .Like[index].roommateCount
                                                  .toString(),
                                              liveWithOwner: data
                                                  .Like[index].liveWithOwner
                                                  .toString(),
                                              subway: data.Like[index].subway
                                                  .toString(),
                                              favorite: data
                                                  .Like[index].favorite
                                                  .toString(),
                                              id: data.Like[index].id
                                                  .toString(),
                                              type: data.Like[index].type
                                                  .toString(),
                                              userId: data.Like[index].userId,
                                              userFullName: data
                                                  .Like[index].userFullName
                                                  .toString(),
                                              chatApproved:
                                                  data.Like[index].chatApproved,
                                              phoneNumber: data
                                                  .Like[index].phoneNumber
                                                  .toString(),
                                              phoneNumberShow: data
                                                  .Like[index].phoneNumberShow
                                                  .toString(),
                                              floorsCount: data
                                                  .Like[index].floorsCount
                                                  .toString(),
                                              district: data
                                                  .Like[index].district?.name
                                                  .toString(),
                                              stay_region: data
                                                  .Like[index].stayRegion?.name
                                                  .toString(),
                                              stay_university: data
                                                  .Like[index].stayUniversity
                                                  .toString(),
                                              region: data
                                                  .Like[index].region?.name
                                                  .toString(),
                                              rentType: data
                                                  .Like[index].rentType
                                                  .toString(),
                                              utility_bills: data
                                                  .Like[index].utilityBills
                                                  .toString(),
                                              createData: data
                                                  .Like[index].createdAt
                                                  .toString(),
                                              comfort: data.Like[index].comfort
                                                  .toString(),
                                              // data.Like[index].comfort,
                                              inFloor: data.Like[index].inFloor
                                                  .toString(),
                                              roommate_count: data
                                                  .Like[index].roommateCount
                                                  .toString(),
                                              address: data.Like[index].address
                                                  .toString(),
                                              roommate_gender: data
                                                  .Like[index].roommateGender
                                                  .toString(),
                                              Image: data.Like[index].images,
                                              locations:
                                                  data.Like[index].location,
                                              utileTrash: data
                                                  .Like[index].utilityTrash
                                                  .toString(),
                                              utileColdWater: data
                                                  .Like[index].utilityColdWater
                                                  .toString(),
                                              utileElictricity: data.Like[index]
                                                  .utilityElectricity
                                                  .toString(),
                                              utileGaz: data
                                                  .Like[index].unilityGaz
                                                  .toString(),
                                              utileHotWater: data
                                                  .Like[index].utilityHotWater
                                                  .toString(),
                                              costPeriod: data
                                                  .Like[index].costPeriod
                                                  .toString(),
                                            )));
                              },
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
                                      children: [
                                        data.Like[index].images!.isNotEmpty
                                            ? CachedNetworkImage(
                                                imageUrl:
                                                    "http://164.68.114.231:8081/roommate/backend/web/uploads/image/${data.Like[index].images!.first.image.toString()}",
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  'assets/images/notImage.png',
                                                ),
                                                width: 324.w,
                                                height: 235.h,
                                                fit: BoxFit.cover,
                                              )
                                            : data.Like[index].images!.isEmpty
                                                ? Image.asset(
                                                    'assets/images/notImage.png',
                                                    width: 324.w,
                                                    height: 235.h,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    'assets/images/notImage.png',
                                                    width: 324.w,
                                                    height: 235.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                        Positioned(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 112.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.r),
                                                  color: AppColors.iconColor,
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  data.Like[index].createdAt!
                                                      .replaceRange(
                                                          data
                                                                  .Like[index]
                                                                  .createdAt!
                                                                  .length -
                                                              3,
                                                          data
                                                              .Like[index]
                                                              .createdAt!
                                                              .length,
                                                          ''),
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .backgroundWhite),
                                                )),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      1.w, 0, 8.w, 0),
                                                  child: FavoriteButton(
                                                    isFavorite: data.Like[index]
                                                                .favorite
                                                                .toString() ==
                                                            '0'
                                                        ? false
                                                        : true,
                                                    iconSize: 35.0,
                                                    valueChanged:
                                                        (_isFavorite) async {
                                                      await FavoriteChange()
                                                          .Favoritefetch(
                                                              id: data
                                                                  .Like[index]
                                                                  .id
                                                                  .toString());
                                                      // data.isFavorite = !data.isFavorite;
                                                      await data.getLike();
                                                    },
                                                  ))
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            data.Like[index].title.toString(),
                                            style: TextStyle(fontSize: 18.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${data.Like[index].cost} ${data.Like[index].costType.toString() == '1' ? "So'm" : "USD"}/',
                                            style: TextStyle(
                                                color: AppColors.mainColor,
                                                fontSize: 24.sp),
                                          ),
                                          Text(
                                            data.Like[index].costPeriod
                                                        .toString() ==
                                                    '1'
                                                ? 'Kuniga'
                                                : data.Like[index].costPeriod
                                                            .toString() ==
                                                        '2'
                                                    ? 'Oyiga'
                                                    : 'Uzoq muddatga',
                                            style: const TextStyle(
                                                color: AppColors.mainColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              8.w, 0, 8.w, 0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: AppColors.mainColor,
                                              ),
                                              Text(
                                                "${data.Like[index].address}",
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18.h,
                                    )
                                  ],
                                ),
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
