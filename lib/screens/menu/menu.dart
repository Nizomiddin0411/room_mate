import 'package:badges/badges.dart';
import 'package:cron/cron.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/provider/search_universitet_provider.dart';
import 'package:talaba_uy/screens/Account_Page/account_page.dart';
import 'package:talaba_uy/screens/Create_ads/create_ads_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/elonlar.dart';
import 'package:talaba_uy/screens/Ijarachipage/kunlik_ijara.dart';
import 'package:talaba_uy/screens/Search_University/search_page.dart';
import 'package:talaba_uy/screens/drawer/drawer.dart';

import '../../provider/notification_provider.dart';
import '../../services/get_count_notification.dart';
import '../Feedback_Page/feedback_page.dart';
import '../Ijarachipage/oylik_ijara.dart';
import '../Notification_Page/notification_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    Provider.of<SearchUniversitet>(context, listen: false).getFilter(
      toStringShort(),
      '0',
      '0',
    );
    final cron = Cron();
    try{
      cron.schedule(Schedule.parse('*/6 * * * * *'), () {
        Provider.of<NotificationProvider>(context, listen: false).getCount();
      });
    } on ScheduleParseException{
       cron.close();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: const Icon(
            Icons.menu,
            color: AppColors.iconColor,
          ),
        ),
        actions: [
          Consumer<NotificationProvider>(
            builder: (_, data,__) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()));
                },
                child: Badge(
                  position: BadgePosition.bottomStart(bottom: 0, start: 30),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    radius: 19.r,
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                  ),
                   badgeContent:   Text(
                    "${data.count.message ?? '0'}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage()));
              },
              child: CircleAvatar(
                backgroundImage:
                    const AssetImage('assets/images/accountImage.png'),
                radius: 25.r,
                // child:
              ),
            ),
          )
        ],
        title: Center(
            child: Text(
          "Roommate",
          style: TextStyle(color: AppColors.buttonLinear, fontSize: 24.sp),
        )),
        // flexibleSpace:
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.backgroundWhite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GridView(
                padding: EdgeInsets.fromLTRB(18.w, 40.h, 18.w, 0),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 18.w,
                    mainAxisSpacing: 18.h,
                    crossAxisCount: 2,
                    mainAxisExtent: 180.h),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage()));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage(
                                "assets/images/building-mid-2 (1).png"),
                          ),
                          SizedBox(height: 15.h),
                          const Text(
                            "Oliy o’quv yurti",
                            style: TextStyle(color: AppColors.textColor),
                          ).tr()
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Elonlar()));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image:
                                AssetImage("assets/images/building-mid-1.png"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const Text(
                            "E’lonlar",
                            style: TextStyle(color: AppColors.textColor),
                          ).tr()
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KunlikIjara()));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/shop-1.png"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const Text(
                            "Kunlik kvartira",
                            style: TextStyle(color: AppColors.textColor),
                          ).tr()
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OylikIjara()));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/shop-2.png"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const Text(
                            "Oylik kvartira",
                            style: TextStyle(color: AppColors.textColor),
                          ).tr()
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
                physics: const NeverScrollableScrollPhysics(),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedbackPage()));
                },
                child: Container(
                  height: 80.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.secondBackgroud,
                  ),
                  child: Center(
                      child: const Text(
                    "O'z taklifingizni qoldiring",
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
                  ).tr()),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              SizedBox(
                height: 48.h,
                width: 250.w,
                child: ElevatedButton(
                  child: const Text("E’lon yaratish").tr(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAdsPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.buttonLinear,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
