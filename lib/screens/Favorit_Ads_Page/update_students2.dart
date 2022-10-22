import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/provider/favorite_provider.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/StudentEdit_post_last%20_page.dart';
import 'package:talaba_uy/screens/Google_map/map_screen.dart';

import '../../core/const/app_colors.dart';
import '../../provider/region_provider.dart';

class StudensEdits2 extends StatefulWidget {
  String titlecontroller1;
  String viloyatidisi;
  String viloyatvalue;
  String universiteteid;
  String univervalue;
  String titleGendor;
  String titlecount;
  String phoneController;
  String house;
  String addinformation;
  String numbervalue;
  String viloyatname;
  String tuman;
  String adress;
  String Subway;
  String housetype;
  String honasoni;
  String qavatlar;
  String etaj;
  String cost;
  String costtype;
  String rent_type;
  String cost_period;
  String live_with_owner;
  String utility_bills;
  String comfort;
  String images;
  String updateidi;

  StudensEdits2({
    Key? key,
    required this.updateidi,
    required this.images,
    required this.comfort,
    required this.utility_bills,
    required this.cost_period,
    required this.live_with_owner,
    required this.costtype,
    required this.rent_type,
    required this.cost,
    required this.etaj,
    required this.honasoni,
    required this.qavatlar,
    required this.univervalue,
    required this.housetype,
    required this.Subway,
    required this.adress,
    required this.tuman,
    required this.viloyatname,
    required this.numbervalue,
    required this.house,
    required this.titlecontroller1,
    required this.viloyatidisi,
    required this.addinformation,
    required this.phoneController,
    required this.titlecount,
    required this.titleGendor,
    required this.universiteteid,
    required this.viloyatvalue,
  }) : super(key: key);

  @override
  State<StudensEdits2> createState() => _StudensEdits2State();
}

class _StudensEdits2State extends State<StudensEdits2> {
  TextEditingController? titlecontroller;
  TextEditingController? addressController;
  TextEditingController? othercontroller;
  TextEditingController? narxcontroller;
  TextEditingController? costcontroller;
  String dropDown = "";
  String dropDown2 = "";
  String DistrictId = '';
  String UniverId = '';
  String Course = '';
  String FakultetId = '';
  String RoomOwner = '';
  String TypeHouse = '';
  String TypeOfRent = '';
  String typeOfPayment = '';
  String subwayof = '';
  String gender = '';
  String CourseCount = '';
  String roomCount = '';
  String price = '';
  String pricerent_type = '';
  String priceturi = '';
  String housetype = '';
  String? _dropownUsd;
  Color _colorRegion = Colors.grey;
  bool _RegionOnClick = false;
  Color _colorDistric = Colors.grey;
  Color _colorGender = Colors.grey;
  bool _GenderOnClick = false;
  Color _colorCountPupil = Colors.grey;
  bool _CountPupilOnClick = false;
  Color _colorForm = Colors.grey;
  bool _FormOnClick = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  List comfort = [];
  bool value6 = false;
  var metro = "0";
  var ownerlive = "0";
  var costcommunal = "0";

  var pricetype = ["kunlik", "oylik", "kishi boshiga"];
  String? cost_type;
  final TextEditingController _textEditingController = TextEditingController();
  var kurs = [
    '1-kurs',
    '2-kurs',
    '3-kurs',
    '4-kurs',
    '5-kurs',
    '6-kurs',
  ];
  var housecost = ["oylik", "kunlik", "uzoq muddatga"];
  final List<String> genderItems = ["O'g'il bola ", "Qiz bola"];
  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var floors_count = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  var in_floor = [
    '1 ',
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
  ];
  var kindOfMoment = [
    'kunlik',
    'oylik',
  ];
  var rooms = [
    '1',
    '2',
    '3',
    '4',
    '5-6',
  ];
  var ijarachi = [
    '1',
    '2',
    '3',
    '4',
    '5-6',
  ];
  var countroums = [
    "1 ",
    "2",
    "3",
    "4",
    "5 ",
  ];
  Color _costTypeColor = Colors.grey;
  final _formKey = GlobalKey<FormState>();
  String? housecount;
  String? howcountroom;
  String? housefloorcount;
  String? narxnituri;
  String? rent_type;
  String? cost_period;
  String? uyturi;
  String? narxturi;
  String? cost_period1;
  int _correntPage = 0;

