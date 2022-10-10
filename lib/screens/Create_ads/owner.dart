import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:provider/provider.dart';

import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/cubit/aut_cubit.dart';

import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/screens/Create_ads/Owner_continue_Ads.dart';
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
  String dropDown2 = "";
  String countRoom = '';
  TextEditingController? titleController;
  TextEditingController? addressController;
  String? roommate_gender;
  String? gender_matter;
  String? district_id;
  String? university_id;
  String? university_id_matter;
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
    titleController = TextEditingController();
    super.initState();
  }

  String id = '1';
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
                Text(
                  "E’lonni nomlash".tr(),
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
                      controller: titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E’lonni nomlang".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.w,
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
                                onTap: () {
                                  setState(() {
                                    roommate_gender =
                                        e == "Qiz bolaga" ? '2' : '1';
                                  });
                                },
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
                    SizedBox(width: 15.w),
                    Column(
                      children: [
                        Text(
                          "Ahamiyatsiz",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        Checkbox(
                          value: this.value5,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value5 = value!;
                              gender_matter = value ? '1' : '2';
                              print(value);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
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
                                data.districtOwnerId = e.id.toString();

                                district_id = e.id.toString();
                                setState(() {});
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
                      height: 5.h,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/images/maps.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Amir Temur ko’chasi 21, Yunusobod tumani",
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                ),
                              )
                            ],
                          ),
                          height: 210.h,
                          width: 324.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
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
                              value: 1,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  id = '1';
                                  print(id);
                                });
                              },
                            ),
                            Text(
                              'Ha',
                              style: new TextStyle(fontSize: 17.0),
                            ),
                            SizedBox(
                              width: 55.w,
                            ),
                            Radio(
                              value: 2,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  id = '2';
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
                Text(
                  "OTM ga yaqinmi ?".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                // Container(
                //   width: 324.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.r),
                //       border: Border.all(color: _colorUniver)),
                //   child: DropdownButtonFormField(
                //     isExpanded: true,
                //     hint: Padding(
                //       padding: EdgeInsets.only(left: 8.w),
                //       child: Text("OTM ni tanlang".tr()),
                //     ),
                //     decoration: InputDecoration(border: InputBorder.none),
                //     // value: ,
                //     icon: Icon(Icons.arrow_drop_down_outlined),
                //     items: data.univer.map((e) {
                //       return DropdownMenuItem<String>(
                //         onTap: () {
                //           data.UniverId = e.id.toString();
                //         },
                //         value: e.name ?? "",
                //         child: SizedBox(
                //           width: MediaQuery.of(context).size.width - 150.w,
                //           child: Padding(
                //             padding: EdgeInsets.only(left: 8.w),
                //             child: Text(e.name.toString()),
                //           ),
                //         ),
                //       );
                //     }).toList(),
                //     onChanged: (newValue) async {
                //       // print("Selected ----------- $newValue");
                //       setState(() {
                //         _UniverOnClick = true;
                //         _colorUniver = Colors.grey;
                //       });
                //       final selected = data.univer
                //           .where((element) => element.name == newValue);
                //       data.getFaculty(selected.last.id!);
                //       setState(() {
                //         dropDown2 = newValue.toString();
                //       });
                //     },
                //   ),
                // ),
                Row(
                  children: [
                    Container(
                      width: 240.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: _colorUniver)),
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        items: data.univer.map((e) {
                          if (dropDown2 == e.name) {
                            data.UniverId = e.id.toString();
                            data.isId = e.id;
                            university_id = e.id.toString();
                          }

                          // final selected = data.univer.where((element) => element.name == e.name);
                          // data.getFaculty(selected.last.id!);
                          return context.read<AutCubit>().selectedLang.index ==
                                  1
                              ? e.name.toString()
                              : e.nameRu.toString();
                        }).toList(),
                        showSearchBox: true,
                        // label: "Menu mode",
                        // hint: "country in menu mode",
                        onChanged: (value) async {
                          data.isUniver = true;
                          final selected = data.univer
                              .where((element) => element.name == value);
                          data.getFaculty(selected.last.id!);
                          // data.getFaculty(data.isId!);
                          setState(() {
                            dropDown2 = value.toString();
                            _UniverOnClick = true;
                            _colorUniver = Colors.grey;
                          });
                        },
                        selectedItem: tr("OTM ni tanlang"),
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "Ahamiyatsiz",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Checkbox(
                          value: this.value5,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value5 = value!;
                              university_id_matter = value ? '1' : '2';
                            });
                          },
                        ),
                      ],
                    )
                  ],
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OwnerHouseInfo(titleController!.text, roommate_gender, gender_matter, district_id, id, addressController!.text,  university_id, university_id_matter)));
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
