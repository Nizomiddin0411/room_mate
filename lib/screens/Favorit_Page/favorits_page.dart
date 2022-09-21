import 'package:easy_localization/easy_localization.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/get_favorite_model.dart';
import 'package:talaba_uy/services/get_favorite_service.dart';

import '../../provider/favorite_provider.dart';
import '../../services/post_change_favoritr_service.dart';
import '../All_Ads_Page/detail_page.dart';

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
          return Column(
              children: [
            ListView.builder(
                shrinkWrap: true,
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
                                          valueChanged: (_isFavorite) {
                                            setState(() {
                                              FavoriteChange().Favoritefetch(
                                                  id: data.Like[index].id
                                                      .toString());
                                            });
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
                                                    DetailPage()));
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                        child: Text(
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
          ]);
        }));
  }
}
