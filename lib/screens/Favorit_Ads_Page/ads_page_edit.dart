import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Create_ads/owner.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/ads_edit.dart';

import '../../provider/region_provider.dart';

class AdspageEdit extends StatefulWidget {
  String? title;
  String? description;
  String? houseType;
  String? cost;
  String? costType;
  String? countRoom;
  String? countPeople;
  String? liveWithOwner;
  String? subway;
  String? favorite;
  String? id;
  String? type;
  int? userId;
  String? phoneNumber;
  String? comfort;
  String? inFloor;
  String? roommate_count;
  String? address;
  String? roommate_gender;
  String? locations;
  List? Image;
  String university;
  String? region;
  String? rentType;
  String? floors_count;
  String? cost_period;

  AdspageEdit(
      this.title,
      this.description,
      this.houseType,
      this.cost,
      this.costType,
      this.countRoom,
      this.countPeople,
      this.liveWithOwner,
      this.subway,
      this.favorite,
      this.id,
      this.type,
      this.userId,
      this.phoneNumber,
      this.comfort,
      this.inFloor,
      this.roommate_count,
      this.address,
      this.roommate_gender,
      this.locations,
      this.Image,
      this.university,
      this.region,
      this.rentType,
      this.floors_count,
      this.cost_period,
      {Key? key})
      : super(key: key);

  @override
  State<AdspageEdit> createState() => _AdspageEditState();
}

class _AdspageEditState extends State<AdspageEdit>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    super.initState();

    Provider.of<RegionProvider>(context, listen: false).getUnivers();
    Provider.of<RegionProvider>(context, listen: false).getRegion().asStream();
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
        title: Text("E’lon yaratish".tr(),
            style: TextStyle(color: AppColors.mainColor)),
        centerTitle: true,
      ),
      body: AdsEdit(
        widget.title,
        widget.description,
        widget.houseType,
        widget.cost,
        widget.costType,
        widget.countRoom,
        widget.countPeople,
        widget.liveWithOwner,
        widget.subway,
        widget.favorite,
        widget.id,
        widget.type,
        widget.userId,
        widget.phoneNumber,
        widget.comfort,
        widget.inFloor,
        widget.roommate_count,
        widget.address,
        widget.roommate_gender,
        widget.locations,
        widget.Image,
        widget.university,
        widget.region,
        widget.rentType,
        widget.floors_count,
        widget.cost_period,
      ),
    );
  }
}
