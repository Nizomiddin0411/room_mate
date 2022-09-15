import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Create_ads/owner.dart';
import 'package:talaba_uy/screens/Create_ads/student.dart';

import '../../provider/region_provider.dart';

class CreateAdsPage extends StatefulWidget {
  const CreateAdsPage({Key? key}) : super(key: key);

  @override
  State<CreateAdsPage> createState() => _CreateAdsPageState();
}

class _CreateAdsPageState extends State<CreateAdsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    super.initState();
    Provider.of<RegionProvider>(context, listen: false).getRegion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
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
        title: const Text("E’lon yaratish",
            style: TextStyle(color: AppColors.mainColor)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.mainColor,
          unselectedLabelColor: AppColors.textColor,
          indicatorWeight: 4.h,
          tabs: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const Text(
                "Talabaman",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const Text(
              "Uy beruvchiman",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  [Student(), Owner()],
      ),
    );
  }
}
