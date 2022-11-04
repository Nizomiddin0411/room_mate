import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/Update_edits.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/ads_edit.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/ads_page_edit.dart';
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
        centerTitle: true,
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
      body: Consumer<FavoriteProvider>(
        builder: (_, data, __) {
          if (!data.isMyAds) {
            return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
          if (data.MyAds.isEmpty) {
            return Center(
              child: Text("Ma'lumot yo'q"),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.MyAds.length,
                    itemBuilder: (context, index) {
                      print(data.MyAds[index].id.toString() + "qqq");

                      return Padding(
                        padding: EdgeInsets.all(18.0.w),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  print(data.MyAds[index].universityId
                                          .toString() +
                                      'aaaaaaaa');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdsDetail(
                                                title: data.MyAds[index].title
                                                    .toString(),
                                                description: data
                                                    .MyAds[index].description
                                                    .toString(),
                                                houseType: data
                                                    .MyAds[index].houseType
                                                    .toString(),
                                                cost: data.MyAds[index].cost
                                                    .toString(),
                                                costTayp: data
                                                    .MyAds[index].costType
                                                    .toString(),
                                                countRoom: data
                                                    .MyAds[index].roomCount
                                                    .toString(),
                                                countPeople: data
                                                    .MyAds[index].roommateCount
                                                    .toString(),
                                                // region: data
                                                //     .MyAds[index].region?.name
                                                //     .toString(),
                                                // district: data
                                                //     .MyAds[index].district?.name
                                                //     .toString(),
                                                // univer: data.MyAds[index]
                                                //     .university?.name
                                                //     .toString(),
                                                // facultet: data
                                                //     .MyAds[index].faculty?.name
                                                //     .toString(),
                                                liveWithOwner: data
                                                    .MyAds[index].liveWithOwner
                                                    .toString(),
                                                subway: data.MyAds[index].subway
                                                    .toString(),
                                                favorite: data
                                                    .MyAds[index].favorite
                                                    .toString(),
                                                id: data.MyAds[index].id
                                                    .toString(),
                                                type: data.MyAds[index].type
                                                    .toString(),
                                                userId:
                                                    data.MyAds[index].userId,
                                                userFullName: data
                                                    .MyAds[index].userFullName
                                                    .toString(),
                                                chatApproved: data
                                                    .MyAds[index].chatApproved,
                                                phoneNumber: data
                                                    .MyAds[index].phoneNumber
                                                    .toString(),
                                                phoneNumberShow: data
                                                    .MyAds[index]
                                                    .phoneNumberShow
                                                    .toString(),
                                                floorsCount: data
                                                    .MyAds[index].floorsCount
                                                    .toString(),
                                                district: data
                                                    .MyAds[index].district?.name
                                                    .toString(),
                                                stay_region: data.MyAds[index]
                                                    .stayRegion?.name
                                                    .toString(),
                                                stay_university: data
                                                    .MyAds[index].stayUniversity
                                                    .toString(),
                                                region: data
                                                    .MyAds[index].region?.name
                                                    .toString(),
                                                rentType: data
                                                    .MyAds[index].rentType
                                                    .toString(),
                                                utility_bills: data
                                                    .MyAds[index].utilityBills
                                                    .toString(),
                                                createData: data
                                                    .MyAds[index].createdAt
                                                    .toString(),
                                                comfort: '2',
                                                // data.MyAds[index].comfort,
                                                inFloor: data
                                                    .MyAds[index].inFloor
                                                    .toString(),
                                                roommate_count: data
                                                    .MyAds[index].roommateCount
                                                    .toString(),
                                                address: data
                                                    .MyAds[index].address
                                                    .toString(),
                                                roommate_gender: data
                                                    .MyAds[index].roommateGender
                                                    .toString(),
                                                Image: data.MyAds[index].images,
                                                locations:
                                                    data.MyAds[index].location,
                                                utileTrash: data
                                                    .MyAds[index].utilityTrash
                                                    .toString(),
                                                utileColdWater: data
                                                    .MyAds[index]
                                                    .utilityColdWater
                                                    .toString(),
                                                utileElictricity: data
                                                    .MyAds[index]
                                                    .utilityElectricity
                                                    .toString(),
                                                utileGaz: data
                                                    .MyAds[index].unilityGaz
                                                    .toString(),
                                                utileHotWater: data.MyAds[index]
                                                    .utilityHotWater
                                                    .toString(),
                                                costPeriod: data
                                                    .MyAds[index].costPeriod
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          data.MyAds[index].images!.isNotEmpty
                                              ? CachedNetworkImage(
                                                  imageUrl:
                                                      "http://164.68.114.231:8081/roommate/backend/web/uploads/image/${data.MyAds[index].images!.first.image.toString()}",
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
                                              // : data.MyAds[index].images![0]
                                              // .isEmpty
                                              // ? Image.asset(
                                              //     'assets/images/notImage.png',
                                              //     width: 324.w,
                                              //     height: 235.h,
                                              //     fit: BoxFit.cover,
                                              //   )
                                              : Image.asset(
                                                  'assets/images/notImage.png',
                                                  width: 324.w,
                                                  height: 235.h,
                                                  fit: BoxFit.cover,
                                                ),
                                          Positioned(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 112.w,
                                                    height: 24.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.r),
                                                      color:
                                                          AppColors.iconColor,
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      data.MyAds[index]
                                                          .createdAt!
                                                          .replaceRange(
                                                              data
                                                                      .MyAds[
                                                                          index]
                                                                      .createdAt!
                                                                      .length -
                                                                  3,
                                                              data
                                                                  .MyAds[index]
                                                                  .createdAt!
                                                                  .length,
                                                              ''),
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .backgroundWhite),
                                                    )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            1.w, 0, 8.w, 0),
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () =>
                                                              Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => data
                                                                          .MyAds[
                                                                              index]
                                                                          .type
                                                                          .toString() ==
                                                                      '2'
                                                                  ? AdspageEdit(
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .title
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .description
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .houseType
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .cost
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .costType
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .roomCount
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .roommateCount
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .liveWithOwner
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .subway
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .favorite
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .type
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .userId,
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .phoneNumber
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .comfort
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .inFloor
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .roommateCount
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .address
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .roommateGender
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .location,
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .images,
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .universityId
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .districtId
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .rentType
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .floorsCount
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .costPeriod
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .genderMatter
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .universityIdMatter
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .region!
                                                                          .name
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .district!
                                                                          .name
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .liveWithOwner
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .utilityElectricity
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .unilityGaz
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .utilityHotWater
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .utilityColdWater
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .utilityTrash
                                                                          .toString(),
                                                                      data
                                                                          .MyAds[
                                                                              index]
                                                                          .districtId
                                                                          .toString(),
                                                                    )
                                                                  : UpdateStudents(
                                                                      univername:
                                                                          "${data.MyAds[index].stayUniversity?.name.toString()}",
                                                                      cost_type:
                                                                          '${data.MyAds[index].costType}',
                                                                      howcountroom:
                                                                          '${data.MyAds[index].haveLivingHome}',
                                                                      cost_period:
                                                                          '${data.MyAds[index].costPeriod}',
                                                                      phone_number:
                                                                          '${data.MyAds[index].phoneNumber}',
                                                                      description:
                                                                          '${data.MyAds[index].description}',
                                                                      location:
                                                                          '${data.MyAds[index].location}',
                                                                      have_living_home:
                                                                          '${data.MyAds[index].haveLivingHome}',
                                                                      stay_region:
                                                                          '${data.MyAds[index].stayRegion?.name.toString()}',
                                                                      live_with_owner:
                                                                          '${data.MyAds[index].liveWithOwner}',
                                                                      room_count:
                                                                          '${data.MyAds[index].roomCount}',
                                                                      stay_region_matter:
                                                                          '${data.MyAds[index].stayRegionMatter}',
                                                                      stay_university_id:
                                                                          '${data.MyAds[index].stayUniversityId}',
                                                                      phone_number_show:
                                                                          '${data.MyAds[index].phoneNumberShow}',
                                                                      title:
                                                                          '${data.MyAds[index].title}',
                                                                      district:
                                                                          '${data.MyAds[index].district?.name.toString()}',
                                                                      subway:
                                                                          '${data.MyAds[index].subway}',
                                                                      roommate_gender:
                                                                          '${data.MyAds[index].roommateGender}',
                                                                      floors_count:
                                                                          '${data.MyAds[index].floorsCount}',
                                                                      stay_university_matter:
                                                                          '${data.MyAds[index].stayRegionMatter}',
                                                                      address:
                                                                          '${data.MyAds[index].address}',
                                                                      roommate_count:
                                                                          '${data.MyAds[index].roommateCount}',
                                                                      utility_bills:
                                                                          '${data.MyAds[index].utilityBills}',
                                                                      house_type:
                                                                          '${data.MyAds[index].houseType}',
                                                                      cost:
                                                                          '${data.MyAds[index].cost}',
                                                                      comfort:
                                                                          '${data.MyAds[index].comfort}',
                                                                      renttype:
                                                                          '${data.MyAds[index].rentType}',
                                                                      id: '${data.MyAds[index].id}',
                                                                      images:
                                                                          '${data.MyAds[index].images}',
                                                                      stay_region_id:
                                                                          '${data.MyAds[index].stayRegionId}',
                                                                    ),
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 32.w,
                                                            height: 32.h,
                                                            color: AppColors
                                                                .backgroundWhite
                                                                .withOpacity(
                                                                    0.7),
                                                            child: const Center(
                                                              child: Icon(
                                                                Icons.edit,
                                                                color: AppColors
                                                                    .mainColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        Container(
                                                          width: 32.w,
                                                          height: 32.h,
                                                          color: AppColors
                                                              .backgroundWhite
                                                              .withOpacity(0.7),
                                                          child: InkWell(
                                                            // iconSize: 22.0.sp,
                                                            child: const Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: AppColors
                                                                  .error,
                                                            ),
                                                            // the method which is called
                                                            // when button is pressed
                                                            onTap: () async {
                                                              _showDialog(
                                                                adsId: data
                                                                    .MyAds[
                                                                        index]
                                                                    .id,
                                                              );
                                                              // await data.getMyAds();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(6.0.w),
                                            child: Text(
                                              data.MyAds[index].title
                                                  .toString(),
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
                                              '${data.MyAds[index].cost.toString()} ${data.MyAds[index].costType.toString() == '1' ? "So'm" : "USD"}/',
                                              style: TextStyle(
                                                  color: AppColors.mainColor,
                                                  fontSize: 24.sp),
                                            ),
                                            Text(
                                              '${data.MyAds[index].costPeriod.toString() == '1' ? 'Kuniga' : data.MyAds[index].costPeriod.toString() == '2' ? 'Oyiga' : 'Uzoq muddatga'}',
                                              style: TextStyle(
                                                  color: AppColors.mainColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: AppColors.mainColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.w, 0, 8.w, 0),
                                            child: Text(
                                              data.MyAds[index].address
                                                  .toString(),
                                              style: TextStyle(fontSize: 12.sp),
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
              ],
            ),
          );
        },
      ),
    );
  }

  void _showDialog({int? adsId}) {
    // flutter defined function
    // final provider = Provider.of<FavoriteProvider>(context, listen: false).getMyAds();
    final provider = context.read<FavoriteProvider>();
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
                            await provider.getMyAds();
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
