import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Ijarachipage/filtr.dart';
import '../../core/const/consts.dart';
import '../../cubit/aut_cubit.dart';
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
      // '0',
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
      length: 2,
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
                                          builder: (context) =>
                                              const FiltrPage()))
                                  .then((value) => data.isChanded);
                              data.isRegion = false;
                              data.isDistricts = false;
                              data.isUniver = false;
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
                  child: const Text("Ijarachi kerak").tr(),
                ),
                Tab(
                  child: const Text("Ijaraga sherik kerak").tr(),
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
                if (!data.isChanded) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (data.Ads.isEmpty) {
                  return const Center(
                    child: Text("Ma'lumot yo'q"),
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
                                  context.read<AutCubit>().selectedLang.index == 1 ? data.Ads[index].region?.name.toString():data.Ads[index].region?.nameRu.toString(),
                                  district:
                                  context.read<AutCubit>().selectedLang.index == 1 ? data.Ads[index].district?.name.toString():data.Ads[index].district?.nameRu.toString(),
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
                                  utileHotWater: data.Ads[index].utilityHotWater
                                      .toString(),
                                  utileElictricity: data
                                      .Ads[index].utilityElectricity
                                      .toString(),
                                  utileGaz:
                                      data.Ads[index].unilityGaz.toString(),
                                  utileTrash:
                                      data.Ads[index].utilityTrash.toString(),
                                  utileColdWater: data
                                      .Ads[index].utilityColdWater
                                      .toString(),
                                  costPeriod:
                                      data.Ads[index].costPeriod.toString(),
                                  haveHome:
                                      data.Ads[index].haveLivingHome.toString(),
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
                                                "${Const.baseUrl}uploads/image/${data.Ads[index].images!.first.image.toString()}",
                                            placeholder: (context, url) =>
                                                const Center(
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
                                            Hive.box('id').get('id').toString() != data.Ads[index].userId.toString() ?Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.w, 0, 8.w, 0),
                                              child: FavoriteButton(
                                                isFavorite: (data
                                                            .Ads[index].favorite
                                                            .toString() ==
                                                        '0'
                                                    ? false
                                                    : true),
                                                iconSize: 35.0,
                                                valueChanged: (_isFavorite) {
                                                  // print('Is Favorite $_isFavorite)');
                                                  setState(() {
                                                    FavoriteChange()
                                                        .Favoritefetch(
                                                      id: data.Ads[index].id
                                                          .toString(),
                                                    );
                                                  });
                                                },
                                              ),
                                            ):Container(),
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
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${data.Ads[index].cost.toString()} ${data.Ads[index].costType.toString() == '1' ? "So'm" : 'USD'}/',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.mainColor,
                                                      fontSize: 24.sp),
                                                ),
                                                Text(
                                                  data.Ads[index].costPeriod
                                                              .toString() ==
                                                          '1'
                                                      ? tr('Kuniga')
                                                      : data.Ads[index]
                                                                  .costPeriod
                                                                  .toString() ==
                                                              '2'
                                                          ? tr('Oyiga')
                                                          : tr('Kishi boshiga'),
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                              ],
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
            Consumer<RegionProvider>(
              builder: (_, data, __) {
                if (!data.isChanded) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (data.AdsForStudent.isEmpty) {
                  return const Center(
                    child: Text("Ma'lumot yo'q"),
                  );
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.AdsForStudent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdsDetail(
                                          title: data.AdsForStudent[index].title
                                              .toString(),
                                          description: data
                                              .AdsForStudent[index].description
                                              .toString(),
                                          houseType: data
                                              .AdsForStudent[index].houseType
                                              .toString(),
                                          cost: data.AdsForStudent[index].cost
                                              .toString(),
                                          costTayp: data
                                              .AdsForStudent[index].costType
                                              .toString(),
                                          countRoom: data
                                              .AdsForStudent[index].roomCount
                                              .toString(),
                                          countPeople: data.AdsForStudent[index]
                                              .roommateCount
                                              .toString(),
                                          liveWithOwner: data
                                              .AdsForStudent[index]
                                              .liveWithOwner
                                              .toString(),
                                          subway: data
                                              .AdsForStudent[index].subway
                                              .toString(),
                                          favorite: data
                                              .AdsForStudent[index].favorite
                                              .toString(),
                                          id: data.AdsForStudent[index].id
                                              .toString(),
                                          type: data.AdsForStudent[index].type
                                              .toString(),
                                          userId:
                                              data.AdsForStudent[index].userId,
                                          userFullName: data
                                              .AdsForStudent[index].userFullName
                                              .toString(),
                                          chatApproved: data
                                              .AdsForStudent[index]
                                              .chatApproved,
                                          phoneNumber: data
                                              .AdsForStudent[index].phoneNumber
                                              .toString(),
                                          phoneNumberShow: data
                                              .AdsForStudent[index]
                                              .phoneNumberShow
                                              .toString(),
                                          floorsCount: data
                                              .AdsForStudent[index].floorsCount
                                              .toString(),
                                          district: data.AdsForStudent[index]
                                              .district?.name
                                              .toString(),
                                          stay_region: data.AdsForStudent[index].stayRegion?.name
                                              .toString(),
                                          stay_university: data
                                              .AdsForStudent[index]
                                              .stayUniversity?.name
                                              .toString(),
                                          region: data
                                              .AdsForStudent[index].region?.name
                                              .toString(),
                                          rentType: data
                                              .AdsForStudent[index].rentType
                                              .toString(),
                                          utility_bills: data
                                              .AdsForStudent[index].utilityBills
                                              .toString(),
                                          createData: data
                                              .AdsForStudent[index].createdAt,
                                          comfort:
                                              data.AdsForStudent[index].comfort,
                                          // data.AdsForStudent[index].comfort,
                                          inFloor: data
                                              .AdsForStudent[index].inFloor
                                              .toString(),
                                          roommate_count: data
                                              .AdsForStudent[index]
                                              .roommateCount
                                              .toString(),
                                          address:
                                              data.AdsForStudent[index].address,
                                          roommate_gender: data
                                              .AdsForStudent[index]
                                              .roommateGender
                                              .toString(),
                                          Image:
                                              data.AdsForStudent[index].images,
                                          locations: data
                                              .AdsForStudent[index].location
                                              .toString(),
                                          utileTrash: data
                                              .AdsForStudent[index].utilityTrash
                                              .toString(),
                                          utileColdWater: data
                                              .AdsForStudent[index]
                                              .utilityColdWater
                                              .toString(),
                                          utileElictricity: data
                                              .AdsForStudent[index]
                                              .utilityElectricity
                                              .toString(),
                                          utileGaz: data
                                              .AdsForStudent[index].unilityGaz
                                              .toString(),
                                          utileHotWater: data
                                              .AdsForStudent[index]
                                              .utilityHotWater
                                              .toString(),
                                          costPeriod: data
                                              .AdsForStudent[index].costPeriod
                                              .toString(),
                                          haveHome: data.AdsForStudent[index]
                                              .haveLivingHome

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
                                    data.AdsForStudent[index].images!.isNotEmpty
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                "${Const.baseUrl}uploads/image/${data.AdsForStudent[index].images!.first.image.toString()}",
                                            placeholder: (context, url) =>
                                                const Center(
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
                                                  BorderRadius.circular(2.r),
                                              color: AppColors.iconColor,
                                            ),
                                            child: Center(
                                                child: Text(
                                              data.AdsForStudent[index]
                                                  .createdAt!
                                                  .replaceRange(
                                                      data
                                                              .AdsForStudent[
                                                                  index]
                                                              .createdAt!
                                                              .length -
                                                          3,
                                                      data.AdsForStudent[index]
                                                          .createdAt!.length,
                                                      ''),
                                              // "21 Sentabr,14:01",
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .backgroundWhite),
                                            )),
                                          ),
                                          Hive.box('id').get('id').toString() != data.AdsForStudent[index].userId.toString() ? Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.w, 0, 8.w, 0),
                                              child: FavoriteButton(
                                                isFavorite:
                                                    data.AdsForStudent[index]
                                                                .favorite ==
                                                            '0'
                                                        ? false
                                                        : true,
                                                iconSize: 35.0,
                                                valueChanged: (_isFavorite) {
                                                  // print('Is Favorite $_isFavorite)');
                                                  setState(() {
                                                    FavoriteChange()
                                                        .Favoritefetch(
                                                            id: data
                                                                .AdsForStudent[
                                                                    index]
                                                                .id
                                                                .toString());
                                                  });
                                                },
                                              )):Container()
                                        ],
                                      ),
                                    ))
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
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${data.AdsForStudent[index].cost.toString()} ${data.AdsForStudent[index].costType.toString() == 1 ? "So'm" : 'USD'}/',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.mainColor,
                                                      fontSize: 24.sp),
                                                ),
                                                Text(
                                                  data.AdsForStudent[index]
                                                              .costPeriod
                                                              .toString() ==
                                                          '1'
                                                      ? tr('Kuniga')
                                                      : data.AdsForStudent[index]
                                                                  .costPeriod
                                                                  .toString() ==
                                                              '2'
                                                          ? tr('Oyiga')
                                                          : tr('Kishi boshiga'),
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                              ],
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
                                                    ? data.AdsForStudent[index]
                                                        .title
                                                        .toString()
                                                    : 'Studentlar uchun',
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceBetween,
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
                                                data.AdsForStudent[index]
                                                    .address
                                                    .toString(),
                                                style:
                                                    TextStyle(fontSize: 10.sp),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
