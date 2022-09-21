import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/menu/menu.dart';
import '../../provider/region_provider.dart';
import '../../services/post_create_ads_student.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  TextEditingController? costcontroller;
  TextEditingController? titlecontroller;
  TextEditingController? othercontroller;
  String dropDown = "";
  String dropDown2 = "";
  bool _checkHome = false;
  bool _checkMetro = false;
  String? _dropownUsd;
  String _titleTime = "Ijara muddati";
  String _titleGendor = "";
  String _titleCount = "Ijarachilar soni";
  String _titleCourse = "";
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
  Color _colorRegion = Colors.grey;
  bool _RegionOnClick = false;
  Color _colorDistric = Colors.grey;
  bool _DiscritOnClick = false;
  Color _colorUniver = Colors.grey;
  bool _UniverOnClick = false;
  Color _colorFaculty = Colors.grey;
  bool _FacultyOnClick = false;
  Color _colorCourse = Colors.grey;
  bool _CourseOnClick = false;
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
  bool _FormOnClick = false;
  var kurs = [
    '1-kurs',
    '2-kurs',
    '3-kurs',
    '4-kurs',
    '5-kurs',
    '6-kurs',
  ];
  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var genderone = [
    'Erkak',
    'Ayol',
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
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    costcontroller = TextEditingController();
    titlecontroller = TextEditingController();
    othercontroller = TextEditingController();
  }

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
                  "Joylashuv".tr(),
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12.h),
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
                      child: Text("Viloyatni tanlang".tr()),
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
                            border: Border.all(
                              color: _colorDistric,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text("Tumanni tanlang".tr()),
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
                              _DiscritOnClick = true;
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
                            hint: Text("Tumanni tanlang".tr()),
                            decoration: const InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: [],
                            onChanged: null),
                      ),
                SizedBox(height: 12.h),
                Text(
                  "Oliy o’quv yurti".tr(),
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
                      border: Border.all(color: _colorUniver)),
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    hint: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text("OTM ni tanlang".tr()),
                    ),
                    decoration: InputDecoration(border: InputBorder.none),
                    // value: ,
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    items: data.univer.map((e) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          data.UniverId = e.id.toString();
                        },
                        value: e.name ?? "",
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 150.w,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(e.name.toString()),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      print("Selected ----------- $newValue");
                      setState(() {
                        _UniverOnClick = true;
                        _colorUniver = Colors.grey;
                      });
                      final selected = data.univer
                          .where((element) => element.name == newValue);
                      data.getFaculty(selected.last.id!);
                      setState(() {
                        dropDown2 = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Fakultetni tanlang".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                data.isFaculty
                    ? Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: _colorFaculty),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text("Fakultetni tanlang".tr()),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          // value: ,
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          items: data.faculty.map((e) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                data.FacutyId = e.id.toString();
                              },
                              value: data.isFaculty
                                  ? e.name.toString()
                                  : data.defaultFaculty,
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width - 150.w,
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 8.w),
                                  child: Text(data.isFaculty
                                      ? e.name.toString()
                                      : data.defaultFaculty),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            _FacultyOnClick = true;
                            _colorFaculty = Colors.grey;
                            setState(() {
                              dropDown2 = newValue.toString();
                            });
                          },
                        ),
                      )
                    : Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: _colorFaculty),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text("Fakultetni tanlang".tr()),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            // value: ,
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: [],
                            onChanged: null),
                      ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Kurs".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: _colorCourse),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField2(
                      isExpanded: true,
                      hint: Padding(
                        padding:  EdgeInsets.only(left: 8.w),
                        child: Text("Kursingizni tanlang".tr()),
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,),

                      icon: Icon(Icons.arrow_drop_down_outlined),
                      // value: snapshot.data!.length,
                      items: kurs.map((e) {
                        return DropdownMenuItem<String>(
                          onTap: () {
                            // print("${e.id}");
                          },
                          value: e.toString(),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(e.toString().tr()),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _CourseOnClick = true;
                          _colorCourse = Colors.grey;
                          _titleCourse = newValue.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Xonadon ma’lumoti".tr(),
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Checkbox(
                        value: _checkHome,
                        onChanged: (e) {
                          setState(() {
                            _checkHome = e!;
                            if (_checkHome == true) {
                              RoomOwner = '1';
                            } else {
                              RoomOwner = '2';
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text("Uy egasi bilan birga yashashga roziman !!!".tr())
                  ],
                ),
                SizedBox(height: 19.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorTypeHouse)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding:  EdgeInsets.only(left: 8.w),
                              child: Text("Kv yoki xovli".tr()),
                            ),
                            decoration:  InputDecoration(
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
                                _TypeHouseOnClick = true;
                                _colorTypeHouse = Colors.grey;
                                dropDown = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Necha xona".tr(),
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
                              border: Border.all(color: _colorRoomCount),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding:  EdgeInsets.only(left: 8.w),
                              child: Container(width: 118.w,child: Text("Xonalar soni".tr())),
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: rooms.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _RoomCountOnClick = true;
                                _colorRoomCount = Colors.grey;
                                roomCount = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  "Ijara muddatini kiriting".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: _colorRentType),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    width: 152.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField(
                      hint: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text("Ijara muddati".tr()),
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none),
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      items: kindOfMoment.map((e) {
                        return DropdownMenuItem<String>(
                          onTap: () {},
                          value: e,
                          child: Padding(
                            padding:  EdgeInsets.only(left: 8.w),
                            child: Text(e.tr()),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _RentTypeOnClick = true;
                          _colorRentType = Colors.grey;
                          TypeOfRent = newValue.toString();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
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
                      borderRadius: BorderRadius.circular(4.r)),
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
                      controller: costcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Xonadonni narxini kiriting / oyiga".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  left:
                                      BorderSide(color: Colors.grey.shade300))),
                          padding: EdgeInsets.only(left: 8.w, top: 0),
                          width: 70.w,
                          height: 0,
                          child: DropdownButton(
                            underline: Container(),
                            value: _dropownUsd,
                            onChanged: (String? e) {
                              setState(() {
                                _dropownUsd = e;
                                if (_dropownUsd == 'sum') {
                                  typeOfPayment = '1';
                                } else {
                                  typeOfPayment = '2';
                                }
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
                  height: 16.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(),
                      child: Checkbox(
                        value: _checkMetro,
                        onChanged: (e) {
                          setState(() {
                            _checkMetro = e!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text("Metroga yaqin".tr())
                  ],
                ),
                SizedBox(height: 22.h),
                Text(
                  "Qo’shimcha".tr(),
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sheriklarni tanlang".tr(),
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
                              child: Text("Qiz,O'g'il".tr(), style: TextStyle(fontSize: 14.sp),),
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: genderone.map((e) {
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
                                _titleGendor = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ijarachilar soni".tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 154.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: _colorCountPupil),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Container(width: 115,child: Text("Soni".tr(), style: TextStyle(fontSize: 14.sp),)),
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: ijarachi.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _CountPupilOnClick = true;
                                _colorCountPupil = Colors.grey;
                                dropDown = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
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
                      border: Border.all(color: _colorForm),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.length > 0) {
                            _FormOnClick = true;
                            _colorForm = Colors.grey;
                          } else {
                            _FormOnClick = false;
                            _colorForm = Colors.red;
                          }
                        });
                      },
                      controller: titlecontroller,
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
                SizedBox(height: 12.h),
                Text(
                  "Qo’shimcha ma’lumot".tr(),
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
                      controller: othercontroller,
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
                        onPressed: () async {
                          setState(() {
                            if (_titleCourse == '1-kurs' || _titleCourse == '1-курс') {
                              Course = '1';
                            } else if (_titleCourse == '2-kurs' || _titleCourse == '2-курс') {
                              Course = '2';
                            } else if (_titleCourse == '3-kurs' || _titleCourse == '3-курс') {
                              Course = '3';
                            } else if (_titleCourse == '4-kurs' || _titleCourse == '4-курс') {
                              Course = '4';
                            } else if (_titleCourse == '5-kurs' || _titleCourse == '5-курс') {
                              Course = '5';
                            } else if (_titleCourse == '6-kurs' || _titleCourse == '6-курс') {
                              Course = '6';
                            }
                          });
                          setState(() {
                            if (kvartira == 'Xovli' || kvartira == 'Участка') {
                              TypeHouse = '2';
                            } else {
                              TypeHouse = '1';
                            }
                          });
                          setState(() {
                            if (TypeOfRent == 'kunlik' || TypeOfRent == 'день') {
                              _titleTime = '1';
                            } else {
                              _titleTime = '2';
                            }
                          });
                          setState(() {
                            if (_checkMetro == true) {
                              subwayof = '1';
                            } else {
                              subwayof = '2';
                            }
                          });
                          setState(() {
                            if (_titleGendor == 'Ayol' || _titleGendor == 'Женщина') {
                              gender = '2';
                            } else {
                              gender = '1';
                            }
                          });
                          // print('-----------------');
                          // print(Course);
                          // print(RoomOwner);
                          // print(TypeHouse);
                          // // print(roomCount);
                          // print(_titleTime);
                          // print(costcontroller?.text);
                          // print(typeOfPayment);
                          // print(subwayof);
                          // print(gender);
                          // print(_titleCount);
                          // print(titlecontroller?.text);
                          // print(othercontroller?.text);
                          // print('-----------------');
                          // print(data.districtId);
                          // print(data.UniverId);

                          await CreateAdsStudent().CreateAds(
                            districtId: data.districtId,
                            UniderId: data.UniverId,
                            fakultetId: data.FacutyId,
                            Course: Course,
                            roomOwner: RoomOwner,
                            TypeHouse: TypeHouse,
                            CountRoom: roomCount,
                            TypeOfRent: _titleTime,
                            cost: costcontroller?.text,
                            typePayment: typeOfPayment,
                            subway: subwayof,
                            gender: gender,
                            title: titlecontroller?.text,
                            description: othercontroller?.text,
                          );

                          if (_RegionOnClick &&
                              _DiscritOnClick &&
                              _UniverOnClick &&
                              _FacultyOnClick &&
                              _CourseOnClick &&
                              _TypeHouseOnClick &&
                              _RoomCountOnClick &&
                              _RentTypeOnClick &&
                              _TypeCostOnClick &&
                              _GenderOnClick &&
                              _CountPupilOnClick &&
                              _FormOnClick) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()),
                                (route) => false);
                          } else {
                            setState(() {
                              if (!_RegionOnClick) {
                                _colorRegion = Colors.red;
                              }
                              if (!_DiscritOnClick) {
                                _colorDistric = Colors.red;
                              }
                              if (!_UniverOnClick) {
                                _colorUniver = Colors.red;
                              }
                              if (!_FacultyOnClick) {
                                _colorFaculty = Colors.red;
                              }
                              if (!_CourseOnClick) {
                                _colorCourse = Colors.red;
                              }
                              if (!_TypeHouseOnClick) {
                                _colorTypeHouse = Colors.red;
                              }
                              if (!_RoomCountOnClick) {
                                _colorRoomCount = Colors.red;
                              }
                              if (!_RentTypeOnClick) {
                                _colorRentType = Colors.red;
                              }
                              if (!_TypeCostOnClick) {
                                _colorTypeCost = Colors.red;
                              }
                              if (!_GenderOnClick) {
                                _colorGender = Colors.red;
                              }
                              if (!_CountPupilOnClick) {
                                _colorCountPupil = Colors.red;
                              }
                              if (!_FormOnClick) {
                                _colorForm = Colors.red;
                              }
                            });
                          }
                        },
                        child: Text(
                          "E’lon saqlash".tr(),
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
