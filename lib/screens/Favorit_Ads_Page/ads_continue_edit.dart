import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Create_ads/owner_photo.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/ads_photo_edit.dart';

import '../../core/const/app_colors.dart';

class AdsContinueEdit extends StatefulWidget {
  String? id;
  String? addressController;
  String? university_id;
  String? roommate_gender;
  String? university_id_matter;
  String? gender_matter;
  String? district_id;
  String? titleController;
  String? location;
  String? phoneNumber;
  String? houseType;
  String? rent_type;
  String? room_count;
  String? floors_count;
  String? in_floor;
  String? cost;
  String? cost_period;
  String? description;
  String? live_with_owner;
  String? comfort;
  String? utility_electricity;
  String? unility_gaz;
  String? utility_hot_water;
  String? utility_cold_water;
  String? utility_trash;
  String subway;
  List<dynamic>? Image;

  AdsContinueEdit({
    required this.id,
    required this.addressController,
    required this.university_id,
    required this.roommate_gender,
    required this.university_id_matter,
    required this.gender_matter,
    required this.district_id,
    required this.titleController,
    required this.location,
    required this.phoneNumber,
    required this.houseType,
    required this.rent_type,
    required this.room_count,
    required this.floors_count,
    required this.in_floor,
    required this.cost,
    required this.cost_period,
    required this.description,
    required this.live_with_owner,
    required this.comfort,
    required this.utility_electricity,
    required this.unility_gaz,
    required this.utility_hot_water,
    required this.utility_cold_water,
    required this.utility_trash,
    required this.subway,
    required this.Image,
  });

  @override
  State<AdsContinueEdit> createState() => _AdsContinueEditState();
}

class _AdsContinueEditState extends State<AdsContinueEdit> {
  TextEditingController? phoneController;
  String? house_type;
  String? rent_type;
  String? room_count;
  String? floors_count;
  String? in_floor;
  TextEditingController? descriptionController;
  String? cost_type;
  String? live_with_owner;
  String? utility_electricity;
  String? unility_gaz;
  String? utility_hot_water;
  String? utility_cold_water;
  String? utility_trash;
  List comfort = [];
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
  String price = '';
  TextEditingController? addressController;
  TextEditingController? costController;
  TextEditingController? adsTitleController;
  TextEditingController? inputcontroller;
  Color _phoneNumberColor = Colors.grey;
  bool _phoneNumberOnClick = true;
  Color _houseTypeColor = Colors.grey;
  bool _houseTypeOnClick = true;
  Color _rentTypeColor = Colors.grey;
  bool _rentTypeOnClick = true;
  Color _roomCountColor = Colors.grey;
  bool _roomCountOnClick = true;
  Color _floorsCountColor = Colors.grey;
  bool _floorsCountOnClick = true;
  Color _inFloorColor = Colors.grey;
  bool _inFloorOnClick = true;
  Color _costTypeColor = Colors.grey;
  bool _costTypeOnClick = true;
  Color _descriptionColor = Colors.grey;
  bool _descriptionOnClick = true;
  Color _priceColor = Colors.grey;
  bool _priceOnClick = true;
  Color _colorForm = Colors.grey;
  Color costColor = Colors.black54;
  Color phoneColor = Colors.black54;
  String? id;
  String? id1;
  String? id2;
  String? id3;
  String? id4;
  String? id5;
  int idhouse = 6;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  var pricetype = [
    "kunlik",
    "oylik",
    "kishi boshiga",
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
    "6",
    "7",
    "8",
    "9",
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
    '5',
    '6',
    '7',
    '8',
    '9',
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
    costController = TextEditingController(text: widget.cost);
    adsTitleController = TextEditingController();
    inputcontroller = TextEditingController();
    phoneController = TextEditingController(text: widget.phoneNumber);
    descriptionController = TextEditingController(text: widget.description);

    late List<String> haveComfort = widget.comfort!.split(',');
    for (String i in haveComfort) {
      if (i == '1') {
        value1 = true;
      }
      if (i == '2') value2 = true;
      if (i == '3') value3 = true;
      if (i == '4') value4 = true;
      if (i == '5') value5 = true;
      if (i == '6') value6 = true;
    }

    id = widget.live_with_owner;
    id1 = widget.utility_electricity;
    id2 = widget.unility_gaz;
    id3 = widget.utility_hot_water;
    id4 = widget.utility_cold_water;
    id5 = widget.utility_trash;
    // if (widget.live_with_owner == '0') {
    //   ownerlive = '1';
    // } else {
    //   ownerlive = '2';
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.subway.toString() + "idddda+++");

