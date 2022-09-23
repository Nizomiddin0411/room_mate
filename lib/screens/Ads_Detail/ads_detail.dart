import 'package:easy_localization/easy_localization.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import '../../chat/chat_page.dart';
import '../../services/post_change_favoritr_service.dart';

class AdsDetail extends StatefulWidget {
  String? title;
  String? description;
  String? cost;
  String? costTayp;
  String? houseType;
  String? countRoom;
  String? countPeople;
  String? region;
  String? district;
  String? univer;
  String? facultet;
  String? liveWithOwner;
  String? subway;
  String? id;
  String? favorite;
  String? type;
  // int userId;
  // String? userFullName;
  AdsDetail(
      {Key? key,
      required this.title,
      required this.description,
      required this.cost,
      required this.costTayp,
      required this.houseType,
      required this.countRoom,
      required this.countPeople,
      required this.region,
      required this.district,
      required this.univer,
      required this.facultet,
      required this.liveWithOwner,
      required this.subway,
      required this.id,
      required this.favorite,
      required this.type,
        // required this.userId,
        // required this.userFullName
      })
      : super(key: key);

  @override
  State<AdsDetail> createState() => _AdsDetailState();
}

class _AdsDetailState extends State<AdsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 65.w),
            child: Text(
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
            Padding(
              padding:  EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 18.h),
              child: Container(
                width: 324.w,
                height: 232.h,
                decoration: BoxDecoration(
                  color: AppColors.secondBackgroud,
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
                          padding:  EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
                          child: Text(
                            '${widget.cost} ${widget.costTayp == '1' ? "so'm" : 'y.e'}',
                            style: TextStyle(
                                fontSize: 24.sp, color: AppColors.mainColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
                          child: FavoriteButton(
                            isFavorite: widget.favorite == '0' ? false : true,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - 150.w,
                          child: Text(
                            "${widget.title}",
                            style: TextStyle(fontSize: 18.sp),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.apartment,
                                  color: AppColors.mainColor,
                                ),
                                Text(widget.houseType == '1'
                                    ? tr('Kvartira')
                                    : tr('Xonadon')),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.apartment,
                                  color: AppColors.mainColor,
                                ),
                                Text('${widget.countRoom} '+tr('xona')),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.directions_walk,
                                  color: AppColors.mainColor,
                                ),
                                Text('${widget.countPeople} ' +tr('kishi')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
                      child: InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(widget.userFullName.toString(),widget.userId)));
                        },
                        child: Container(
                          width: 95.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.colorBack3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Padding(
                                padding: EdgeInsets.all(11.0),
                                child: Icon(
                                  Icons.mail,
                                  color: AppColors.succesColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('Aloqa').tr(),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
                    Text(
                      'Joylashuv',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ).tr(),
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
                            "${widget.region}",
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
                            Icons.location_on,
                            color: AppColors.succesColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.district}",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    widget.type == '1' ? Row(
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
                          child: Container(
                              width: MediaQuery.of(context).size.width - 150.w,
                              child: Text(
                                "${widget.univer}",
                                style: TextStyle(fontSize: 14.sp),
                              )),
                        )
                      ],
                    ) : const SizedBox(),
                    SizedBox(
                      height: 6.h,
                    ),
                    widget.type == '1' ? Row(
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
                            Icons.school,
                            color: AppColors.mainColor,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 150.w,
                            child: Text(
                              "${widget.facultet}",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        )
                      ],
                    ) : const SizedBox(),
                    Text(
                      tr("Ma’lumot"),
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
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
                          child: Text(
                            tr("Uy egasi bilan birga yashshga:") + "${widget.liveWithOwner == '1' ? 'Rozi' : 'Roziemas'}",
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
                            tr("Metroga yaqinmi") +"${widget.subway == '1' ? tr('Ha') : tr("Yo'q")}",
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
