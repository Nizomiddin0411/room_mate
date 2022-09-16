import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/menu/menu.dart';

import '../../models/get_district_model.dart';
import '../../models/get_faculty_model.dart';
import '../../models/get_region_model.dart';
import '../../models/get_univer_model.dart';
import '../../services/get_district_service.dart';
import '../../services/get_faculty_service.dart';
import '../../services/get_region_service.dart';
import '../../services/get_univer_service.dart';
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
  bool _checkHome = false;
  bool _checkMetro = false;
  String _titleUniver = "Oliy o’quv yurtingizni tanlang";
  String _titleRegion = "Viloyatni tanlang";
  String _titleDistrict = "Tumanni tanlang";
  String _titleFaculty = "Fakultetni tanlang";
  String? _dropownUsd;
  String _titilekv = "Kvartira , Xovli";
  String _titleRoom = "Xonalar soni";
  String _titleTime = "Ijara muddati";
  String _titleGendor = "Qiz , O’g'il";
  String _titleCount = "Ijarachilar soni";
  String _titleCourse = "Kursingizni tanlang";
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
   var kurs = [
     '1-kurs',
     '2-kurs',
     '3-kurs',
     '4-kurs',

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
            FutureBuilder<List<GetRegionModel>?>(
              future: GetRegionService().fetchRegion(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<GetRegionModel>?> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField(
                      hint: Text("Viloyatni tanlang"),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey),
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      items: snapshot.data!.map((e) {
                        return DropdownMenuItem<String>(
                          onTap: () {
                            print("${e.id}");
                            setState(() {
                              // MockData.RegionID = e.id;
                            });
                          },
                          value: e.name.toString(),
                          child: Text(e.name.toString()),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDown = newValue.toString();
                        });
                      },
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
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
            FutureBuilder<List<GetDistrictModel>?>(
              future: GetDistrictService().fetchDistrict(0),
              builder: (BuildContext context,
                  AsyncSnapshot<List<GetDistrictModel>?> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField2(
                      isExpanded: true,
                      hint: Text("Tumanni tanlang"),
                      decoration: const InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey),

                      icon: Icon(Icons.arrow_drop_down_outlined),
                      // value: snapshot.data!.length,
                      items: snapshot.data!.map((e) {
                        return DropdownMenuItem<String>(
                          onTap: () {
                            print("${e.id}");
                          },
                          value: e.name.toString(),
                          child: Text(e.name.toString()),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDown = newValue.toString();
                        });
                      },
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(height: 12.h),
            Text(
              "Oliy o’quv yurti",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            FutureBuilder<List<GetUniverModel>?>(
                future: GetUniverService().fetchUniver(),
                builder:
                    (context, AsyncSnapshot<List<GetUniverModel>?> snapshot) {
                  if (snapshot.hasData) {
                    return  Container(
                      width: 324.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: DropdownButtonFormField2(
                        isExpanded: true,
                        hint: Text("OTM ni tanlang"),
                        decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            focusColor: Colors.grey),

                        icon: Icon(Icons.arrow_drop_down_outlined),
                        // value: snapshot.data!.length,
                        items: snapshot.data!.map((e) {
                          return DropdownMenuItem<String>(
                            onTap: () {
                              print("${e.id}");
                            },
                            value: e.name.toString(),
                            child: Text(e.name.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropDown = newValue.toString();
                          });
                        },
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(height: 12.h),
            Text(
              "Fakultetni tanlang",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            FutureBuilder<List<GetFacultyModel>?>(
                future: GetFacultyService().fetchFaculty(0),
                builder:
                    (context, AsyncSnapshot<List<GetFacultyModel>?> snapshot) {
                  if (snapshot.hasData) {
                    return  Container(
                      width: 324.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: DropdownButtonFormField2(
                        isExpanded: true,
                        hint: Text("Faqultetni tanlang"),
                        decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            focusColor: Colors.grey),

                        icon: Icon(Icons.arrow_drop_down_outlined),
                        // value: snapshot.data!.length,
                        items: snapshot.data!.map((e) {
                          return DropdownMenuItem<String>(
                            onTap: () {
                              print("${e.id}");
                            },
                            value: e.name.toString(),
                            child: Text(e.name.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropDown = newValue.toString();
                          });
                        },
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Kurs",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child:  Container(
                width: 324.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButtonFormField2(
                  isExpanded: true,
                  hint: Text("Kursingizni tanlang"),
                  decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      focusColor: Colors.grey),

                  icon: Icon(Icons.arrow_drop_down_outlined),
                  // value: snapshot.data!.length,
                  items: kurs.map((e) {
                    return DropdownMenuItem<String>(
                      onTap: () {
                        // print("${e.id}");
                      },
                      value: e.toString(),
                      child: Text(e.toString()),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropDown = newValue.toString();
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Xonadon ma’lumoti",
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
                SizedBox(
                  width: 20,
                  height: 20,
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
                Text("Uy egasi bilan birga yashashga roziman !!!")
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
                      "Uy turi",
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
                          borderRadius: BorderRadius.circular(10.r)),
                      child: DropdownButtonFormField(
                        hint: Text("Kv yoki xovli"),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusColor: Colors.grey),
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        items: kvartira.map((e) {
                          return DropdownMenuItem<String>(
                            onTap: () {

                            },
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
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
                      "Necha xona",
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
                          borderRadius: BorderRadius.circular(10.r)),
                      child: DropdownButtonFormField(
                        hint: Text("Xonalar soni"),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusColor: Colors.grey),
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        items: rooms.map((e) {
                          return DropdownMenuItem<String>(
                            onTap: () {

                            },
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
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
              "Ijara muddatini kiriting",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                width: 152.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButtonFormField(
                  hint: Text("Ijara muddati"),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.grey),
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  items: kindOfMoment.map((e) {
                    return DropdownMenuItem<String>(
                      onTap: () {

                      },
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropDown = newValue.toString();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Narxi",
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
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextFormField(
                  controller: costcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Xonadonni narxini kiriting / oyiga",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.grey.shade300))),
                      padding: EdgeInsets.only(left: 8.w, top: 0),
                      width: 70,
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
                          "SO'M",
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.textColor),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "SO'M",
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.textColor),
                            ),
                            value: "sum",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "USD",
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.textColor),
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
                  width: 20,
                  height: 20,
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
                Text("Metroga yaqin")
              ],
            ),
            SizedBox(height: 22.h),
            Text(
              "Qo’shimcha",
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
                      "Sheriklarni tanlang",
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
                          borderRadius: BorderRadius.circular(10.r)),
                      child: DropdownButtonFormField(
                        hint: Text("Qiz,O'g'il"),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusColor: Colors.grey),
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        items: genderone.map((e) {
                          return DropdownMenuItem<String>(
                            onTap: () {

                            },
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
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
                      "Soni",
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
                          borderRadius: BorderRadius.circular(10.r)),
                      child: DropdownButtonFormField(
                        hint: Text("Ijarachilar soni"),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusColor: Colors.grey),
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        items: ijarachi.map((e) {
                          return DropdownMenuItem<String>(
                            onTap: () {

                            },
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
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
              "E’lonni nomlash",
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
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextFormField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "E’lonni nomlang",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  cursorColor: Colors.grey.shade800,
                  cursorWidth: 1.5.w,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Qo’shimcha ma’lumot ",
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
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextFormField(
                  controller: othercontroller,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Massage...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  cursorColor: Colors.grey.shade800,
                  cursorWidth: 1.5.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 31.w),
              child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        primary: AppColors.buttonLinear),
                    onPressed: () async {
                      // DistrictId
                      setState(() {
                        if (_titleCourse == '1-kurs') {
                          Course = '1';
                        } else if (_titleCourse == '2-kurs') {
                          Course = '2';
                        } else if (_titleCourse == '3-kurs') {
                          Course = '3';
                        } else if (_titleCourse == '4-kurs') {
                          Course = '4';
                        }
                      });
                      setState(() {
                        if (_titilekv == 'Xonadon') {
                          TypeHouse = '2';
                        } else {
                          TypeHouse = '1';
                        }
                      });
                      setState(() {
                        if (_titleTime == 'kunlik') {
                          TypeOfRent = '1';
                        } else {
                          TypeOfRent = '2';
                        }
                      });
                      setState(() {
                        if (_checkMetro = true) {
                          subwayof = '1';
                        } else {
                          subwayof = '2';
                        }
                      });
                      setState(() {
                        if (_titleGendor == 'Qiz') {
                          gender = '2';
                        } else {
                          gender = '1';
                        }
                      });
                      print(typeOfPayment);
                      await CreateAdsStudent().CreateAds(
                          districtId: DistrictId,
                          UniderId: UniverId,
                          Course: Course,
                          roomOwner: RoomOwner,
                          TypeHouse: TypeHouse,
                          CountRoom: _titleRoom,
                          TypeOfRent: TypeOfRent,
                          cost: costcontroller?.text,
                          typePayment: typeOfPayment,
                          subway: subwayof,
                          gender: gender,
                          countRoom: _titleCount,
                          title: titlecontroller?.text,
                          description: othercontroller?.text, fakultetId: FakultetId);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MenuPage()),
                          (route) => false);
                    },
                    child: Text(
                      "E’lon saqlash",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
