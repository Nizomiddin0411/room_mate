import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/get_all_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../chat/chat_page.dart';
import '../../services/post_add_chat_permit.dart';
import '../../services/post_change_favoritr_service.dart';
import '../Google_map/map_for_ads_detail.dart';

class AdsDetail extends StatefulWidget {
  String? phoneNumber;
  String? comfort;
  String? phoneNumberShow;
  String? rentType;
  String? title;
  String? description;
  String? cost;
  String? costTayp;
  String? houseType;
  String? countRoom;
  String? countPeople;
  String? region;
  String? stay_region;
  String? locations;
  String? stay_university;
  String? roommate_gender;
  String? roommate_count;
  String? address;
  String? liveWithOwner;
  String? subway;
  String? id;
  String? favorite;
  String? type;
  int? userId;
  String? userFullName;
  int? chatApproved;
  String? floorsCount;
  String? inFloor;
  String? district;
  String? utility_bills;
  String? utileElictricity;
  String? utileGaz;
  String? utileColdWater;
  String? utileHotWater;
  String? utileTrash;
  String? createData;
  String? hidePhone;
  List<dynamic>? Image;
  AdsDetail({
    Key? key,
    required this.utileElictricity,
    required this.utileGaz,
    required this.utileColdWater,
    required this.utileHotWater,
    required this.utileTrash,
    required this.locations,
    required this.Image,
    required this.roommate_count,
    required this.rentType,
    required this.utility_bills,
    required this.floorsCount,
    required this.inFloor,
    required this.roommate_gender,
    required this.stay_region,
    required this.stay_university,
    required this.phoneNumber,
    required this.phoneNumberShow,
    required this.title,
    required this.description,
    required this.cost,
    required this.costTayp,
    required this.houseType,
    required this.countRoom,
    required this.countPeople,
    required this.region,
    required this.district,
    required this.createData,
    required this.liveWithOwner,
    required this.subway,
    required this.id,
    required this.favorite,
    required this.type,
    required this.userId,
    required this.userFullName,
    required this.chatApproved,
    required this.address,
    required this.comfort,
  }) : super(key: key);

  @override
  State<AdsDetail> createState() => _AdsDetailState();
}

class _AdsDetailState extends State<AdsDetail> {
  int _correntPage = 0;
  late List<String> haveComfort = widget.comfort.toString().split(',');
  late List<int> haveInt = haveComfort.map(int.parse).toList();
  late List<String> comfort = [];

  String comfortList = '';
  String forUser = '';
  String forStudent = '';
  late List<String> user = [];
  late List<String> student = [];
  void isHaveComfort(List haveInt, listE) {
    for (int i in haveInt) {
      if (i == 1) {
        listE.add(tr('Wi - fi'));
      } else if (i == 2) {
        listE.add(tr('TV'));
      } else if (i == 3) {
        listE.add(tr('Muzlatgich'));
      } else if (i == 4) {
        listE.add(tr("Kir yuvish mashinasi"));
      } else if (i == 5) {
        listE.add(tr('Konditsioner'));
      } else if (i == 6) {
        listE.add(tr("Chang yutgich"));
      }
    }
  }

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHaveComfort(haveInt, comfort);
    comfortList = comfort.reduce((value, element) => value + ', ' + element);


