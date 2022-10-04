import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:provider/provider.dart';

import 'package:talaba_uy/core/const/app_colors.dart';

import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/screens/Create_ads/owner_take_photo.dart';
import '../../models/get_district_model.dart';

class Owner extends StatefulWidget {
  const Owner({Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  bool _checkHome = false;
  bool _checkMetro = false;
  String RoomOwner = '';
  String RentOf = '';
  String Subway = '';
  String? _dropownUsd;
  String dropDown = "";
  String TypeHouse = '';
  String CountRoom = '';
  String genderString = '';
  String countRoom = '';
  TextEditingController? addressController;
  TextEditingController? costController;
  TextEditingController? adsTitleController;
  TextEditingController? inputcontroller;
  GetDistrictModel? dropDown1;
  Color _colorRegion = Colors.grey;
  bool _RegionOnClick = false;
  Color _colorDistric = Colors.grey;
  bool _DiscritOnClick = false;
  Color _colorUniver = Colors.grey;
  bool _UniverOnClick = false;
  Color _colorTypeHouse = Colors.grey;
  bool _TypeHouseOnClick = false;
  Color _colorRoomCount = Colors.grey;
  bool _RoomCountOnClick = false;
  Color _colorRentType = Colors.grey;
  bool _RentTypeOnClick = false;
  Color _colorTypeCost = Colors.grey;
  bool _TypeCostOnClick = false;
  Color _colorGender = Colors.grey;
  bool _GenderOnClick = false;
  Color _colorCountPupil = Colors.grey;
  bool _CountPupilOnClick = false;
  Color _colorForm = Colors.grey;
  bool value5 = false;
  var pricetype = [
    "1 ta odam kerak",
    "kishi boshiga 500",
  ];
  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var gender = [
    "O'g'il bolaga",
    'Qiz bolaga',
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

  @override
  void initState() {
    addressController = TextEditingController();
    costController = TextEditingController();
    adsTitleController = TextEditingController();
    inputcontroller = TextEditingController();
    super.initState();
  }
  int id = 1;
  int id2 = 2;
  int id3 = 3;
  int id4 = 4;
  int id5 = 5;
  int idhouse = 6;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value6 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Consumer<RegionProvider>(
          builder: (_, data, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("E’lonni nomlash"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: costController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text("E’lonni nomlang"),
                      labelStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ijaraga beraman".tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 225.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "O’gil bollarga / Qizlarga".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: gender.map((e) {
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
                                _GenderOnClick = true;
                                _colorGender = Colors.grey;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        Text("Ahamiyatsiz"),
                        Checkbox(
                          value: this.value5,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value5 = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text("Viloyat".tr(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                  width: 324.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: _colorRegion),
                  ),
                  child: DropdownButtonFormField(
                    hint: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text("Viloyatni tanlang".tr()),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
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
                      print("Selected ----------- $newValue");
                      final selected = data.regions
                          .where((element) => element.name == newValue);
                      data.getDistrict(selected.last.id!);
                      setState(() {
                        _RegionOnClick = true;
                        _colorRegion = Colors.grey;
                        dropDown = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(height: 12.h),
                Text(
                  "Tuman".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                data.isDistrict
                    ? Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: _colorDistric),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text("Tumanni tanlang".tr()),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          items: data.districts.map((e) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                print("${e.id}");
                                data.districtOwnerId = e.id.toString();
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
                            _DiscritOnClick = true;
                            _colorDistric = Colors.grey;
                            print("Selected ----------- $newValue");
                            setState(() {
                              // dropDown1 = newValue as GetDistrictModel?;
                              dropDown = newValue.toString();
                            });
                          },
                        ),
                      )
                    : Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: _colorDistric),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text("Tumanni tanlang".tr()),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: [],
                            onChanged: null),
                      ),
                SizedBox(height: 12.h),
                Text(
                  "Manzil".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: _colorUniver),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.length > 0) {
                            setState(() {
                              _UniverOnClick = true;
                              _colorUniver = Colors.grey;
                            });
                          } else {
                            setState(() {
                              _UniverOnClick = false;
                              _colorUniver = Colors.red;
                            });
                          }
                        });
                      },
                      controller: addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kvartal , Uy , Xonadon".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Geojoylashishni kiriting").tr(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset("assets/images/maps.png"),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                      "Amir Temur ko’chasi 21, Yunusobod tumani"),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              )
                            ],
                          ),
                          height: 210.h,
                          width: 324.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Metroga yaqinmi ?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  id = 1;
                                });
                              },
                            ),
                            Text(
                              'Ha',
                              style: new TextStyle(fontSize: 17.0),
                            ),
                            SizedBox(
                              width: 55,
                            ),
                            Radio(
                              value: 2,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  id = 2;
                                });
                              },
                            ),
                            Text(
                              "Yo'q",
                              style: new TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Telefon raqami").tr(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 320.w,
                          child: TextFormField(
                            inputFormatters: [
                              TextInputMask(
                                mask: '\\+ 999 99 999 99 99',
                                placeholder: '_ ',
                                maxPlaceHolders: 13,
                              )
                            ],
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.phone,
                            controller: costController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "+998 ** *** ** **".tr(),
                            ),
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     Text("Ko’rinmasin"),
                        //     Checkbox(
                        //       value: this.value5,
                        //       onChanged: (bool? value) {
                        //         setState(() {
                        //           this.value5 = value!;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Uy turi ".tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "Kvartira , Xovli".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: gender.map((e) {
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
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ijara muddatini turi".tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "Kunlik  / Oylik".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: gender.map((e) {
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
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Xonalar soni".tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "Xonalar soni".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: gender.map((e) {
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
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
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
                        SizedBox(height: 4.h),
                        Container(
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "1 - 10".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: gender.map((e) {
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
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
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
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "1 - 10".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: gender.map((e) {
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
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Narxi".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: _colorTypeCost),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.length > 0) {
                            _TypeCostOnClick = true;
                            _colorTypeCost = Colors.grey;
                          } else {
                            _TypeCostOnClick = false;
                            _colorTypeCost = Colors.red;
                          }
                        });
                      },
                      controller: costController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Xonadonni narxini kiriting".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  left:
                                      BorderSide(color: Colors.grey.shade300))),
                          padding: EdgeInsets.only(left: 8.w, top: 0),
                          width: 70,
                          height: 0,
                          child: DropdownButton(
                            underline: Container(),
                            value: _dropownUsd,
                            onChanged: (String? e) {
                              setState(() {
                                _dropownUsd = e;
                              });
                            },
                            hint: Text(
                              "SO'M".tr(),
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.textColor),
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
                  height: 15,
                ),
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
                      width: 150.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: _colorGender)),
                      child: DropdownButtonFormField(
                        hint: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            "Turlari".tr(),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
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
                          setState(() {});
                        },
                      ),
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
                              value: 1,
                              groupValue: idhouse,
                              onChanged: (val) {
                                setState(() {
                                  idhouse = 1;
                                });
                              },
                            ),
                            Text(
                              'Ha',
                              style: new TextStyle(fontSize: 17.0.sp),
                            ),
                            SizedBox(
                              width: 55.w,
                            ),
                            Radio(
                              value: 2,
                              groupValue: idhouse,
                              onChanged: (val) {
                                setState(() {
                                  idhouse = 2;
                                });
                              },
                            ),
                            Text(
                              "Yo'q",
                              style: new TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("Kommunal to’lovlarni kim to’laydi ?"),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Uy egasi"),
                    SizedBox(
                      width: 50.w,
                    ),
                    Text("Ijarachi")
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 1,
                        ),
                        Text("Elektr energiya"),
                        SizedBox(width: 100.w,),
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              id = 1;
                            });
                          },
                        ),
                        SizedBox(width: 50.w,),
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              id = 2;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 1,
                            ),
                            Text("Gaz"),
                            SizedBox(width: 159.w,),
                            Radio(
                              value: 1,
                              groupValue: id2,
                              onChanged: (val) {
                                setState(() {
                                  id2 = 1;
                                });
                              },
                            ),
                            SizedBox(width: 50.w,),
                            Radio(
                              value: 2,
                              groupValue: id2,
                              onChanged: (val) {
                                setState(() {
                                  id2 = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 1,
                            ),
                            Text("Sovuq suv"),
                            SizedBox(width: 126.w,),
                            Radio(
                              value: 1,
                              groupValue: id3,
                              onChanged: (val) {
                                setState(() {
                                  id3 = 1;
                                });
                              },
                            ),
                            SizedBox(width: 50.w,),
                            Radio(
                              value: 2,
                              groupValue: id3,
                              onChanged: (val) {
                                setState(() {
                                  id3 = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 1,
                            ),
                            Text("Issiq suv"),
                            SizedBox(width: 134.w,),
                            Radio(
                              value: 1,
                              groupValue: id4,
                              onChanged: (val) {
                                setState(() {
                                  id4 = 1;
                                });
                              },
                            ),
                            SizedBox(width: 50.w,),
                            Radio(
                              value: 2,
                              groupValue: id4,
                              onChanged: (val) {
                                setState(() {
                                  id4 = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 1,
                            ),
                            Text("Chiqindi"),
                            SizedBox(width: 138.w,),
                            Radio(
                              value: 1,
                              groupValue: id5,
                              onChanged: (val) {
                                setState(() {
                                  id5 = 1;
                                });
                              },
                            ),
                            SizedBox(width: 50.w,),
                            Radio(
                              value: 2,
                              groupValue: id5,
                              onChanged: (val) {
                                setState(() {
                                  id5 = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Quyidagi qulayliklarga ega",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Wi - fi "),
                        SizedBox(width: 103.w,),
                        Checkbox(
                          value: this.value1,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value1 = value!;
                            });
                          },
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Text("TV"),
                        SizedBox(width: 120.w,),
                        Checkbox(
                          value: this.value2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value2 = value!;
                            });
                          },
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Text("Muzlatgich"),
                        SizedBox(width: 75.w,),
                        Checkbox(
                          value: this.value3,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value3 = value!;
                            });
                          },
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Text("Kir yuvish mashinasi "),
                        SizedBox(width: 20.w,),
                        Checkbox(
                          value: this.value4,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value4 = value!;
                            });
                          },
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Text("Konditsioner"),
                        SizedBox(width: 76,),
                        Checkbox(
                          value: this.value6,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value6 = value!;
                            });
                          },
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Text("Chang yutgich"),
                        SizedBox(width: 66,),
                        Checkbox(
                          value: this.value5,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value5 = value!;
                            });
                          },
                        ),

                      ],
                    ),

                  ],
                ),
                Text(
                  "Qo’shimcha ma’lumotlar".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      controller: adsTitleController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Message...'.tr(),
                        border: InputBorder.none,
                        hintStyle:
                        TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerPhotoAdds()));
                          // print(RoomOwner);
                          // print(TypeHouse=='Kvartira'? '1':'2');
                          // print(CountRoom);
                          // print(RentOf == 'kunlik'? '1':'2');
                          // print(costController?.text);//
                          // print(_dropownUsd == "SO'M"? '1':'2');
                          // print(Subway);
                          // print(genderString == 'Erkak'? '1':'2');
                          // print(adsTitleController?.text);//
                          // print(inputcontroller?.text);//
                          // print(addressController?.text);//

                          // if (_RegionOnClick &&
                          //     _DiscritOnClick &&
                          //     _UniverOnClick &&
                          //     _TypeHouseOnClick &&
                          //     _RoomCountOnClick &&
                          //     _RentTypeOnClick &&
                          //     _TypeCostOnClick &&
                          //     _GenderOnClick &&
                          //     _CountPupilOnClick) {
                          // } else {
                          //   setState(() {
                          //     if (!_RegionOnClick) {
                          //       _colorRegion = Colors.red;
                          //     }
                          //     if (!_DiscritOnClick) {
                          //       _colorDistric = Colors.red;
                          //     }
                          //     if (!_UniverOnClick) {
                          //       _colorUniver = Colors.red;
                          //     }
                          //     if (!_TypeHouseOnClick) {
                          //       _colorTypeHouse = Colors.red;
                          //     }
                          //     if (!_RoomCountOnClick) {
                          //       _colorRoomCount = Colors.red;
                          //     }
                          //     if (!_RentTypeOnClick) {
                          //       _colorRentType = Colors.red;
                          //     }
                          //     if (!_TypeCostOnClick) {
                          //       _colorTypeCost = Colors.red;
                          //     }
                          //     if (!_GenderOnClick) {
                          //       _colorGender = Colors.red;
                          //     }
                          //     if (!_CountPupilOnClick) {
                          //       _colorCountPupil = Colors.red;
                          //     }
                          //   });
                          // }
                        },
                        child: Text(
                          "Keyingi ".tr(),
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                      )),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
