import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/get_region_model.dart';
import 'package:talaba_uy/models/get_univer_model.dart';
import 'package:talaba_uy/provider/universitet_provider.dart';
import 'package:talaba_uy/screens/Autorization/LoginPage.dart';
import 'package:talaba_uy/screens/Autorization/offerto_dart.dart';
import 'package:talaba_uy/screens/Autorization/student_registratsion.dart';
import 'package:talaba_uy/screens/Autorization/user_registratsiya.dart';
import 'package:talaba_uy/services/get_district_service.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_region_service.dart';
import 'package:talaba_uy/services/get_univer_service.dart';
import 'package:talaba_uy/services/post_create_student.dart';

import '../../core/const/app_colors.dart';

class Registratsiya extends StatefulWidget {
  const Registratsiya({Key? key}) : super(key: key);

  @override
  State<Registratsiya> createState() => _RegistratsiyaState();
}

class _RegistratsiyaState extends State<Registratsiya> {

  TabController? _tabController;
  @override
  void initState() {

    super.initState();
    Provider.of<UniversitetProvider>(context, listen: false).getUniver();
    Provider.of<UniversitetProvider>(context, listen: false).getViloyat();
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(155),
          child: AppBar(
            backgroundColor: AppColors.backgroundWhite,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.textColor,
              ),
            ),
            elevation: 0,
            title: Center(
              child: Column(
                children: const [],
              ),
            ),
            flexibleSpace: Padding(
              padding:  EdgeInsets.fromLTRB(0, 60.h, 0, 0),
              child: Column(
                children: [
                  Text("Ro???yxatdan o???tish".tr(),
                      style:  TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                      "Ro???yxatdan o???tish uchun shaxsiy ma???lumotlaringizni  kiriting".tr(),),
                ],
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              controller: _tabController,
              labelColor: AppColors.mainColor,
              unselectedLabelColor: AppColors.textColor,
              indicatorWeight: 4.h,
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    "Talabaman".tr(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Text(
                  "Uy beruvchiman",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ).tr(),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
          StudentUser(),
            UserRegistratsion()
          ],
        ),
      ),
    );
  }
}
