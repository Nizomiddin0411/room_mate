import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/chat/chat_page.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/provider/search_universitet_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/chat_permit_provider.dart';
import '../../provider/universitet_provider.dart';
import '../../services/post_add_chat_permit.dart';
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
    Provider.of<UniversitetProvider>(context, listen: false)
        .getAds( UniverId: widget.id, Fakultetid: '0', Districtid: '0', course: '0', Regionid: '0');
  }

  String? checknumber;
  String? checkhidenumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundWhite,
        title: const Text(
          "Oliy o’quv yurti",
          style: TextStyle(color: AppColors.mainColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(child: Consumer<UniversitetProvider>(
        builder: (_, provider, __) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100.h,
                          width: 330.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
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
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            provider.isRegion = false;
                            provider.isDistrict = false;
                            provider.isFacultet = false;
                            provider.isCourse = false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultFiltrPage(
                                          id: widget.id,
                                        )));
                          },
                          child: Container(
                            width: 330.w,
                            height: 50.h,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                const Icon(Icons.tune),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Filtr",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ]),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blueGrey)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sherik izlayotgan",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.ads.length,
                  itemBuilder: (context, index) {
                    checknumber = '+' + provider.ads[index].phone.toString();
                    checkhidenumber = provider.ads[index].hidePhone.toString();
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         provider.ads[index].hideProfile == 2 ?
                          Container(
                            width: 324.w,
                            height: 210.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: AppColors.secondBackgroud),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(provider.ads[index].fullName
                                        .toString()),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                        "${provider.ads[index].faculty?.name.toString()}"),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          provider.ads[index].gender.toString() == '1' ? tr("jinsi") + ":" + tr("Erkak") : tr("jinsi") + ":" + tr("Ayol"),
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                        SizedBox(
                                          width: 45.w,
                                        ),
                                        Text(
                                            "Kursi : ${provider.ads[index].course.toString()}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Viloyat:${provider.ads[index].birthRegion?.name.toString()} ",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            "Tuman :${provider.ads[index].birthDistrict?.name.toString()}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (provider.ads[index].chatApproved.toString() == '1') {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => ChatPage(
                                                          provider.ads[index].fullName.toString(),
                                                          provider.ads[index].id!)));
                                            } else {
                                              showAlertDialog(context, provider.ads[index].id!);
                                            }

                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 7.w, 0),
                                            child: Container(
                                              height: 42.h,
                                              width: 90.w,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5.w, 0, 5.w, 0),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.email_outlined,
                                                      color: Colors.blue,
                                                    ),
                                                    SizedBox(
                                                      width: 7.w,
                                                    ),
                                                    Text(
                                                      tr("Aloqa"),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColors.backgroundWhite,
                                                  border: Border.all(
                                                      color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 35.w,
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 7.w, 0),
                                              child: Container(
                                                height: 42.h,
                                                width: 150.w,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5.w, 0, 5.w, 0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.phone,
                                                        color: Colors.blue,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      InkWell(
                                                        onTap: checkhidenumber == '2' ?() async {
                                                          final Uri launchUri =
                                                              Uri(
                                                            scheme: 'tel',
                                                            path: checknumber ==
                                                                    '1'
                                                                ? null
                                                                : provider
                                                                    .ads[index]
                                                                    .phone
                                                                    .toString(),
                                                          );

                                                               await launchUrl(
                                                                  launchUri);
                                                        }:(){},
                                                        child: Text(
                                                          checkhidenumber == '2'
                                                              ? checknumber
                                                                  .toString()
                                                              : '*************',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                        ),
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
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ):const SizedBox(),
                        ],
                      ),
                    );
                  })
            ],
          );
        },
      )),
    );
  }
}

showAlertDialog(BuildContext context, int askedid) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: AppColors.mainColor),
    child: const Text("Ruhsat olish").tr(),
    onPressed: () async {
      print(askedid);
      await PostChatPermit().fetchApprov(Askid: askedid.toString());
      Navigator.of(context).pop();
    },
  );
  Widget notButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: AppColors.error),
    child: const Text("Bekor qilish").tr(),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("Akkauntdan chiqish ").tr(),
    content: const Text("Sms yozish uchun ruhsat so'rash ").tr(),
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
