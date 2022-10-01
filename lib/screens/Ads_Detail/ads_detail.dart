import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import '../../chat/chat_page.dart';
import '../../services/post_add_chat_permit.dart';
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
  int userId;
  String? userFullName;
  int chatApproved;
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
      required this.userId,
      required this.userFullName,
        required this.chatApproved,
      })
      : super(key: key);

  @override
  State<AdsDetail> createState() => _AdsDetailState();
}

class _AdsDetailState extends State<AdsDetail> {
  int _correntPage = 0;
  static int _index= 0;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        return CachedNetworkImage(
                          imageUrl: "https://source.unsplash.com/random/324x235",
                          width: 324.w,
                          height: 235.h,
                          fit: BoxFit.cover,
                        );
                      }),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _correntPage == i
                                ? AppColors.backgroundWhite
                                : Colors.grey),
                      );
                    }).toList(),
                  ),
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
                )
                )

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
                        padding:  EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
                        child: Text(
                          '${widget.cost} ${widget.costTayp == '1' ? "so'm" : 'y.e'}',
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
                          "${widget.description}",
                          style: TextStyle(fontSize: 18.sp),
                        )),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on,color: AppColors.mainColor,),
                    SizedBox(width: 10.w,),
                    Text("${widget.region}",style: TextStyle(fontSize: 10.sp),)
                    ],
                  ),

               Row(
                 children: [
                   // widget.chatApproved == 0 ?
                   Padding(
                     padding:  EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
                     child: InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(widget.userFullName!, widget.userId)));
                       },
                       child: Container(
                         width: 95.w,
                         height: 42.h,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.r),
                           border: Border.all(color: AppColors.mainColor),),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children:  [
                             const Padding(
                               padding: EdgeInsets.all(5.0),
                               child: Icon(
                                 Icons.mail_outline,
                                 color: AppColors.mainColor,
                               ),
                             ),

                             Padding(
                               padding:  EdgeInsets.symmetric(horizontal: 10.w),
                               child: Text('Aloqa').tr(),
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding:  EdgeInsets.fromLTRB(8.w, 0, 8.w, 12.h),
                     child: InkWell(
                       onTap: () async{
                         await ChatPermit().fetchApprov(Askid: widget.userId, Approvid: Hive.box('id').get('id'));
                       },
                       child: Container(
                         width: 170.w,
                         height: 42.h,

                         decoration: BoxDecoration(
                           border: Border.all(color: AppColors.mainColor),
                           borderRadius: BorderRadius.circular(10.r),


                         ),
                         child: Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children:  [
                             const Padding(
                               padding: EdgeInsets.all(5.0),
                               child: Icon(
                                 Icons.phone,
                                 color: AppColors.mainColor,
                               ),
                             ),

                             Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: Text("+99899 786 34 65",style: TextStyle(fontSize: 14.sp),).tr(),
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                   // :

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
                    Text(
                      'Sherik izlayabmiz',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold,color: AppColors.mainColor),
                    ).tr(),
                    Row(
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
                            "2 kishi Qiz bola",
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
                            "Buxoro viloyatidan",
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
                            width: MediaQuery.of(context).size.width -150.w,
                            child: Text(
                              "Muhammad  al-Xorazmiy nomidagi Toshkent axborot texnologiyalari Universiteti ",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Joylashuv',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold,color: AppColors.mainColor),
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
                      tr("Xonadon ma’lumotlari"),
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold,color: AppColors.mainColor),
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
                    Text(
                      tr("To’lovlar"),
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold,color: AppColors.mainColor),
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
                                "Kommunal to’lovlarni to’laydi  : Ijarachi",
                                style: TextStyle(fontSize: 14.sp),
                              )),
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
                                "${widget.cost}/oyiga",
                                style: TextStyle(fontSize: 14.sp),
                              )),
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
                            color: AppColors.colorBack2,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                              child: Icon(
                                Icons.check_box,
                                color: AppColors.error,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 150.w,
                              child: Text(
                                "Qulayliklar : Muzlatgich , Kir yuvish mashinasi,Konditsioner , Chang yutgich",
                                style: TextStyle(fontSize: 14.sp),
                              )),
                        )
                      ],
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
