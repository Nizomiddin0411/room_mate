import 'package:dropdown_button2/dropdown_button2.dart';
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
  Color colorRegion = Colors.grey;
  bool RegionOnClick = false;
  Color colorDistric = Colors.grey;
  bool DiscritOnClick = false;
  Color colorUniver = Colors.grey;
  bool UniverOnClick = false;
  Color colorFaculty = Colors.grey;
  bool FacultyOnClick = false;
  Color colorCourse = Colors.grey;
  bool CourseOnClick = false;
  Color colorTypeHouse = Colors.grey;
  bool TypeHouseOnClick = false;
  Color colorRoomCount = Colors.grey;
  bool RoomCountOnClick = false;
  Color colorRentType = Colors.grey;
  bool RentTypeOnClick = false;
  Color colorTypeCost = Colors.grey;
  bool TypeCostOnClick = false;
  Color colorGender = Colors.grey;
  bool GenderOnClick = false;
  Color colorCountPupil = Colors.grey;
  bool CountPupilOnClick = false;
  Color colorForm = Colors.grey;
  bool FormOnClick = false;
  Color colorFormDescription = Colors.grey;
  bool FormDescriptionOnClick = false;
  Color colorCheckOwen = Colors.grey;
  bool CheckOwenOnClick = false;
  Color colorSubway = Colors.grey;
  bool SubwayOnClick = false;
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
                Container(
                  width: 324.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: colorRegion)),
                  child: DropdownButtonFormField(
                    hint: Text("Viloyatni tanlang"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    // value: ,
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    items: data.regions.map((e) {
                      return DropdownMenuItem<String>(
                        value: e.name ?? "",
                        child: Text(e.name.toString()),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      setState(() {
                        RegionOnClick = true;
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
                  "Tuman",
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
                              color: colorDistric,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          hint: Text("Tumanni tanlang"),
                          decoration: const InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                              focusColor: Colors.grey),
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
                              child: Text(data.isDistrict
                                  ? e.name.toString()
                                  : data.defaultvalue),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              DiscritOnClick = true;
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
                            hint: Text("Tumanni tanlang"),
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
                  "Oliy o’quv yurti",
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
                      border: Border.all(color: colorUniver)),
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    hint: Text("OTM ni tanlang"),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), focusColor: Colors.grey),
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
                          child: Text(e.name.toString()),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      print("Selected ----------- $newValue");
                      setState(() {
                        UniverOnClick = true;
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
                  "Fakultetni tanlang",
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
                            border: Border.all(color: colorFaculty),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          hint: Text("Faqultetni tanlang"),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusColor: Colors.grey),
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
                                child: Text(data.isFaculty
                                    ? e.name.toString()
                                    : data.defaultFaculty),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            FacultyOnClick = true;
                            // final selected = data.regions
                            //     .where((element) => element.name == newValue);
                            // data.getDistrict(selected.last.id!);
                            setState(() {
                              dropDown2 = newValue.toString();
                            });
                          },
                        ),
                      )
                    : Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorFaculty),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Text("Faqultetni tanlang"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            // value: ,
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: [],
                            onChanged: null),
                      ),
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
                      border: Border.all(color: colorCourse),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
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
                          CourseOnClick = true;
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
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorCheckOwen
                        )
                      ),
                      width: 20.w,
                      height: 20.h,
                      child: Checkbox(
                        value: _checkHome,
                        onChanged: (e) {
                          setState(() {
                            CheckOwenOnClick = true;
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
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: colorTypeHouse)),
                          child: DropdownButtonFormField(
                            hint: Text("Kv yoki xovli"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: kvartira.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                TypeHouseOnClick = true;
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
                              border: Border.all(color: colorRoomCount),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                            hint: Text("Xonalar soni"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: rooms.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                RoomCountOnClick = true;
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
                      border: Border.all(color: colorRentType),
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
                          onTap: () {},
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          RentTypeOnClick = true;
                          TypeOfRent = newValue.toString();
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
                      border: Border.all(color: colorTypeCost),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      controller: costcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Xonadonni narxini kiriting / oyiga",
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
                            focusColor: colorTypeCost,
                            underline: Container(),
                            value: _dropownUsd,
                            onTap: () {
                              TypeCostOnClick = true;
                            },
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
                      decoration:  BoxDecoration(
                        border: Border.all(color: colorSubway)
                      ),
                      child: Checkbox(
                        value: _checkMetro,
                        onChanged: (e) {
                          setState(() {
                            CheckOwenOnClick = true;
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
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: colorGender)),
                          child: DropdownButtonFormField(
                            hint: Text("Qiz,O'g'il"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: genderone.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                GenderOnClick = true;
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
                              border: Border.all(color: colorCountPupil),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                            hint: Text("Ijarachilar soni"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: ijarachi.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                CountPupilOnClick = true;
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
                      border: Border.all(color: colorForm),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onTap: (){
                        FormOnClick = true;
                      },
                      controller: titlecontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E’lonni nomlang",
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
                      border: Border.all(color: colorFormDescription),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onTap: (){
                        FormDescriptionOnClick = true;
                      },
                      controller: othercontroller,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Massage...',
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
                            if (_titleCourse == '1-kurs') {
                              Course = '1';
                            } else if (_titleCourse == '2-kurs') {
                              Course = '2';
                            } else if (_titleCourse == '3-kurs') {
                              Course = '3';
                            } else if (_titleCourse == '4-kurs') {
                              Course = '4';
                            } else if (_titleCourse == '5-kurs') {
                              Course = '5';
                            } else if (_titleCourse == '6-kurs') {
                              Course = '6';
                            }
                          });
                          setState(() {
                            if (kvartira == 'Xovli') {
                              TypeHouse = '2';
                            } else {
                              TypeHouse = '1';
                            }
                          });
                          setState(() {
                            if (TypeOfRent == 'kunlik') {
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
                            if (_titleGendor == 'Ayol') {
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

                          if (RegionOnClick &&
                              DiscritOnClick &&
                              UniverOnClick &&
                              FacultyOnClick &&
                              CourseOnClick &&
                              TypeHouseOnClick &&
                              RoomCountOnClick &&
                              RentTypeOnClick &&
                              TypeCostOnClick &&
                              GenderOnClick &&
                              CountPupilOnClick &&
                               FormOnClick   &&
                              FormDescriptionOnClick &&
                              CheckOwenOnClick &&
                              SubwayOnClick
                          ) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()),
                                (route) => false);
                          } else {
                            setState(() {
                              colorRegion = Colors.red;
                              colorDistric = Colors.red;
                              colorUniver = Colors.red;
                              colorFaculty = Colors.red;
                              colorCourse = Colors.red;
                              colorTypeHouse = Colors.red;
                              colorRoomCount = Colors.red;
                              colorRentType = Colors.red;
                              colorTypeCost = Colors.red;
                              colorGender = Colors.red;
                              colorCountPupil = Colors.red;
                              colorForm = Colors.red;
                              colorFormDescription = Colors.red;
                              colorCheckOwen = Colors.red;
                              colorSubway = Colors.red;
                            });
                          }
                        },
                        child: Text(
                          "E’lon saqlash",
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
