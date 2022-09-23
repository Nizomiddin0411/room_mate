import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/chat/chat_page.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/provider/search_universitet_provider.dart';

import '../../provider/universitet_provider.dart';
import 'result _filtr_search.universitety.dart';

class ResultUniversitetPage extends StatefulWidget {
  final String name;
  final String id;

  const ResultUniversitetPage({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<ResultUniversitetPage> createState() => _ResultUniversitetPageState();
}

class _ResultUniversitetPageState extends State<ResultUniversitetPage> {
  void initState() {
    super.initState();
    Provider.of<UniversitetProvider>(context, listen: false).getViloyat();
    Provider.of<SearchUniversitet>(context, listen: false).getAds(widget.name,"0","0","0");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(260.h),
        child: AppBar(
          elevation: 0,
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
          title: Center(
            child: const Text(
              "Oliy o’quv yurti",
              style: TextStyle(color: AppColors.mainColor),
            ).tr(),
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(18.w, 100.h, 18.w, 18.h),
            child: Column(
              children: [
                Container(
                  height: 87.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.secondBackgroud),
                  child: Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Row(
                      children: [
                        Image.asset('assets/images/image 7.png'),
                        SizedBox(
                          width: 20.w,
                        ),
                        SizedBox(
                          height: 60.h,
                          width: 200.w,
                          child: AutoSizeText(
                            widget.name,
                            style: TextStyle(fontSize: 10.sp),
                            maxLines: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  height: 50.h,
                  width: 324.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.secondBackgroud),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Filtr",
                            style: TextStyle(color: Colors.black),
                          ).tr(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultFiltrPage(
                                            id: widget.id,
                                          )));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Center(
                                child: Icon(
                                  Icons.tune,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    // Text(
                    //   "Sherik",
                    //   style: TextStyle(color: Colors.blue, fontSize: 14),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SearchUniversitet>(
              builder: (_, data, __) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.ads.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 324.w,
                                height: 110.h,
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
                                          padding: EdgeInsets.all(6.0.w),
                                          child: Text(
                                            '${data.ads[index].fullName}',
                                            style: TextStyle(fontSize: 18.sp),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 0, 8.w, 0),
                                          child: const Icon(
                                            Icons.favorite_border,
                                            color: AppColors.error,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                                      child: Text(
                                        '',
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
                                            data.ads[index].gender.toString() ==
                                                    '1'
                                                ? tr("jinsi") +
                                                    ":" +
                                                    tr("Erkak")
                                                : tr("jinsi") +
                                                    ":" +
                                                    tr("Ayol"),
                                            // "jinsi",
                                            style: TextStyle(fontSize: 15.sp),
                                          ),
                                        ),
                                        Text(tr("Kursi:") +
                                            data.ads[index].course.toString()),
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatPage(
                                                          data.ads[index]
                                                              .fullName!,
                                                          data.ads[index].id!),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 7.w, 0),
                                              child: Container(
                                                height: 35.h,
                                                width: 90.w,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5.w, 0, 5.w, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Icon(
                                                        Icons.email,
                                                        color: Colors.blue,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        tr("Aloqa"),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .backgroundWhite,
                                                    border: Border.all(
                                                        color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                              ),
                                            )),
                                      ],
                                    ),
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
}
