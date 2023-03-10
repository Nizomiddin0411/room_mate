import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Create_ads/owner_photo.dart';

import '../../core/const/app_colors.dart';

class OwnerHouseInfo extends StatefulWidget {
  String? titleController;
  String? addressController;
  String? roommate_gender;
  String? gender_matter;
  String? district_id;
  String? university_id;
  String? university_id_matter;
  String? id;
  String? location;

  OwnerHouseInfo({
    required this.id,
    required this.location,
    required this.titleController,
    required this.roommate_gender,
    required this.gender_matter,
    required this.district_id,
    required this.addressController,
    required this.university_id,
    required this.university_id_matter,
  });

  @override
  State<OwnerHouseInfo> createState() => _OwnerHouseInfoState();
}

class _OwnerHouseInfoState extends State<OwnerHouseInfo> {
  TextEditingController? phoneController = TextEditingController(text: "+998");
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
  List comfort = [];
  String? description;
  String? _dropownUsd;
  String price = '';
  List<String> selectedItems = [];
  TextEditingController? addressController;
  TextEditingController? costController;
  TextEditingController? adsTitleController;
  TextEditingController? inputcontroller;
  Color _phoneNumberColor = Colors.grey;
  bool _phoneNumberOnClick = false;
  Color _houseTypeColor = Colors.grey;
  bool _houseTypeOnClick = false;
  Color _rentTypeColor = Colors.grey;
  bool _rentTypeOnClick = false;
  Color _roomCountColor = Colors.grey;
  bool _roomCountOnClick = false;
  Color _floorsCountColor = Colors.grey;
  bool _floorsCountOnClick = false;
  Color _inFloorColor = Colors.grey;
  bool _inFloorOnClick = false;
  Color _costTypeColor = Colors.grey;
  bool _costTypeOnClick = false;
  Color _descriptionColor = Colors.grey;

  Color _priceColor = Colors.grey;
  bool _priceOnClick = false;

  bool value5 = false;
  var pricetype = [
    tr("Kuniga"),
    tr("Oyiga"),
    tr("Kishi boshiga"),
  ];