    // usermap.map((key, value) => null)
    if (widget.utileElictricity.toString() == '1') {
      user.add(tr("Elektr energiya"));
    }if(widget.utileGaz.toString() == '1'){
      user.add(tr("Gaz"));
    }if(widget.utileColdWater.toString() == '1'){
      user.add(tr("Sovuq suv"));
    }if(widget.utileHotWater.toString() == '1'){
      user.add(tr("Issiq suv"));
    }if( widget.utileTrash.toString() == '1'){
      user.add(tr("Chiqindi"));
    }if(widget.utileElictricity.toString() == '2'){
      student.add(tr("Elektr energiya"));
    }if(widget.utileGaz.toString() == '2'){
      student.add(tr('Gaz'));
    }if(widget.utileHotWater.toString() == '2'){
      student.add(tr('Issiq suv'));
    }if(widget.utileColdWater.toString() == '2'){
      student.add(tr('Sovuq suv'));
    }if(widget.utileTrash.toString() == '2'){
      student.add(tr('Chiqindi'));
    }
    if(user.isNotEmpty) {
      forUser = user.reduce((value, element) => value + ', ' + element);
    }
    if(student.isNotEmpty) {
      forStudent = student.reduce((value, element) => value + ', ' + element);
    }
  }

  @override
  Widget build(BuildContext context) {
    String date = widget.createData!.split(':')[2];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundWhite,
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 65.w),
            child: const Text(
              'Batafsil',
              style: TextStyle(color: AppColors.mainColor),
            ).tr()),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.iconColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 254.h,
                  child: PageView.builder(
                      itemCount: images.length,

                      // controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _correntPage = index % images.length;
                        });
                      },
                      itemBuilder: (context, pagePosition) {
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Swiper(
                            // indicatorLayout: PageIndicatorLayout.,
                            pagination: SwiperPagination(),
                            itemCount: widget.Image!.length,
                            itemBuilder: (BuildContext context, int index1) {
                              return widget.Image!.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          "http://164.68.114.231:8081/roommate/backend/web/uploads/image/${widget.Image![index1].image.toString()}",
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/images/notImage.png',
                                      ),
                                      width: 324.w,
                                      height: 219.h,
                                      fit: BoxFit.cover,
                                    )
                                  // : widget.Image![index1].isEmpty
                                  //     ? Image.asset(
                                  //         'assets/images/notImage.png',
                                  //         width: 324.w,
                                  //         height: 219.h,
                                  //         fit: BoxFit.cover,
                                  //       )
                                  : Image.asset(
                                      'assets/images/notImage.png',
                                      width: 324.w,
                                      height: 235.h,
                                      fit: BoxFit.cover,
                                    );
                            },
                          ),
                        );
                      }),
                ),
                // Positioned(
                //   bottom: 20.h,
                //   left: 0,
                //   right: 0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: List.generate(images.length, (i) {
                //       return Container(
                //         margin: const EdgeInsets.symmetric(horizontal: 5),
                //         width: 10.w,
                //         height: 10.h,
                //         decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: _correntPage == i
                //                 ? AppColors.mainColor
                //                 : Colors.grey),
                //       );
                //     }).toList(),
                //   ),
                // ),
                Positioned(
                    top: 16.h,
                    left: 18.w,
                    right: 8.w,
                    child: Padding(
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
                            child: Center(
                                child: Text(
                              widget.createData!.replaceRange(
                                  widget.createData!.length - 3,
                                  widget.createData!.length,
                                  ''),
                              style: const TextStyle(
                                  color: AppColors.backgroundWhite),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(1.w, 0, 8.w, 0),
                            child: FavoriteButton(
                              isFavorite: widget.favorite.toString() == '0'
                                  ? false
                                  : true,
                              iconSize: 35.0,
                              valueChanged: (_isFavorite) {
                                // print('Is Favorite $_isFavorite)');
                                setState(() {
                                  FavoriteChange()
                                      .Favoritefetch(id: widget.id.toString());
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            Container(
              width: 324.w,
              height: 232.h,
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.r),
                    topRight: Radius.circular(6.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
                        child: Text(
                          '${widget.cost} ${widget.costTayp == '1' ? "So'm" : 'USD'}/${widget.rentType == '1' ? tr('Kunlik') : tr('Oylik')}',
                          style: TextStyle(
                              fontSize: 24.sp, color: AppColors.mainColor),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 150.w,
                        child: Text(
                          "${widget.title}",
                          style: TextStyle(fontSize: 18.sp),
                        )),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "${widget.address}",
                        style: TextStyle(fontSize: 10.sp),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      String lat =
                          widget.locations!.split(',').first.toString();
                      String long =
                          widget.locations!.split(',').last.toString();
                      lat = lat.split('(').last.toString();
                      long = long.split(')').first.toString();
                      // print(widget.locations);
                      // print(lat);
                      // print(long);
                      double Lat = double.parse(lat).toDouble();
                      double Long = double.parse(long).toDouble();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapDetail(
                                    location: widget.locations,
                                    long: Long,
                                    lat: Lat,
                                  )));
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          "Joylashuvni ko'rish",
                          style: TextStyle(color: AppColors.mainColor),
                        ).tr()
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      // widget.chatApproved == 1 ?
                      widget.type == '1'
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
                              child: InkWell(
                                onTap: () {
                                  print('${Hive.box('id').get('id')}');
                                  print(widget.userId);
                                  if (widget.chatApproved == '1') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatPage(
                                                widget.userFullName!,
                                                widget.userId!)));
                                  } else {
                                    showAlertDialog(context, widget.userId!);
                                  }
                                },
                                child: Container(
                                  width: 95.w,
                                  height: 42.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border:
                                        Border.all(color: AppColors.mainColor),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Icon(
                                        Icons.mail_outline,
                                        color: AppColors.mainColor,
                                      ),
                                      const Text('Aloqa').tr(),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          // :Padding(
                          //   padding:  EdgeInsets.fromLTRB(8.w, 0, 8.w, 12.h),
                          //   child: InkWell(
                          //     onTap: () async{
                          //       await ChatPermit().fetchApprov(Askid: widget.userId, Approvid: Hive.box('id').get('id'));
                          //     },
                          //     child: Container(
                          //       width: 100.w,
                          //       height: 42.h,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(color: AppColors.mainColor),
                          //         borderRadius: BorderRadius.circular(10.r),
                          //
                          //
                          //       ),
                          //       child: Row(
                          //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children:  [
                          //           const Padding(
                          //             padding: EdgeInsets.all(0.0),
                          //             child: Icon(
                          //               Icons.mail_outline,
                          //               color: AppColors.mainColor,
                          //             ),
                          //           ),
                          //
                          //           Padding(
                          //             padding: const EdgeInsets.all(0.0),
                          //             child: Text("so'rov jo'natish",style: TextStyle(fontSize: 12.sp),).tr(),
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // )
                          : Container(),
                      widget.phoneNumberShow.toString() == '2' &&
                              widget.type == '1'
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 12.h),
                              child: InkWell(
                                onTap: () async {
                                  print(
                                      "${widget.phoneNumberShow}____________");
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path: widget.phoneNumber,
                                  );
                                  await launchUrl(launchUri);
                                },
                                child: Container(
                                  width: 170.w,
                                  height: 42.h,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.mainColor),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.phone,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "${widget.phoneNumber}",
                                          style: TextStyle(fontSize: 14.sp),
                                        ).tr(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : widget.type == '2'
                              ? Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.w, 0, 8.w, 12.h),
                                  child: InkWell(
                                    onTap: () async {
                                      final Uri launchUri = Uri(
                                        scheme: 'tel',
                                        path: widget.phoneNumber,
                                      );
                                      await launchUrl(launchUri);
                                    },
                                    child: Container(
                                      width: 170.w,
                                      height: 42.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.mainColor),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Icon(
                                              Icons.phone,
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "${widget.phoneNumber}",
                                              style: TextStyle(fontSize: 14.sp),
                                            ).tr(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox()
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 324.w,
              decoration: const BoxDecoration(
                color: AppColors.backgroundWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    widget.type == '1'
                        ? Text(
                            'Sherik izlayabmiz',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor),
                          ).tr()
                        : Container(),
                    widget.type == '1'
                        ? Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: AppColors.iconBack,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.accessibility_new,
                                  color: AppColors.mainColor,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${widget.roommate_count} kishi ${widget.roommate_gender == '1' ? "O'g'il" : 'Qiz'} bola",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          )
                        : Container(),
                    widget.type == '1'
                        ? SizedBox(
                            height: 6.h,
                          )
                        : Container(),
                    widget.type == '1'
                        ? Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: AppColors.iconBack,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.location_on,
                                  color: AppColors.mainColor,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${widget.stay_region}",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              )
                            ],
                          )
                        : Container(),
                    widget.type == '1'
                        ? SizedBox(
                            height: 6.h,
                          )
                        : Container(),
                    widget.type == '1'
                        ? Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: AppColors.iconBack,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.corporate_fare,
                                  color: AppColors.mainColor,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 150.w,
                                  child: Text(
                                    "${widget.stay_university}",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(),
                    // Text(
                    //   'Joylashuv',
                    //   style: TextStyle(
                    //       fontSize: 18.sp, fontWeight: FontWeight.bold,color: AppColors.mainColor),
                    // ).tr(),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 40.w,
                    //       height: 40.h,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.colorBack3,
                    //         borderRadius: BorderRadius.circular(8.r),
                    //       ),
                    //       child: const Center(
                    //           child: Icon(
                    //             Icons.location_on,
                    //             color: AppColors.succesColor,
                    //           )),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         "${widget.region}",
                    //         style: TextStyle(fontSize: 14.sp),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 6.h,
                    // ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 40.w,
                    //       height: 40.h,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.colorBack3,
                    //         borderRadius: BorderRadius.circular(8.r),
                    //       ),
                    //       child: const Center(
                    //           child: Icon(
                    //         Icons.location_on,
                    //         color: AppColors.succesColor,
                    //       )),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         "${widget.district}",
                    //         style: TextStyle(fontSize: 14.sp),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    widget == '1'
                        ? SizedBox(
                            height: 6.h,
                          )
                        : Container(),
                    // widget.type == '1' ?
                    // widget.type == '1'
                    //     ? Row(
                    //         children: [
                    //           Container(
                    //             width: 40.w,
                    //             height: 40.h,
                    //             decoration: BoxDecoration(
                    //               color: AppColors.iconBack,
                    //               borderRadius: BorderRadius.circular(8.r),
                    //             ),
                    //             child: const Center(
                    //                 child: Icon(
                    //               Icons.corporate_fare,
                    //               color: AppColors.mainColor,
                    //             )),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Container(
                    //                 width: MediaQuery.of(context).size.width -
                    //                     150.w,
                    //                 child: Text(
                    //                   "${widget.stay_university}",
                    //                   style: TextStyle(fontSize: 14.sp),
                    //                 )),
                    //           )
                    //         ],
                    //       )
                    //     : Container(),
                    // : const SizedBox(),
                    SizedBox(
                      height: 6.h,
                    ),
                    // widget.type == '1' ? Row(
                    //   children: [
                    //     Container(
                    //       width: 40.w,
                    //       height: 40.h,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.iconBack,
                    //         borderRadius: BorderRadius.circular(8.r),
                    //       ),
                    //       child: const Center(
                    //           child: Icon(
                    //         Icons.school,
                    //         color: AppColors.mainColor,
                    //       )),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: SizedBox(
                    //         width: MediaQuery.of(context).size.width - 150.w,
                    //         child: Text(
                    //           "${widget.facultet}",
                    //           style: TextStyle(fontSize: 14.sp),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ) : const SizedBox(),
                    Text(
                      tr("Xonadon ma’lumotlari"),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.location_on,
                            color: AppColors.succesColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 150.w,
                            child: Text(
                              "${widget.region} | ${widget.district}",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.location_on,
                            color: AppColors.succesColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.address}",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.directions_subway,
                            color: AppColors.succesColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            tr("Metroga yaqinmi") +
                                ":  ${widget.subway == '1' ? tr('Ha') : tr("Yo'q")}",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),

                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.apartment,
                            color: AppColors.succesColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            tr(widget.houseType == '1'
                                    ? 'Kvartira'
                                    : 'Xonadon') +
                                " | ${widget.countRoom} xonali" +
                                " | ${widget.inFloor}/${widget.floorsCount} etajda",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.apartment,
                            color: AppColors.succesColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            tr(widget.type == '1'
                                    ? "Uy egasi bilan birga yashshga rozimi:"
                                    : "Uy egasi birga yashaydimi:") +
                                (widget.liveWithOwner == '1'
                                    ? tr('Ha')
                                    : tr("Yo'q")),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.house,
                            color: AppColors.succesColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 150.w,
                              child: Text(
                                "${widget.description}",
                                style: TextStyle(fontSize: 14.sp),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      tr("To’lovlar"),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack2,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.countertops,
                            color: AppColors.error,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 130.w,
                              child: Text(
                                tr("Kommunal to’lovlarni to’laydi") +
                                    " : " +
                                    "${widget.utility_bills == '1' ? tr('Uy egasi') : tr('Ijarachi')}",
                                style: TextStyle(fontSize: 14.sp),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    user.isNotEmpty? Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack2,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.countertops,
                            color: AppColors.error,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 130.w,
                              child: Text(
                                user.isNotEmpty?
                                "uy egasi to'laydi: ${forUser}"
                                :'',
                                style: TextStyle(fontSize: 14.sp),
                              )),
                        )
                      ],
                    ) : SizedBox(),
                    SizedBox(
                      height: 6.h,
                    ),
                    student.isNotEmpty? Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack2,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                                Icons.countertops,
                                color: AppColors.error,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 130.w,
                              child: Text(
                                student.isNotEmpty?
                                "ijarachi to'laydi: ${forStudent}"
                                    :''
                                ,
                                style: TextStyle(fontSize: 14.sp),
                              )),
                        )
                      ],
                    ) : SizedBox(),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack2,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.account_balance_wallet,
                            color: AppColors.error,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 130.w,
                              child: Text(
                                "${widget.cost} ${widget.costTayp.toString() == '1' ? "So'm" : "USD"}/${widget.rentType == '1' ? tr('Kuniga') : tr('Oyiga')}",
                                style: TextStyle(fontSize: 14.sp),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      tr("Kuydagi qo'shimcha qulayliklar"),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack2,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check_box,
                              color: AppColors.error,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 150.w,
                            child: Text(
                              comfortList,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, int askedid) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: AppColors.mainColor),
    child: Text("Ruhsat olish").tr(),
    onPressed: () async {
      print(askedid);
      await ChatPermit().fetchApprov(Askid: askedid.toString());
      Navigator.of(context).pop();
    },
  );
  Widget notButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: AppColors.error),
    child: Text("Bekor qilish").tr(),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("Akkauntdan chiqish ").tr(),
    content: Text("Sms yozish uchun ruhsat so'rash ").tr(),
    actions: [
      notButton,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