  @override
  void initState() {
    late List<String> haveComfort = widget.comfort.split(',');
    String comfortList = widget.comfort;

    titlecontroller = TextEditingController();
    othercontroller = TextEditingController();
    addressController = TextEditingController(text: widget.adress);
    costcontroller = TextEditingController(text: widget.cost);

    for (String i in haveComfort) {
      print(i);
      if (i == '1') {
        value1 = true;
      }
      if (i == '2') value2 = true;
      if (i == '3') value3 = true;
      if (i == '4') value4 = true;
      if (i == '5') value5 = true;
      if (i == '6') value6 = true;
    }

    if (widget.Subway == '0') {
      metro = '1';
    } else {
      metro = '2';
    }
    if (widget.utility_bills == '0') {
      costcommunal = '1';
    } else {
      costcommunal = '2';
    }
    if (widget.live_with_owner == '0') {
      ownerlive = '1';
    } else {
      ownerlive = '2';
    }
    if (widget.costtype == '1') {
      pricerent_type = '1';
    } else {
      pricerent_type = '2';
    }
    uyturi = widget.housetype == ''
        ? "kv / hovli"
        : widget.housetype == '1'
            ? 'Kv '
            : "Hovli";
    narxturi = widget.rent_type == ''
        ? "kunlik / oylik"
        : widget.housetype == '1'
            ? 'kunlik '
            : "oylik";
    cost_period1 = widget.cost_period == ''
        ? "kunlik / oylik"
        : widget.housetype == ''
            ? 'kunlik '
            : "kishi boshiga";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "E'lon yaratish",
            style: TextStyle(color: AppColors.mainColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Consumer<RegionProvider>(
            builder: (_, data, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Viloyat".tr(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: _colorRegion)),
                    child: DropdownButtonFormField(
                      hint: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(widget.viloyatname.tr()),
                      ),
                      decoration: InputDecoration(border: InputBorder.none),
                      // value: ,
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      items: data.regions.map((e) {
                        return DropdownMenuItem<String>(
                          value: e.name ?? "",
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(e.name.toString()),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) async {
                        setState(() {
                          _RegionOnClick = true;
                          _colorRegion = Colors.grey;
                        });

                        final selected = data.regions
                            .where((element) => element.name == newValue);
                        data.getDistrict(selected.last.id!);
                        setState(() {
                          dropDown = newValue.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [Text("Tuman")],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  data.isDistrict
                      ? Container(
                          width: 324.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: _colorDistric,
                              ),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(widget.tuman.tr()),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: data.districts.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {
                                  print("${e.name}${e.id}");
                                  data.districtId = e.id.toString();
                                },
                                value: data.isDistrict
                                    ? e.name.toString()
                                    : data.defaultvalue,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(data.isDistrict
                                      ? e.name.toString()
                                      : data.defaultvalue),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _colorDistric = Colors.grey;
                                dropDown = newValue.toString();
                              });
                            },
                          ),
                        )
                      : Container(
                          width: 324.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                              isExpanded: true,
                              hint: Text(widget.tuman.tr()),
                              decoration: const InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.grey),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: [],
                              onChanged: null),
                        ),
                  SizedBox(height: 12.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Manzil").tr(),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 55.h,
                            width: 324.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: addressController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Kvartal , Uy , Xonadon ".tr(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()));
                      },
                      child: Container(
                        width: 324.w,
                        height: 60.h,
                        child: Card(
                          shadowColor: AppColors.buttonLinear,
                          child: ListTile(
                            title: Text("Geojoylashishni kiriting").tr(),
                            leading: Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Metroga yaqinmi ?",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: '1',
                                groupValue: metro,
                                onChanged: (String? val) {
                                  setState(() {
                                    metro = val!;
                                    print(metro);
                                  });
                                },
                              ),
                              Text(
                                'Ha',
                                style: new TextStyle(fontSize: 17.0),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              Radio(
                                value: '2',
                                groupValue: metro,
                                onChanged: (String? val) {
                                  setState(() {
                                    metro = val!;
                                  });
                                },
                              ),
                              Text(
                                "Yo'q",
                                style: new TextStyle(
                                  fontSize: 17.0.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Uy turi".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: _colorGender)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.housetype == ''
                                      ? "kv  / Hovli".tr()
                                      : uyturi.toString(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: kvartira.map((e) {
                                return DropdownMenuItem<String>(
                                  onTap: () {},
                                  value: e,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(e.tr()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  housetype = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                                print(housetype + "1 kunlik 2 kvartira");
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Xonalar soni ?".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: _colorGender)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.honasoni.tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: countroums.map((e) {
                                return DropdownMenuItem<String>(
                                  onTap: () {},
                                  value: e,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(e.tr()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  housecount = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Qavatlar soni ".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: _colorGender)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.qavatlar.tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: floors_count.map((e) {
                                return DropdownMenuItem<String>(
                                  onTap: () {},
                                  value: e,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(e.tr()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  housefloorcount = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nechinchi qavatda ?".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: _colorGender)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.etaj.tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: in_floor.map((e) {
                                return DropdownMenuItem<String>(
                                  onTap: () {},
                                  value: e,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(e.tr()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  howcountroom = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Narxi".tr(),
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: _costTypeColor),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w),
                      child: TextFormField(
                        onChanged: (e) {
                          setState(() {
                            if (e.length > 0) {
                              _costTypeColor = Colors.grey;
                            } else {
                              _costTypeColor = Colors.red;
                            }
                          });
                        },
                        controller: costcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Xonadonni narxini kiriting".tr(),
                          hintStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.grey),
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.grey.shade300))),
                            padding: EdgeInsets.only(left: 8.w, top: 0),
                            width: 70.w,
                            height: 0.h,
                            child: DropdownButton(
                              underline: Container(),
                              value: _dropownUsd,
                              onChanged: (String? e) {
                                setState(() {
                                  _dropownUsd = e;
                                  pricerent_type = e == 'sum' ? '1' : '2';
                                });
                              },
                              hint: Text(
                                "SO'M".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.textColor),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "SO'M".tr(),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.textColor),
                                  ),
                                  value: "sum",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "USD",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.textColor),
                                  ),
                                  value: "usd",
                                )
                              ],
                            ),
                          ),
                        ),
                        cursorColor: Colors.grey.shade800,
                        cursorWidth: 1.5.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Narxning turlanishi".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            height: 50.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.cost_period == ''
                                      ? "kunlik  / oylik".tr()
                                      : cost_period1.toString(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: pricetype.map((e) {
                                return DropdownMenuItem<String>(
                                  onTap: () {},
                                  value: e,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(e.tr()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue == 'kunlik') {
                                    price = '1';
                                  } else if (newValue == 'oylik') {
                                    price = '2';
                                  }
                                  print(pricerent_type);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Narxning turlanishi".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: _colorGender)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.rent_type == ''
                                      ? "kunlik  / oylik".tr()
                                      : narxturi.toString(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: housecost.map((e) {
                                return DropdownMenuItem<String>(
                                  onTap: () {},
                                  value: e,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(e.tr()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  rent_type = newValue.toString();
                                  _colorGender = Colors.grey;
                                  if (newValue == 'kunlik') {
                                    price = '1';
                                  } else if (newValue == 'oylik') {
                                    price = '2';
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Uy egasi ham yashaydimi ?",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: '1',
                                groupValue: ownerlive,
                                onChanged: (String? val) {
                                  setState(() {
                                    ownerlive = val!;
                                  });
                                },
                              ),
                              Text(
                                'Ha',
                                style: new TextStyle(fontSize: 17.0),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              Radio(
                                value: '2',
                                groupValue: ownerlive,
                                onChanged: (String? val) {
                                  setState(() {
                                    ownerlive = val!;
                                  });
                                },
                              ),
                              Text(
                                "Yo'q",
                                style: new TextStyle(
                                  fontSize: 17.0.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Kommunal to’lovlarini kim to’laydi ?",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: '1',
                                groupValue: costcommunal,
                                onChanged: (String? val) {
                                  setState(() {
                                    costcommunal = val!;
                                    print(metro);
                                  });
                                },
                              ),
                              Text(
                                'Uy egasi',
                                style: new TextStyle(fontSize: 17.0),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Radio(
                                value: '2',
                                groupValue: costcommunal,
                                onChanged: (String? val) {
                                  setState(() {
                                    costcommunal = val!;
                                  });
                                },
                              ),
                              Text(
                                "Ijarachi",
                                style: new TextStyle(
                                  fontSize: 17.0.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Quyidagi qulayliklarga ega",
                        style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 170.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Wi - fi "),
                            Checkbox(
                              value: value1,
                              onChanged: (bool? value) {
                                setState(() {
                                  value1 = value!;
                                  if (value) {
                                    comfort.add('1');
                                  } else {
                                    comfort.remove('1');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("TV"),
                            Checkbox(
                              value: this.value2,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value2 = value!;
                                  if (value) {
                                    comfort.add('2');
                                  } else {
                                    comfort.remove('2');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Muzlatgich"),
                            Checkbox(
                              value: this.value3,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value3 = value!;
                                  if (value) {
                                    comfort.add('3');
                                  } else {
                                    comfort.remove('3');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Kir yuvish mashinasi"),
                            Checkbox(
                              value: value4,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value4 = value!;
                                  if (value) {
                                    comfort.add('4');
                                  } else {
                                    comfort.remove('4');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Konditsioner"),
                            Checkbox(
                              value: value5,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value5 = value!;
                                  if (value) {
                                    comfort.add('5');
                                  } else {
                                    comfort.remove('5');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Chang yutgich"),
                            Checkbox(
                              value: value6,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value6 = value!;
                                  if (value) {
                                    comfort.add('6');
                                  } else {
                                    comfort.remove('6');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 31.w),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            primary: AppColors.buttonLinear),
                        onPressed: () {
                          final map = context.read<FavoriteProvider>();
                          String comfortItems = comfort.join(',');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostEditStudent(
                                updateid: '${widget.updateidi}',
                                images: '${widget.images}',
                                  universiteteid: widget.universiteteid,
                                  house: widget.house,
                                  titleGendor: widget.titleGendor,
                                  numbervalue: widget.numbervalue,
                                  viloyatvalue: widget.viloyatvalue,
                                  phoneController: widget.phoneController,
                                  titlecontroller1: widget.titlecontroller1,
                                  addinformation: widget.addinformation,
                                  univervalue: widget.univervalue,
                                  titlecount: widget.titlecount,
                                  viloyatidisi: widget.viloyatidisi,
                                  comfort: comfortItems,
                                  costlivekomunal: costcommunal.toString() == 'ha' ? '1' : '2',
                                  metro: metro.toString() == 'ha' ? '1' : '2',
                                  countroom: housefloorcount.toString(),
                                  housetype: housetype== 'kv' ? '1' : '2',
                                  howcountroom: howcountroom.toString(),
                                  narxnituri: pricerent_type,
                                  addressController: addressController!.text,
                                  housecount: housecount.toString(),
                                  ownerlive: ownerlive.toString(),
                                  costController:costcontroller!.text,
                                  rent_type: price,
                                  cost_period: price,
                                  location:'${map.forMap}',
                                  ),
                            ),
                          );
                        },
                        child: Text(
                          "Keyingi ".tr(),
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}
