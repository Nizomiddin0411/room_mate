
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

import '../Feedback_Page/feedback_page.dart';
import '../Ijarachipage/ads_for_users.dart';
import '../Ijarachipage/oylik_ijara.dart';

class MenuFor extends StatefulWidget {
  const MenuFor({Key? key}) : super(key: key);

  @override

  State<MenuFor> createState() => _MenuForState();
}

class _MenuForState extends State<MenuFor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    Provider.of<SearchUniversitet>(context, listen: false).getSearchUniver('0','0','0');
    Provider.of<SearchUniversitet>(context, listen: false).getSearchUniver(toStringShort(),'0','0');
  }

  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer:  DrawerPage(),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        leading: InkWell(
          onTap: ()=>_scaffoldKey.currentState!.openDrawer(),
          child: const Icon(
            Icons.menu,
            color: AppColors.iconColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountPage()));
              },
              child:  CircleAvatar(
                backgroundImage: AssetImage('assets/images/accountImage.png'),
                radius: 25.r,
                // child:
              ),
            ),
          )
        ],
        title:  Center(
            child: Text(
              "Roommate",
              style: TextStyle(color: AppColors.buttonLinear, fontSize: 24.sp),
            )),
        // flexibleSpace:
      ),
      body:  SingleChildScrollView(
        child: Container(
          color: AppColors.backgroundWhite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdsUsers()));
                },
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(20.w,20.h,16.w,150.h),
                  child: Container(
                    width:324.w,
                    height: 152.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Image(
                          image: AssetImage(
                              "assets/images/building-mid-1.png"),
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
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackPage()));
                },
                child: Container(
                  height: 80.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.secondBackgroud,
                  ),
                  child: const Center(
                      child: Text(
                        "Talab va Takliflar bildirish",
                        style: TextStyle(
                          color: AppColors.textColor,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              SizedBox(
                height: 48.h,
                width: 250.w,
                child: ElevatedButton(
                  child:  const Text("E’lon yaratish").tr(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAdsPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.buttonLinear,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
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
