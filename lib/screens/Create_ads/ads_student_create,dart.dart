import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/screens/Create_ads/house_data.dart';

import '../../cubit/aut_cubit.dart';
import 'Image_ads.dart';

class Student2 extends StatefulWidget {
  const Student2({Key? key}) : super(key: key);

  @override
  State<Student2> createState() => _Student2State();
}

class _Student2State extends State<Student2> {
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
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  int id = 1;
  final TextEditingController _textEditingController = TextEditingController();
  var kurs = [
    '1-kurs',
    '2-kurs',
    '3-kurs',
    '4-kurs',
    '5-kurs',
    '6-kurs',
  ];
  var housecost = ["so'm", "USD"];
  final List<String> genderItems = ["O'g'il bola ", "Qiz bola"];
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
  final nameController = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "Elon yaratish",
            style: TextStyle(color: AppColors.mainColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Consumer<RegionProvider>(
            builder: (_, data, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        child: Text("Viloyatni  / Shaharni tanlang".tr()),
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
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [Text("Tuman")],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Manzil ").tr(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 55.h,
                            width: 324.w,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              keyboardType: TextInputType.phone,
                              controller: nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Kvartal , Uy , Xonadon ".tr(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Metroga yaqinmi ?",
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
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
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
                                style: new TextStyle(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                width: 86.w,
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
                                "Uy egasi",
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
                                "Ijarachi",
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
                                  builder: (context) => AdsImage()));
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
              );
            },
          ),
        ),
      ),
    );
  }
}
