import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/get_region_model.dart';
import 'package:talaba_uy/models/get_univer_model.dart';
import 'package:talaba_uy/services/get_univer_service.dart';

import '../../services/get_district_service.dart';
import '../../services/get_faculty_service.dart';
import '../../services/get_region_service.dart';

class UniverFiltrPage extends StatefulWidget {
  const UniverFiltrPage({Key? key}) : super(key: key);

  @override
  State<UniverFiltrPage> createState() => _UniverFiltrPageState();
}

class _UniverFiltrPageState extends State<UniverFiltrPage> {
  final bool _checkMetro = false;
  String? _dropownUsd;
  String _titleUniver = "Oliy o’quv yurtingizni tanlang";
  String _titleRegion = "Viloyatni tanlang";
  String _titleDistrict = "Tumanni tanlang";
  String _titleFaculty = "Kursingizni tanlang";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        title: Text(
          "Filtr",
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Joylashuv",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12.h),
              Text(
                "Viloyat",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              FutureBuilder<List<GetRegionModel>?>(
                  future: GetRegionService().fetchRegion(),
                  builder:
                      (context, AsyncSnapshot<List<GetRegionModel>?> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: ExpansionTile(
                          key: GlobalKey(),
                          title: Text(
                            _titleRegion,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _titleRegion =
                                              snapshot.data![index].name!;
                                        });
                                      },
                                      child: Text(snapshot.data![index].name!));
                                }),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              SizedBox(height: 12.h),
              Text(
                "Tuman",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              FutureBuilder<List<GetDistrictModel>?>(
                  future: GetDistrictService().fetchDistrict(),
                  builder: (context,
                      AsyncSnapshot<List<GetDistrictModel>?> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: ExpansionTile(
                          key: GlobalKey(),
                          title: Text(
                            _titleDistrict,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _titleDistrict =
                                              snapshot.data![index].name!;
                                        });
                                      },
                                      child: Text(snapshot.data![index].name!));
                                })
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 385.h, horizontal: 31.w),
                child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          primary: AppColors.buttonLinear),
                      onPressed: () {},
                      child: Text(
                        "Saqlash",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