    //  print(id1);
    // print(id2);
    // print(id3);
    // print(id4);
    // print(id5);
    // print('aa');
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
        title: const Center(
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
                  height: 5.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 320.w,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: _phoneNumberColor),
                          borderRadius: BorderRadius.circular(6.r)),
                      child: TextFormField(
                        style: TextStyle(color: phoneColor, fontSize: 16.sp),
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
                          border: InputBorder.none,
                          hintText: "+998 ** *** ** **".tr(),
                        ),
                        onChanged: (e) {
                          setState(() {
                            phoneColor = Colors.black87;
                            if (e.length == 18) {
                              _phoneNumberOnClick = true;
                              _phoneNumberColor = Colors.grey;
                            } else {
                              _phoneNumberOnClick = false;
                              _phoneNumberColor = Colors.red;
                            }
                          });
                        },
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
                          "Uy turi".tr(),
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
                              border: Border.all(color: _houseTypeColor)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.houseType == '2'
                                    ? 'Hovli'.tr()
                                    : widget.houseType == '1'
                                        ? 'Kvartira'.tr()
                                        : "Kvartira , Xovli".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: housetype.map((e) {
                              house_type = widget.houseType;
                              print(widget.houseType);
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e.tr(),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                house_type = newValue == 'Hovli'.tr() ? '2' : '1';
                                _houseTypeOnClick = true;
                                _houseTypeColor = Colors.grey;
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
                          width: 134.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _rentTypeColor)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.rent_type == '1'
                                    ? 'Kunlik'
                                    : widget.rent_type == '2'
                                        ? "Oylik"
                                        : widget.rent_type == '3'
                                            ? "Uzoq muddat"
                                            : "Kunlik  / Oylik".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: ijaramuddat.map((e) {
                              rent_type = widget.rent_type;
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
                                rent_type = newValue == 'Kunlik'.tr()
                                    ? '1'
                                    : newValue == 'Oylik'.tr()
                                        ? '2'
                                        : '3';
                                _rentTypeOnClick = true;
                                _rentTypeColor = Colors.grey; 
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
                              border: Border.all(color: _roomCountColor)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.room_count.toString(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: ijarachi.map((e) {
                              room_count = widget.room_count;
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
                                _roomCountOnClick = true;
                                _roomCountColor = Colors.grey;
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
                              border: Border.all(color: _floorsCountColor)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.floors_count.toString(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: houseroom.map((e) {
                              floors_count = widget.floors_count;
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
                                _floorsCountOnClick = true;
                                _floorsCountColor = Colors.grey;
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
                              border: Border.all(color: _inFloorColor)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.in_floor.toString(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: rooms.map((e) {
                              in_floor = widget.in_floor;
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
                                _inFloorOnClick = true;
                                _inFloorColor = Colors.grey;
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
                      border: Border.all(color: _costTypeColor),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (e) {
                        setState(() {
                          costColor = Colors.black87;
                          if (e.length > 0) {
                            _costTypeOnClick = true;
                            _costTypeColor = Colors.grey;
                          } else {
                            _costTypeOnClick = false;
                            _costTypeColor = Colors.red;
                          }
                        });
                      },
                      controller: costController,
                      style: TextStyle(color: costColor, fontSize: 16.sp),
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
                              border: Border.all(color: _priceColor)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.cost_period == '1'
                                    ? "kunlik"
                                    : widget.cost_period == '2'
                                        ? "oylik"
                                        : widget.cost_period == '3'
                                            ? "kishi boshiga"
                                            : "Turlari".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: pricetype.map((e) {
                              price = widget.cost_period.toString();
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
                                if (newValue == 'kunlik') {
                                  price = '1';
                                } else if (newValue == 'oylik') {
                                  price = '2';
                                } else {
                                  price = '3';
                                }
                                _priceOnClick = true;
                                _priceColor = Colors.grey;
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
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: '1',
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              id = val.toString();
                            });
                          },
                        ),
                        Text(
                          'Ha',
                          style:  TextStyle(fontSize: 14.0.sp),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        Radio(
                          value: '2',
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              id = val.toString();
                            });
                          },
                        ),
                        Text(
                          "Yo'q",
                          style:  TextStyle(
                            fontSize: 14.0.sp,
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
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 172.w,
                    ),
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
                          height: 1.h,
                        ),
                        Container(
                          width: 180.w,
                          child:  Text("Elektr energiya"),
                        ),
                        Radio(
                          value: '1',
                          groupValue: id1,
                          onChanged: (val) {
                            setState(() {
                              id1 = '1';
                            });
                          },
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Radio(
                          value: '2',
                          groupValue: id1,
                          onChanged: (val) {
                            setState(() {
                              id1 = '2';
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
                        SizedBox(
                          width: 180.w,
                          child: Text("Gaz"),
                        ),
                        Radio(
                          value: '1',
                          groupValue: id2,
                          onChanged: (val) {
                            setState(() {
                              id2 = val.toString();
                            });
                          },
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Radio(
                          value: '2',
                          groupValue: id2,
                          onChanged: (val) {
                            setState(() {
                              id2 = val.toString();
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
                            SizedBox(width: 180.w, child: Text("Sovuq suv")),
                            Radio(
                              value: '1',
                              groupValue: id3,
                              onChanged: (val) {
                                setState(() {
                                  id3 = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Radio(
                              value: '2',
                              groupValue: id3,
                              onChanged: (val) {
                                setState(() {
                                  id3 = val.toString();
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
                            SizedBox(width: 180.w, child: const Text("Issiq suv")),
                            Radio(
                              value: '1',
                              groupValue: id4,
                              onChanged: (val) {
                                setState(() {
                                  id4 = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Radio(
                              value: '2',
                              groupValue: id4,
                              onChanged: (val) {
                                setState(() {
                                  id4 = val.toString();
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
                            SizedBox(width: 180.w, child: const Text("Chiqindi")),
                            Radio(
                              value: '1',
                              groupValue: id5,
                              onChanged: (val) {
                                setState(() {
                                  id5 = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Radio(
                              value: '2',
                              groupValue: id5,
                              onChanged: (val) {
                                setState(() {
                                  id5 = val.toString();
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
                      "Quyidagi qulayliklarga ega.",
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 228.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Wi - fi "),
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
                              const Text("TV"),
                              Checkbox(
                                value: value2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value2 = value!;
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
                              const Text("Muzlatgich"),
                              Checkbox(
                                value: value3,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value3 = value!;
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
                              const Text("Kir yuvish mashinasi"),
                              Checkbox(
                                value: value4,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value4 = value!;
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
                              const Text("Konditsioner"),
                              Checkbox(
                                value: value5,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value5 = value!;
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
                              const Text("Chang yutgich"),
                              Checkbox(
                                value: value6,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value6 = value!;
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
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text(
                      "Qo’shimcha ma’lumotlar".tr(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
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
                  child: SizedBox(
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
                          String comfortItems = comfort.join(',');
                          // print(live_with_owner.toString() + "A");
                          // print(utility_electricity.toString() + "B");
                          // print(unility_gaz.toString() + "C");
                          // print(utility_hot_water.toString() + "D");
                          // print(utility_cold_water.toString() + "E");
                          // print(utility_trash.toString() + "F");
                          // print(comfortItems);
                          setState(() {});

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
                          print('${phoneController!.text.split(' ').join('')}' +
                              ' telefon');
                          print('${house_type}  uy turi');
                          print('${rent_type} rent type');
                          print('${room_count}  hona soni');
                          print('${floors_count} etaj soni');
                          print('${in_floor} nechanchi etaj');
                          print(
                            '${costController!.text.split(' ').join('')}  narxi',
                          );
                          print('${cost_type} pul turi');
                          print(
                            '${live_with_owner} uy egasi yashashi',
                          );
                          print(
                            '${utility_electricity} elktor',
                          );
                          print('${unility_gaz}  gaz');
                          print('${utility_hot_water} issiq suv');
                          print(
                            '${utility_cold_water} sovuq suv',
                          );
                          print(
                            '${utility_trash} musor',
                          );
                          print(
                            '${comfortItems}  texnikalar',
                          );
                          print('${widget.subway} malumot subway');
                          if (cost_type == null) {
                            cost_type = '1';
                          }

                          if (_phoneNumberOnClick &&
                              _houseTypeOnClick &&
                              _rentTypeOnClick &&
                              _roomCountOnClick &&
                              _floorsCountOnClick &&
                              _inFloorOnClick &&
                              _costTypeOnClick) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdsPhotoEdit(
                                        titleController: widget.titleController,
                                        roommate_gender: widget.roommate_gender,
                                        gender_matter: widget.gender_matter,
                                        district_id: widget.district_id,
                                        addressController:
                                            widget.addressController,
                                        location: widget.location,
                                        university_id: widget.university_id,
                                        university_id_matter:
                                            widget.university_id_matter,
                                        id: widget.id,
                                        phoneController: phoneController!.text
                                            .split(' ')
                                            .join(''),
                                        house_type: house_type,
                                        rent_type: rent_type,
                                        room_count: room_count,
                                        floors_count: floors_count,
                                        in_floor: in_floor,
                                        costController: costController!.text
                                            .split(' ')
                                            .join(''),
                                        cost_type: cost_type,
                                        live_with_owner: live_with_owner,
                                        utility_electricity:
                                            utility_electricity,
                                        unility_gaz: unility_gaz,
                                        utility_hot_water: utility_hot_water,
                                        utility_cold_water: utility_cold_water,
                                        utility_trash: utility_trash,
                                        comfort: comfortItems,
                                        description:
                                            descriptionController!.text,
                                        cost_period: price,
                                        subway: widget.subway, Image: widget.Image,
                                      )),
                            );
                          } else {
                            setState(() {
                              if (!_phoneNumberOnClick) {
                                _phoneNumberColor = Colors.red;
                              }
                              if (!_houseTypeOnClick) {
                                _houseTypeColor = Colors.red;
                              }
                              if (!_rentTypeOnClick) {
                                _rentTypeColor = Colors.red;
                              }
                              if (!_roomCountOnClick) {
                                _roomCountColor = Colors.red;
                              }
                              if (!_floorsCountOnClick) {
                                _floorsCountColor = Colors.red;
                              }
                              if (!_inFloorOnClick) {
                                _inFloorColor = Colors.red;
                              }
                              if (!_costTypeOnClick) {
                                _costTypeColor = Colors.red;
                              }

                              if (!_priceOnClick) {
                                _priceColor = Colors.red;
                              }
                            });
                          }
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
