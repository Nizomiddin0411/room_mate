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
                builder:
                    (context, AsyncSnapshot<List<GetRegionModel>?> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: ExpansionTile(
                        key: GlobalKey(),
                        title: Text(
                          _titleRegion,
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _titleRegion =
                                            snapshot.data![index].name!;
                                      });
                                    },
                                    child: Text(snapshot.data![index].name!));
                              })
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
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
                future: GetDistrictService().fetchDistrict(),
                builder:
                    (context, AsyncSnapshot<List<GetDistrictModel>?> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: ExpansionTile(
                        key: GlobalKey(),
                        title: Text(
                          _titleDistrict,
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _titleDistrict =
                                            snapshot.data![index].name!;
                                        DistrictId =
                                            snapshot.data![index].id.toString();
                                      });
                                    },
                                    child: Text(snapshot.data![index].name!));
                              })
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
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
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: ExpansionTile(
                        key: GlobalKey(),
                        title: Text(
                          _titleUniver,
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _titleUniver =
                                            snapshot.data![index].name!;
                                        UniverId =
                                            snapshot.data![index].id.toString();
                                      });
                                    },
                                    child: Text(snapshot.data![index].name!));
                              })
                        ],
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
                future: GetFacultyService().fetchFaculty(),
                builder:
                    (context, AsyncSnapshot<List<GetFacultyModel>?> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: ExpansionTile(
                        key: GlobalKey(),
                        title: Text(
                          _titleFaculty,
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _titleFaculty =
                                            snapshot.data![index].name!;
                                        FakultetId =
                                            snapshot.data![index].id.toString();
                                      });
                                    },
                                    child: Text(snapshot.data![index].name!));
                              })
                        ],
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
              child: ExpansionTile(
                key: GlobalKey(),
                title: Text(
                  _titleCourse,
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          _titleCourse = '1-kurs';
                        });
                      },
                      child: Text(
                        "1-kurs",
                        style: TextStyle(fontSize: 15.sp),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _titleCourse = '2-kurs';
                        });
                      },
                      child: Text("2-kurs")),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _titleCourse = '3-kurs';
                        });
                      },
                      child: Text("3-kurs")),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _titleCourse = '4-kurs';
                        });
                      },
                      child: Text("4-kurs")),
                ],
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: SizedBox(
                        width: 152.w,
                        child: ExpansionTile(
                          key: GlobalKey(),
                          title: Text(
                            _titilekv,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titilekv = 'Xonadon';
                                  });
                                },
                                child: Text("Xonadon")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titilekv = 'Kvartira';
                                  });
                                },
                                child: Text("Kvartira")),
                          ],
                        ),
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        width: 152.w,
                        child: ExpansionTile(
                          key: GlobalKey(),
                          title: Text(
                            _titleRoom,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleRoom = '1-xonali';
                                  });
                                },
                                child: Text(
                                  "1-xonali",
                                  style: TextStyle(fontSize: 15.sp),
                                )),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleRoom = '2-xonali';
                                  });
                                },
                                child: Text("2-xonali")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleRoom = '3-xonali';
                                  });
                                },
                                child: Text("3-xonali")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleRoom = '4-xonali';
                                  });
                                },
                                child: Text("4-xonali")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleRoom = '4-5 xonali';
                                  });
                                },
                                child: Text("4-5 xonali")),
                          ],
                        ),
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
                child: ExpansionTile(
                  key: GlobalKey(),
                  title: Text(
                    _titleTime,
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            _titleTime = 'kunlik';
                          });
                        },
                        child: Text("kunlik")),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _titleTime = 'oylik';
                          });
                        },
                        child: Text("oylik")),
                  ],
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        width: 152.w,
                        child: ExpansionTile(
                          key: GlobalKey(),
                          title: Text(
                            _titleGendor,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleGendor = "Qiz";
                                  });
                                },
                                child: Text("Qiz")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleGendor = "O'g'il";
                                  });
                                },
                                child: Text("O'g'il"))
                          ],
                        ),
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: SizedBox(
                        width: 152.w,
                        child: ExpansionTile(
                          key: GlobalKey(),
                          title: Text(
                            _titleCount,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleCount = '1';
                                  });
                                },
                                child: Text("1")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleCount = '2';
                                  });
                                },
                                child: Text("2")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleCount = '3';
                                  });
                                },
                                child: Text("3")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleCount = '4';
                                  });
                                },
                                child: Text("4")),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _titleCount = '5';
                                  });
                                },
                                child: Text("5")),
                          ],
                        ),
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
