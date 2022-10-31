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

class AdsUsers extends StatefulWidget {
  const AdsUsers({Key? key}) : super(key: key);

  @override
  State<AdsUsers> createState() => _AdsUsersState();
}

class _AdsUsersState extends State<AdsUsers> {
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
      // '0',
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController? _tabController;
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(155),
          child: AppBar(
            centerTitle: true,
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
              child: const Text(
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
                          const Icon(
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
                              // data.isCourse = false;
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
                // Tab(
                //   text: tr("Ijaraga sherik kerak"),
                // )
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
                if (!data.isChanded) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.Ads.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdsDetail(
                                  utileHotWater: data.Ads[index].utilityHotWater.toString(),
                                  utileElictricity: data.Ads[index].utilityElectricity.toString(),
                                  utileGaz: data.Ads[index].unilityGaz.toString(),
                                  utileTrash: data.Ads[index].utilityTrash.toString(),
                                  utileColdWater: data.Ads[index].utilityColdWater.toString(),
                                  title: data.Ads[index].title.toString(),
                                  description:
                                      data.Ads[index].description.toString(),
                                  houseType:
                                      data.Ads[index].houseType.toString(),
                                  cost: data.Ads[index].cost.toString(),
                                  costTayp: data.Ads[index].costType.toString(),
                                  countRoom:
                                      data.Ads[index].roomCount.toString(),
                                  countPeople:
                                      data.Ads[index].roommateCount.toString(),
                                  region:
                                      data.Ads[index].region?.name.toString(),
                                  district:
                                      data.Ads[index].district?.name.toString(),

                                  // facultet: data.Ads[index]
                                  //     .faculty?.name
                                  //     .toString(),
                                  liveWithOwner:
                                      data.Ads[index].liveWithOwner.toString(),
                                  subway: data.Ads[index].subway.toString(),
                                  favorite: data.Ads[index].favorite.toString(),
                                  id: data.Ads[index].id.toString(),
                                  type: data.Ads[index].type.toString(),
                                  userId: data.Ads[index].userId,
                                  userFullName:
                                      data.Ads[index].userFullName.toString(),
                                  chatApproved: data.Ads[index].chatApproved,
                                  phoneNumberShow: data
                                      .Ads[index].phoneNumberShow
                                      .toString(),
                                  phoneNumber:
                                      data.Ads[index].phoneNumber.toString(),
                                  stay_university:
                                      data.Ads[index].stayUniversity.toString(),
                                  stay_region:
                                      data.Ads[index].stayRegion?.toString(),
                                  roommate_count:
                                      data.Ads[index].roommateCount.toString(),
                                  roommate_gender:
                                      data.Ads[index].roommateGender.toString(),
                                  address: data.Ads[index].address.toString(),
                                  floorsCount:
                                      data.Ads[index].floorsCount.toString(),
                                  inFloor: data.Ads[index].inFloor.toString(),
                                  utility_bills:
                                      data.Ads[index].utilityBills.toString(),
                                  rentType: data.Ads[index].rentType.toString(),
                                  comfort: data.Ads[index].comfort.toString(),
                                  // data.Ads[index].comfort,
                                  createData:
                                      data.Ads[index].createdAt.toString(),
                                  Image: data.Ads[index].images ?? [],
                                  locations:
                                      data.Ads[index].location.toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 324.w,
                            height: 358.h,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.only(
                                //     bottomLeft: Radius.circular(6.r), bottomRight: Radius.circular(6.r)),
                                borderRadius: BorderRadius.circular(6.r),
                                color: AppColors.secondBackgroud),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    // ... List.generate(data.Ads[index].images!.length, (index1) {
                                    //   return
                                    data.Ads[index].images!.isNotEmpty
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                "http://164.68.114.231:8081/roommate/backend/web/uploads/image/${data.Ads[index].images!.first.image.toString()}",
                                            placeholder: (context, url) => const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                                      'assets/images/notImage.png',
                                                    ),
                                            width: 327.w,
                                            height: 235.h,
                                            // fit: BoxFit.cover,
                                            imageBuilder: (context,
                                                    imageProvider) =>
                                                Container(
                                                    decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  6.r),
                                                          topRight:
                                                              Radius.circular(
                                                                  6.r)),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    // colorFilter:,
                                                    // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                                  ),
                                                )))

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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              // width: 80.w,
                                              height: 24.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2.r),
                                                color: AppColors.iconColor,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  data.Ads[index].createdAt!
                                                      .replaceRange(
                                                          data
                                                                  .Ads[index]
                                                                  .createdAt!
                                                                  .length -
                                                              3,
                                                          data
                                                              .Ads[index]
                                                              .createdAt!
                                                              .length,
                                                          ''),
                                                  // '${data.Ads[index].id.toString()}',
                                                  // "${data.Ads[index].createdAt!.split(':').removeAt(2)}",
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .backgroundWhite),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.w, 0, 8.w, 0),
                                              child: FavoriteButton(
                                                isFavorite: data.isChanded
                                                    ? (data.Ads[index]
                                                                .favorite ==
                                                            '0'
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
                                                    FavoriteChange()
                                                        .Favoritefetch(
                                                      id: data.isChanded
                                                          ? data.Ads[index].id
                                                              .toString()
                                                          : data
                                                              .AdsForZero[index]
                                                              .id
                                                              .toString(),
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // })
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.w, 0, 8.w, 0),
                                            child: SizedBox(
                                              // width:MediaQuery.of(context).size.width -150.w,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '${data.Ads[index].cost.toString()} ${data.Ads[index].costType.toString() == 1 ? "So'm" : 'USD'}/',
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.mainColor,
                                                        fontSize: 24.sp),
                                                  ),
                                                  Text(
                                                      '${data.Ads[index].costPeriod.toString() == '1' ? 'Kuniga' : data.Ads[index].costPeriod.toString() == '2' ? 'Oyiga' : 'Uzoq muddatga'}',style: TextStyle(color: AppColors.mainColor),),
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
                                            padding: const EdgeInsets.all(6.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  150.w,
                                              child: Text(
                                                data.isChanded
                                                    ? data.Ads[index].title
                                                        .toString()
                                                    : data
                                                        .AdsForZero[index].title
                                                        .toString(),
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: AppColors.mainColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.w, 0, 8.w, 0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  150.w,
                                              child: Text(
                                                data.isChanded
                                                    ? data.Ads[index].address
                                                        .toString()
                                                        .toString()
                                                    : data.AdsForZero[index]
                                                        .address
                                                        .toString(),
                                                style:
                                                    TextStyle(fontSize: 10.sp),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // )
                                    ],
                                  ),
                                )
                              ],
                            ),
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
