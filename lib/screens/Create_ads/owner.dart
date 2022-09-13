import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/menu/menu.dart';

import '../../models/get_district_model.dart';
import '../../models/get_region_model.dart';
import '../../services/get_district_service.dart';
import '../../services/get_region_service.dart';

class Owner extends StatefulWidget {
  const Owner({Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  bool _checkHome = false;
  bool _checkMetro = false;
  String? _dropownUsd;
  String dropDown = "";
  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var gender = [
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
            // Container(
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey.shade400),
            //       borderRadius: BorderRadius.circular(4.r)),
            //   child: ExpansionTile(
            //     title: Text(
            //       "Viloyatni tanlang",
            //       style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            //     ),
            //     children: [],
            //   ),
            // ),
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
              future: GetDistrictService().fetchDistrict(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<GetDistrictModel>?> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField(
                      hint: Text("Tumanni tanlang"),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey),
                      icon: Icon(Icons.arrow_drop_down_outlined),
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
              "Manzil",
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Kvartal , Uy , Xonadon",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  cursorColor: Colors.grey.shade800,
                  cursorWidth: 1.5.w,
                ),
              ),
            ),

            SizedBox(height: 18.h),
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
                Container(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: _checkHome,
                    onChanged: (e) {
                      setState(() {
                        _checkHome = e!;
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
                          hint: Text("uy turi"),
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
                        items: gender.map((e) {
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
                    onPressed: () {
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
