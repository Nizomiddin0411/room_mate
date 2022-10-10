import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/provider/region_provider.dart';
import 'create_image.ads.dart';

class Student2 extends StatefulWidget {
  String titlecontroller1;
  String viloyatidisi;
  String viloyatvalue;
  String universiteteid;
  String univervalue;
  String titleGendor;
  String titlecount;
  String phoneController;
  String house;
  String addinformation;
  String numbervalue;

  Student2(
      {Key? key,
      required this.titlecontroller1,
      required this.viloyatidisi,
      required this.viloyatvalue,
      required this.universiteteid,
      required this.univervalue,
      required this.titlecount,
      required this.titleGendor,
      required this.phoneController,
      required this.house,
      required this.addinformation,
      required this.numbervalue})
      : super(key: key);

  @override
  State<Student2> createState() => _Student2State();
}

class _Student2State extends State<Student2> {
  TextEditingController? costcontroller;
  TextEditingController? titlecontroller;
  TextEditingController? othercontroller;
  String dropDown = "";
  String dropDown2 = "";
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
  int metro = 0;
  int ownerlive = 0;
  int costcommunal = 0;
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
  var floors_count = [
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
  var in_floor = [
    '1 ',
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
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
  var countroums = [
    "1 xonali ",
    "2 xonali ",
    "3 xonali ",
    "4 xonali ",
    "5 xonali ",
  ];
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? comfort;
  String? housetype;
  String? housecount;
  String? housefloor;
  String? qavatlarsoni;
  String? cost_type;

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
                          Text("Manzil").tr(),
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
                              keyboardType: TextInputType.text,
                              controller: addressController,
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
                  SizedBox(
                    height: 10,
                  ),
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
                                groupValue: metro,
                                onChanged: (val) {
                                  setState(() {
                                    metro = 1;
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
                                groupValue: metro,
                                onChanged: (val) {
                                  setState(() {
                                    metro = 2;
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
                            "Uy turi".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 152.w,
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
                              decoration: const InputDecoration(
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
                                  housetype = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Xonalar soni ?".tr(),
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
                                child: Text(
                                  "Xonalar soni".tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: countroums.map((e) {
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
                                  housecount = newValue.toString();
                                  _colorGender = Colors.grey;
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
                          SizedBox(height: 8.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: _colorGender)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  "Qavatlar soni ".tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: floors_count.map((e) {
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
                                  qavatlarsoni = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nechinchi qavatda  ?".tr(),
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
                                child: Text(
                                  "Nechinchi qavatda".tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              items: in_floor.map((e) {
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
                                  housefloor = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
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
                            "Narxning turlanishi".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 152.w,
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
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
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
                                setState(() {
                                  cost_type = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
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
                                groupValue: ownerlive,
                                onChanged: (val) {
                                  setState(() {
                                    ownerlive = 1;
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
                                groupValue: ownerlive,
                                onChanged: (val) {
                                  setState(() {
                                    ownerlive = 2;
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
                                groupValue: costcommunal,
                                onChanged: (val) {
                                  setState(() {
                                    costcommunal = 1;
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
                                groupValue: costcommunal,
                                onChanged: (val) {
                                  setState(() {
                                    costcommunal = 2;
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 170.w,
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
                              value: value4,
                              onChanged: (bool? value) {
                                setState(() {
                                  value4 = value!;
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
                              value: value6,
                              onChanged: (bool? value) {
                                setState(() {
                                  value6 = value!;
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
                              value: value5,
                              onChanged: (bool? value) {
                                setState(() {
                                  value5 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
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
                              builder: (context) => Createimage(
                                universiteteid: widget.universiteteid,
                                house: widget.house,
                                titleGendor: widget.titleGendor,
                                numbervalue: widget.numbervalue,
                                viloyatvalue: widget.viloyatvalue,
                                phoneController: widget.phoneController,
                                titlecontroller1: widget.titlecontroller1,
                                addinformation: widget.addinformation,
                                univervalue: widget.univervalue,
                                titlecount: widget.titlecount,
                                viloyatidisi: widget.viloyatidisi,
                                comfort: value5 ? '1' : '2',
                                costlivekomunal:
                                    costcommunal.toString() == 'ha' ? '1' : '2',
                                metro: metro.toString() == 'ha' ? '1' : '2',
                                countroom: qavatlarsoni.toString(),
                                housetype: housetype.toString(),
                                in_floor: housefloor.toString(),
                                cost_type: cost_type.toString()=='ha' ? '1' : '2',
                              ),
                            ),
                          );
                          print(
                              '${costcommunal} kamunallllar  yooo+++++++++++');
                          print('${housefloor} qavatlara soni +++++++++++');
                          print('${housetype} uy turiilari yooo+++++++++++');
                          print('${qavatlarsoni} xonlar soni yooo+++++++++++');
                          print('${metro} metro yaqinmiiiiii yooo+++++++++++');
                          print('${value5 ? '1' : '2'} comfortlarning turlari yooo+++++++++++');
                          print('${cost_type} costtypeeeee turlari yooo+++++++++++');
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
