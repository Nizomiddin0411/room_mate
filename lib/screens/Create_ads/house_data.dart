import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import 'Image_ads.dart';

class HouseData extends StatefulWidget {
  const HouseData({Key? key}) : super(key: key);

  @override
  State<HouseData> createState() => _HouseDataState();
}

class _HouseDataState extends State<HouseData> {
  final TextEditingController _textEditingController = TextEditingController();
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
  var kvsherik = [
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
  var housecost = ["so'm", "USD"];
  final List<String> genderItems = ["O'g'il bola ", "Qiz bola"];
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
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          "E’lon yaratish",
          style: TextStyle(color: Colors.blue),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            border: Border.all(color: Colors.black)),
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
                          items: kvsherik.map((e) {
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
                    width: 35,
                  ),
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
                            border: Border.all(color: Colors.black)),
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
                          items: kvsherik.map((e) {
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
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Qavatlar soni  ".tr(),
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
                            border: Border.all(color: Colors.black)),
                        child: DropdownButtonFormField(
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              "Qavatlar soni".tr(),
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          items: kvsherik.map((e) {
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
                    width: 35,
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
                            border: Border.all(color: Colors.black)),
                        child: DropdownButtonFormField(
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              "Nechanchi qavat".tr(),
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          items: kvsherik.map((e) {
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
                height: 18,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Narxning turlanishi  ?".tr(),
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
                            border: Border.all(color: Colors.black)),
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
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Uy egasi ham yashaydimi ?",
                        style: TextStyle(fontSize: 15),
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
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Kommunal to’lovlarini kim to’laydi ?",
                        style: TextStyle(fontSize: 15),
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
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Quyidagi qulayliklarga ega",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 10,),
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
              SizedBox(height: 55,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 6.r,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 7.r,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    width: 100.w,
                    height: 5.h,
                    color: Color.fromRGBO(228, 228, 228, 1),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 6.r,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 7.r,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 100.w,
                    height: 5.h,
                    color: Color.fromRGBO(228, 228, 228, 1),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 6.r,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 7.r,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70.w,
                    child: Text(
                      "E’lon",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.w,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 70.w,
                    child: Text(
                      "Xonadon \nma’lumotlari\n",
                      style: TextStyle(fontSize: 12.w, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 70.w,
                    child: Text(
                      "E’lonni \njoylashtirish\n",
                      style: TextStyle(fontSize: 12.w, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AdsImage()));
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
          ),
        ),
      ),
    );
  }
}
