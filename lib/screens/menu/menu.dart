
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Account_Page/account_page.dart';
import 'package:talaba_uy/screens/All_Ads_Page/all_ads_page.dart';
import 'package:talaba_uy/screens/Create_ads/create_ads_page.dart';
import 'package:talaba_uy/screens/Ijarachipage/elonlar.dart';
import 'package:talaba_uy/screens/Ijarachipage/kunlik_ijara.dart';
import 'package:talaba_uy/screens/Search_University/search_page.dart';
import 'package:talaba_uy/screens/drawer/drawer.dart';

import '../Ijarachipage/oylik_ijara.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerPage(),
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
        title: const Center(
            child: Text(
          "Madad",
          style: TextStyle(color: AppColors.buttonLinear, fontSize: 24),
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
            GridView(
              padding: const EdgeInsets.fromLTRB(18, 100, 18, 0),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 18.w,
                  mainAxisSpacing: 18.h,
                  crossAxisCount: 2,
                  mainAxisExtent: 180.h),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchPage()));
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage(
                              "assets/images/building-mid-2 (1).png"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Universitet bo'yicha",
                          style: TextStyle(color: AppColors.textColor),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.secondBackgroud,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Elonlar()));
                  },
                  child: Container(
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
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.secondBackgroud,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const KunlikIjara()));
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Image(
                          image: AssetImage("assets/images/shop-1.png"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Text(
                          "Kunlik kvartira",
                          style: TextStyle(color: AppColors.textColor),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.secondBackgroud,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const OylikIjara()));
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Image(
                          image: AssetImage("assets/images/shop-2.png"),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Text(
                          "Oylik kvartira",
                          style: TextStyle(color: AppColors.textColor),
                        )
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
              height: 120.h,
            ),
            SizedBox(
              height: 48.h,
              width: 250.w,
              child: ElevatedButton(
                child: const Text('E’lon berish'),
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
