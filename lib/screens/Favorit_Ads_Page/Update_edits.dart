import 'dart:math';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/students_edits_page.dart';

import '../../core/const/app_colors.dart';
import '../../cubit/aut_cubit.dart';
import '../../provider/region_provider.dart';

class UpdateStudents extends StatefulWidget {
  String? title;
  String? stay_region;
  String? stay_region_id;
  String? stay_region_matter;
  String? stay_university_id;
  String? stay_university_matter;
  String? roommate_gender;
  String? roommate_count;
  String? phone_number;
  String? phone_number_show;
  String? have_living_home;
  String? description;
  String? district;
  String? address;
  String? location;
  String? subway;
  String? house_type;
  String? room_count;
  String? floors_count;
  String? howcountroom;
  String? cost;
  String? cost_type;
  String? live_with_owner;
  String? utility_bills;
  String? comfort;
  String? renttype;
  String? cost_period;
  String? id;
  String? univername;
  String? districtId;
  String? inFloor;
  List<dynamic>? images;

  UpdateStudents({
    Key? key,
    required this.inFloor,
    required this.id,
    required this.stay_region_id,
    required this.images,
    required this.univername,
    required this.howcountroom,
    required this.floors_count,
    required this.address,
    required this.location,
    required this.roommate_count,
    required this.description,
    required this.title,
    required this.subway,
    required this.cost_period,
    required this.comfort,
    required this.cost,
    required this.roommate_gender,
    required this.cost_type,
    required this.district,
    required this.live_with_owner,
    required this.have_living_home,
    required this.house_type,
    required this.phone_number,
    required this.phone_number_show,
    required this.renttype,
    required this.room_count,
    required this.stay_region,
    required this.stay_region_matter,
    required this.stay_university_id,
    required this.stay_university_matter,
    required this.utility_bills,
    required this.districtId
  }) : super(key: key);

  @override
  State<UpdateStudents> createState() => _UpdateStudentsState();
}

class _UpdateStudentsState extends State<UpdateStudents> {
  @override
  Widget build(BuildContext context) {
    print(widget.stay_university_id.toString() + "---");
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
        title: Text("E’lonni o'zgartirish".tr(),
            style: const TextStyle(color: AppColors.mainColor)),
        centerTitle: true,
      ),
      body: StudentsEdist(
        stay_univer_id: '${widget.stay_university_id}',
        updateid: '${widget.id}',
        stay_universityname: widget.univername.toString(),
        stay_university_matter: widget.stay_university_matter.toString(),
        renttype: widget.renttype.toString(),
        cost: widget.cost.toString(),
        subway: widget.subway.toString(),
        stay_region: widget.stay_region.toString(),
        stay_region_matter: widget.stay_region_matter.toString(),
        description: widget.description.toString(),
        utility_bills: widget.utility_bills.toString(),
        address: widget.address.toString(),
        title: widget.title.toString(),
        room_count: widget.room_count.toString(),
        location: widget.location.toString(),
        live_with_owner: '${widget.live_with_owner}',
        comfort: '${widget.comfort}',
        roommate_count: '${widget.roommate_count}',
        house_type: '${widget.house_type}',
        district: '${widget.district}',
        phone_number_show: '${widget.phone_number_show}',
        roommate_gender: '${widget.roommate_gender}',
        have_living_home: '${widget.have_living_home}',
        cost_period: '${widget.cost_period}',
        floors_count: '${widget.floors_count}',
        cost_type: '${widget.cost_type}',
        phone_number: '${widget.phone_number}',
        howcountroom: '${widget.howcountroom}',
        universtatenewname: '${widget.univername}',
        images: widget.images,
        stay_region_id: '${widget.stay_region_id}', districtId: widget.districtId, inFloor: widget.inFloor,
      ),
    );
  }
}