  var housetype = [
    tr("Xovli"),
    tr('Kvartira'),
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
    tr("Kunlik"),
    tr("Oylik"),
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
  var ijarachi = ['1', '2', '3', '4', '5', '6'];

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
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: const Text(
          "E???lon yaratish",
          style: TextStyle(color: Colors.blue),
        ).tr(),
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
                    Text(
                      "Telefon raqami",
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ).tr(),
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
                            print(e.length);
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
                    //     Text("Ko???rinmasin"),
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
                                "Kvartira , Xovli".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
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
                                house_type = newValue == 'Xovli'.tr() ? '2' : '1';
                                print(house_type);
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
                        // Container(
                        //   height: 50.h,
                        //   width: 134.w,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10.r),
                        //       border: Border.all(color: _rentTypeColor)),
                        //   child: DropdownButtonFormField(
                        //     hint: Padding(
                        //       padding: EdgeInsets.only(left: 8.w),
                        //       child: Text(
                        //         "Kunlik  / Oylik".tr(),
                        //         style: TextStyle(fontSize: 14.sp),
                        //       ),
                        //     ),
                        //     decoration:
                        //         const InputDecoration(border: InputBorder.none),
                        //     icon: const Icon(Icons.arrow_drop_down_outlined),
                        //     items: ijaramuddat.map((e) {
                        //       return DropdownMenuItem<String>(
                        //         onTap: () {},
                        //         value: e,
                        //         child: Padding(
                        //           padding: EdgeInsets.only(left: 8.w),
                        //           child: Text(e.tr()),
                        //         ),
                        //       );
                        //     }).toList(),
                        //     onChanged: (newValue) {
                        //       setState(() {
                        //         rent_type = newValue == 'Kunlik'.tr()
                        //             ? '1'
                        //             : newValue == 'Oylik'.tr()
                        //                 ? '2'
                        //                 : '3';
                        //         _rentTypeOnClick = true;
                        //         _rentTypeColor = Colors.grey;
                        //       });
                        //     },
                        //   ),
                        // ),
                        Container(
                          width: 137.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _rentTypeColor)
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w,top: 5.h),
                                child: Text(tr("Kunlik")+"/"+tr("Oylik"),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              items: ijaramuddat.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  //disable default onTap to avoid closing menu when selecting an item
                                  enabled: false,
                                  child: StatefulBuilder(
                                    builder: (context, menuSetState) {
                                      final _isSelected = selectedItems.contains(item);
                                      return InkWell(
                                        onTap: () {
                                          _isSelected
                                              ? selectedItems.remove(item)
                                              : selectedItems.add(item);
                                          //This rebuilds the StatefulWidget to update the button's text
                                          setState(() {});
                                          _rentTypeOnClick = true;
                                          _rentTypeColor = Colors.grey;
                                          //This rebuilds the dropdownMenu Widget to update the check mark
                                          menuSetState(() {});
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            children: [
                                              _isSelected
                                                  ? const Icon(Icons.check_box_outlined)
                                                  : const Icon(Icons.check_box_outline_blank),
                                              SizedBox(width: 16.w),
                                              Text(
                                                item,
                                                style:  TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                              //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                              value: selectedItems.isEmpty ? null : selectedItems.last,
                              onChanged: (value) {
                                setState(() {

                                });

                              },
                              buttonHeight: 40,
                              buttonWidth: 140,
                              itemHeight: 40,
                              itemPadding: EdgeInsets.zero,
                              selectedItemBuilder: (context) {
                                return ijaramuddat.map(
                                      (item) {
                                    return Container(
                                      alignment: AlignmentDirectional.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Text(
                                        selectedItems.join(', '),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
                                      ),
                                    );
                                  },
                                ).toList();
                              },
                            ),
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
                            menuMaxHeight: 100.h,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "1 - 6",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: ijarachi.map((e) {
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
                          "Qavatlar soni".tr(),
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
                            menuMaxHeight: 100.h,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "1 - 9".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
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
                            menuMaxHeight: 100.h,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "1 - 9".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
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
                    padding: EdgeInsets.only(left: 10.w),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (e) {
                        setState(() {
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
                          width: 182.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _priceColor)),
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
                            icon: const Icon(Icons.arrow_drop_down_outlined),
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
                                if (newValue == 'Kuniga'.tr()) {
                                  price = '1';
                                } else if (newValue == 'Oyiga'.tr()) {
                                  price = '2';
                                } else {
                                  price = '3';
                                }
                                print(price);
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
                          "Uy egasi ham yashaydimi ?".tr(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor),
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
                          'Ha'.tr(),
                          style: TextStyle(fontSize: 14.0.sp),
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
                          "Yo'q".tr(),
                          style: TextStyle(
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
                          "Kommunal to???lovlarni kim to???laydi ?".tr(),
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 155.w,),
                    Container(
                     alignment: Alignment.center,
                    width:90.w,
                        child: Text("Uy egasi".tr())),

                    Container(width: 70.w,child: Text("Ijarachi".tr(),), alignment: Alignment.center,)
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 180.w,
                          child: Text("Elektr energiya".tr()),
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
                        SizedBox(
                          width: 180.w,
                          child: Text("Gaz".tr()),
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
                            SizedBox(width: 180.w, child: Text("Sovuq suv".tr())),
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
                              height: 1.h,
                            ),
                            SizedBox(width: 180.w, child: Text("Issiq suv".tr())),
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
                            SizedBox(
                              width: 180.w,
                              child: Text("Chiqindi".tr()),
                            ),
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
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "Quyidagi qulayliklarga ega.".tr(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.textColor,
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
                              Text("Wi - fi".tr()),
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
                              Text("TV".tr()),
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
                              Text("Muzlatgich".tr()),
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
                              Text("Kir yuvish mashinasi".tr()),
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
                              Text("Konditsioner".tr()),
                              Checkbox(
                                value: value6,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value6 = value!;
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
                              Text("Chang yutgich".tr()),
                              Checkbox(
                                value: value5,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value5 = value!;
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
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      "Qo???shimcha ma???lumotlar".tr(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: _descriptionColor),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.w),
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
                          print(phoneController!.text.split(' ').join('') +
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
                          print('${widget.university_id} malumot');
                          cost_type ??= '1';

                          if (_phoneNumberOnClick &&
                              _houseTypeOnClick &&
                              _rentTypeOnClick &&
                              _roomCountOnClick &&
                              _floorsCountOnClick &&
                              _inFloorOnClick &&
                              _costTypeOnClick && _priceOnClick) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OwnerCreateImage(
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
                                        // rent_type: rent_type,
                                        rent_type: selectedItems.join(', '),
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
                                        description: descriptionController.text,
                                        cost_period: price,
                                      )),

                            );
                          } else {
                            print(_phoneNumberOnClick.toString() + _houseTypeOnClick.toString()
                                +_rentTypeOnClick.toString() +
                                _roomCountOnClick.toString() +
                                _floorsCountOnClick.toString() +
                                _inFloorOnClick.toString() +
                                _costTypeOnClick.toString() + _priceOnClick.toString());
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
                          "Keyingi".tr(),
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
