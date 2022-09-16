import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/core/data/mockdata.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/get_univer_model.dart';
import 'package:talaba_uy/services/get_district_service.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_region_service.dart';

import '../../models/get_region_model.dart';
import '../../services/get_univer_service.dart';
class ResultFiltrPage extends StatefulWidget {
  const ResultFiltrPage({Key? key}) : super(key: key);

  @override
  State<ResultFiltrPage> createState() => _ResultFiltrPageState();
}

class _ResultFiltrPageState extends State<ResultFiltrPage> {

  String _titleFaculty = "Yo’nalishingizni tanlang";
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
              Column(
                children: [
                  Column(
                    children: [
                      FutureBuilder<List<GetRegionModel>?>(
                        future: GetRegionService().fetchRegion(),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            return DropdownButtonFormField2<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Viloyatni tanlang',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding: const EdgeInsets.only(
                                  left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: snapshot.data!
                                  .map(
                                    (value) => DropdownMenuItem<String>(
                                  onTap: () async{
                                    MockData.viloyatid = value.id;
                                  },
                                  value: value.name,
                                  child: Text(
                                    value.name!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return '';
                                }
                              },
                              onChanged: (value) {
                                setState(() {


                                });
                              },
                              onSaved: (value) {

                              },
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
              Column(
                children: [
                  Row(
                    children: [
                      Text(" Qaysi tumanidansiz"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      FutureBuilder<List<GetDistrictModel>?>(
                        future: GetDistrictService().fetchDistrict(0),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            return DropdownButtonFormField2<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                ' Qaysi tumanidansiz',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding: const EdgeInsets.only(
                                  left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: snapshot.data!
                                  .map(
                                    (value) => DropdownMenuItem<String>(
                                  value: value.name,
                                  child: Text(
                                    value.name!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                                  .toList(),
                              validator: (value) {

                              },
                              onChanged: (value) {
                                setState(() {
                                });
                              },
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                "Talaba",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Yo’nalish",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Column(
                children: [
                  FutureBuilder<List<GetFacultyModel>?>(
                    future: GetFacultyService().fetchFaculty(0),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField2<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          isExpanded: true,
                          isDense: false,
                          hint: const Text(
                            'Fakultetingiz',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding: const EdgeInsets.only(
                              left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items:  snapshot.data!
                              .map(
                                (value) => DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(
                                value.name!,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                              .toList(),
                          onChanged: (value) {


                          } ,

                        );

                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 210.h, horizontal: 31.w),
                child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          primary: AppColors.buttonLinear),
                      onPressed: () {
                      },
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
