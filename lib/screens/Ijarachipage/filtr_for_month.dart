import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import '../../provider/day_provider.dart';
import '../../provider/month_provider.dart';


class FiltrForMonth extends StatefulWidget {
  const FiltrForMonth({Key? key}) : super(key: key);

  @override
  State<FiltrForMonth> createState() => _FiltrForMonthState();
}

class _FiltrForMonthState extends State<FiltrForMonth> {
  bool _checkMetro = false;

  TextEditingController? costcontroller;
  TextEditingController? titlecontroller;
  TextEditingController? othercontroller;
  String dropDown = "";
  String dropDown2 = "";
  bool _checkHome = false;
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
  late TextEditingController fromCost;
  late TextEditingController toCost;
  @override
  void initState() {
    super.initState();
    fromCost = TextEditingController();
    toCost = TextEditingController();
    Provider.of<MonthProvider>(context, listen: false).getUnivers();
    // Provider.of<RegionProvider>(context,listen: false).getFiltrApi();
    Provider.of<MonthProvider>(context, listen: false).getRegion().asStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        title: Text(
          "Filtr",
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Consumer<MonthProvider>(
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
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField(
                      hint: Text("Viloyatni tanlang"),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey),
                      // value: ,
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      items: data.regions.map((e) {
                        return DropdownMenuItem<String>(
                          onTap: () {
                            data.RegionId = e.id.toString();
                          },
                          value: e.name ?? "",
                          child: Text(e.name.toString()),
                        );
                      }).toList(),
                      onChanged: (newValue) async {
                        print("Selected ----------- $newValue");
                        data.isRegion = true;
                        print(data.isRegion);
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
                        print("Selected ----------- $newValue");
                        data.isDistrict = true;
                        setState(() {
                          // dropDown1 = newValue as GetDistrictModel?;
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
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      hint: Text("OTM ni tanlang"),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey),
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
                        // print("Selected ----------- $newValue");
                        data.isUniver = true;
                        final selected = data.univer
                            .where((element) => element.name == newValue);
                        data.getFaculty(selected.last.id!);
                        setState(() {
                          dropDown2 = newValue.toString();
                        });
                      },
                    ),
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
                        border: Border.all(color: Colors.grey.shade400),
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
                          data.isCourse = true;
                          setState(() {
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
                                  onTap: () {},
                                  value: e,
                                  child: Text(e),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                data.isTypeHouse = true;
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
                                  onTap: () {},
                                  value: e,
                                  child: Text(e),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                data.isCount = true;
                                setState(() {
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
                            onTap: () {},
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          data.isRent = true;
                          setState(() {
                            TypeOfRent = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        child: Checkbox(
                          value: _checkMetro,
                          onChanged: (e) {
                            data.isSubway = true;
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
                    "Narxi",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 12.h),
                  Text("Dan"),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Container(
                            padding: EdgeInsets.only(left: 16.w),
                            child: TextFormField(
                              onTap: (){
                                data.isFromCost = true;
                              },
                              controller: fromCost,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "dan",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
                              ),
                              cursorColor: Colors.grey.shade800,
                              cursorWidth: 1.5.w,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Container(
                            padding: EdgeInsets.only(left: 16.w),
                            child: TextFormField(
                              onTap: (){
                                data.isToCost = true;
                              },
                              controller: toCost,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "gacha",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
                              ),
                              cursorColor: Colors.grey.shade800,
                              cursorWidth: 1.5.w,
                            ),
                          ),
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
                              if (_checkMetro = true) {
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
                            print('-----------------');
                            print(data.RegionId);
                            print(data.districtId);
                            print(data.UniverId);
                            print(Course);
                            print(TypeHouse);
                            print(roomCount);
                            print(_titleTime);
                            print(subwayof);
                            print(fromCost.text);
                            print(toCost.text);
                            print('-----------------');

                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => MenuPage()),
                            //         (route) => false);

                            data.getFiltrApi(
                              data.isRegion ? data.RegionId : '0',
                              data.isDistrict ? data.districtId : '0',
                              data.isUniver ? data.UniverId : '0',
                              data.isCourse ? Course : '0',
                              data.isTypeHouse ? TypeHouse : '0',
                              data.isCount ? roomCount : '0',
                              // data.isRent ? _titleTime: '0',
                              data.isSubway ? subwayof : '0',
                              data.isFromCost ? fromCost.text : '0',
                              data.isToCost ? toCost.text: '0',
                              // data.isRegion ? data.RegionId: '0',
                              // '11',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                            );

                            data.getFiltrForStudent(
                              data.isRegion ? data.RegionId : '0',
                              data.isDistrict ? data.districtId : '0',
                              data.isUniver ? data.UniverId : '0',
                              data.isCourse ? Course : '0',
                              data.isTypeHouse ? TypeHouse : '0',
                              data.isCount ? roomCount : '0',
                              // data.isRent ? _titleTime: '0',
                              data.isSubway ? subwayof : '0',
                              data.isFromCost ? fromCost.text : '0',
                              data.isToCost ? toCost.text: '0',
                              // data.isRegion ? data.RegionId: '0',
                              // '11',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                              // '0',
                            );


                            Navigator.pop(context);
                            // print(data.isRegion);
                          },
                          child: Text(
                            "Saqlash",
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
      ),
    );
  }
}
