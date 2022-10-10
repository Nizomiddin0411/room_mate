import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Create_ads/owner_photo.dart';

import '../../core/const/app_colors.dart';
import 'owner_take_photo.dart';


class OwnerHouseInfo extends StatefulWidget {
  String? titleController;
  String? addressController;
  String? roommate_gender;
  String? gender_matter;
  String? district_id;
  String? university_id;
  String? university_id_matter;
  String? id;

  OwnerHouseInfo(
    this.titleController,
    this.roommate_gender,
    this.gender_matter,
    this.district_id,
    this.id,
    this.addressController,
    this.university_id,
    this.university_id_matter,
  );

  @override
  State<OwnerHouseInfo> createState() => _OwnerHouseInfoState();
}

class _OwnerHouseInfoState extends State<OwnerHouseInfo> {
  TextEditingController? phoneController = TextEditingController();
  String? house_type;
  String? rent_type;
  String? room_count;
  String? floors_count;
  String? in_floor;
  TextEditingController descriptionController = TextEditingController();
  String? cost_type;
  String? live_with_owner;
  String? utility_electricity;
  String? unility_gaz;
  String? utility_hot_water;
  String? utility_cold_water;
  String? utility_trash;
  String comfort = '';
  String? description;

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
  TextEditingController? addressController;
  TextEditingController? costController;
  TextEditingController? adsTitleController;
  TextEditingController? inputcontroller;
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
  var housetype = [
    "Hovli",
    'Kvartira',
  ];
  var houseroom = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  var ijaramuddat = [
    "Kunlik",
    "Oylik",
    "Uzoq muddat",
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
  int id1 = 1;
  int id2 = 1;
  int id3 = 1;
  int id4 = 1;
  int id5 = 1;
  int idhouse = 6;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          "E’lon yaratish",
          style: TextStyle(color: Colors.blue),
        )),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
        child: Column(
          children: [
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
                        controller: phoneController,
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
                SizedBox(
                  height: 18.h,
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
                            items: housetype.map((e) {
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
                                house_type = newValue == 'Hovli' ? '2' : '1';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60.w,
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
                            items: ijaramuddat.map((e) {
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
                                rent_type = newValue == 'Kunlik'
                                    ? '1'
                                    : newValue == 'Oylik'
                                        ? '2'
                                        : '3';
                              });
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
                            items: rooms.map((e) {
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
                                room_count = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.w,
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
                            items: houseroom.map((e) {
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
                                floors_count = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 65.w,
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
                            items: rooms.map((e) {
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
                                in_floor = newValue.toString();
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
                          width: 70.w,
                          height: 0.h,
                          child: DropdownButton(
                            underline: Container(),
                            value: _dropownUsd,
                            onChanged: (String? e) {
                              setState(() {
                                _dropownUsd = e;
                                cost_type = e == 'sum' ? '1' : '2';
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
                              setState(() {
                                print(newValue);
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
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Uy egasi ham yashaydimi ?",
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                          style: new TextStyle(fontSize: 17.0.sp),
                        ),
                        SizedBox(
                          width: 35.w,
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
                            fontSize: 17.0.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Kommunal to’lovlarni kim to’laydi ?",
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
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
                        Container(
                          width: 180.w,
                          child: Text("Elektr energiya"),
                        ),
                        Radio(
                          value: 1,
                          groupValue: id1,
                          onChanged: (val) {
                            setState(() {
                              id1 = 1;
                            });
                          },
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Radio(
                          value: 2,
                          groupValue: id1,
                          onChanged: (val) {
                            setState(() {
                              id1 = 2;
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
                        Container(
                          width: 180.w,
                          child: Text("Gaz"),
                        ),
                        Radio(
                          value: 1,
                          groupValue: id2,
                          onChanged: (val) {
                            setState(() {
                              id2 = 1;
                            });
                          },
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
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
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(width: 180.w, child: Text("Sovuq suv")),
                            Radio(
                              value: 1,
                              groupValue: id3,
                              onChanged: (val) {
                                setState(() {
                                  id3 = 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
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
                            Container(width: 180.w, child: Text("Issiq suv")),
                            Radio(
                              value: 1,
                              groupValue: id4,
                              onChanged: (val) {
                                setState(() {
                                  id4 = 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
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
                              height: 1.h,
                            ),
                            Container(width: 180.w, child: Text("Chiqindi")),
                            Radio(
                              value: 1,
                              groupValue: id5,
                              onChanged: (val) {
                                setState(() {
                                  id5 = 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
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
                      style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 190.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Wi - fi "),
                              Checkbox(
                                value: this.value1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value1 = value!;
                                    comfort += '1';
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
                                    comfort += '2';
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
                                    comfort += '3';
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
                                value: this.value4,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value4 = value!;
                                    comfort += '4';
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
                                value: this.value6,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value6 = value!;
                                    comfort += '5';
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
                                value: this.value5,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value5 = value!;
                                    comfort += '6';
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
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
                      controller: descriptionController,
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
                          live_with_owner = id.toString();
                          utility_electricity = id1.toString();
                          unility_gaz = id2.toString();
                          utility_hot_water = id3.toString();
                          utility_cold_water = id4.toString();
                          utility_trash = id5.toString();
                          comfort = comfort.split('').join(',');
                          // print(live_with_owner.toString() + "A");
                          // print(utility_electricity.toString() + "B");
                          // print(unility_gaz.toString() + "C");
                          // print(utility_hot_water.toString() + "D");
                          // print(utility_cold_water.toString() + "E");
                          // print(utility_trash.toString() + "F");
                          print(comfort);
                          setState(() {});
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OwnerCreateImage(
                                        widget.titleController,
                                        widget.roommate_gender,
                                        widget.gender_matter,
                                        widget.district_id,
                                        widget.id,
                                        widget.addressController,
                                        widget.university_id,
                                        widget.university_id_matter,
                                        phoneController!.text.split(' ').join(''),
                                        house_type,
                                        rent_type,
                                        room_count,
                                        floors_count,
                                        in_floor,
                                        costController!.text.split(' ').join(''),
                                        cost_type,
                                        live_with_owner,
                                        utility_electricity,
                                        unility_gaz,
                                        utility_hot_water,
                                        utility_cold_water,
                                        utility_trash,
                                        comfort,
                                        description
                                      )));
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
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
