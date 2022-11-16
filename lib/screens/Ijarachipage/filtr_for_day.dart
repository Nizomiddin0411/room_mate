import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import '../../cubit/aut_cubit.dart';
import '../../models/lang_model.dart';
import '../../provider/day_provider.dart';

class FiltrForDay extends StatefulWidget {
  const FiltrForDay({Key? key}) : super(key: key);

  @override
  State<FiltrForDay> createState() => _FiltrForDayState();
}

class _FiltrForDayState extends State<FiltrForDay> {
  bool _checkMetro = false;


  String dropDown = "";
  String dropDown2 = "";
  String _titleTime = "Ijara muddati";

  String UniverId = '';



  String TypeHouse = '';
  String TypeOfRent = '';

  String subwayof = '';

  String roomCount = '';

  var kvartira = [
    'Kvartira',
    'Xovli',
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
    '5',
  ];

  late TextEditingController fromCost;
  late TextEditingController toCost;
  @override
  void initState() {
    super.initState();
    fromCost = TextEditingController();
    toCost = TextEditingController();
    Provider.of<DayProvider>(context, listen: false).getUnivers();
    Provider.of<DayProvider>(context, listen: false).getRegion().asStream();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AutCubit>().selectSettingLan(
        LangData.languageList.singleWhere((e) => e.locale == context.locale),
        context);
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
        ).tr(),
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
          child: Consumer<DayProvider>(
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
                  ).tr(),
                  SizedBox(height: 12.h),
                  Text(
                    "Viloyat",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ).tr(),
                  SizedBox(height: 4.h),
                  Container(
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonFormField(
                      hint: Text("Viloyatni tanlang").tr(),
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
                        // print("Selected ----------- $newValue");
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
                  ).tr(),
                  SizedBox(height: 4.h),
                  data.isDistrict
                      ? Container(
                          width: 324.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Text("Tumanni tanlang").tr(),
                            decoration: const InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
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
                              // print("Selected ----------- $newValue");
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
                              hint: Text("Tumanni tanlang").tr(),
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
                  ).tr(),
                  SizedBox(height: 4.h),
                  // Container(
                  //   width: 324.w,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10.r)),
                  //   child: DropdownButtonFormField(
                  //     isExpanded: true,
                  //     hint: Text("OTM ni tanlang"),
                  //     decoration: const InputDecoration(
                  //         border: OutlineInputBorder(),
                  //         focusColor: Colors.grey),
                  //     // value: ,
                  //     icon: Icon(Icons.arrow_drop_down_outlined),
                  //     items: data.univer.map((e) {
                  //       return DropdownMenuItem<String>(
                  //         onTap: () {
                  //           data.UniverId = e.id.toString();
                  //         },
                  //         value: e.name ?? "",
                  //         child: SizedBox(
                  //           width: MediaQuery.of(context).size.width - 150.w,
                  //           child: Text(e.name.toString()),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     onChanged: (newValue) async {
                  //       // print("Selected ----------- $newValue");
                  //       data.isUniver = true;
                  //       final selected = data.univer
                  //           .where((element) => element.name == newValue);
                  //       data.getFaculty(selected.last.id!);
                  //       setState(() {
                  //         dropDown2 = newValue.toString();
                  //       });
                  //     },
                  //   ),
                  // ),
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    items: data.univer.map((e) {
                      if (context.read<AutCubit>().selectedLang.index == 1) {
                        if (dropDown2 == e.name) {
                          UniverId = e.id.toString();
                          print(UniverId);
                          print(dropDown2);
                        }
                      } else {
                        if (dropDown2 == e.nameRu) {
                          data.UniverId = e.id.toString();
                          print(data.UniverId);
                        }
                      }
                      return context.read<AutCubit>().selectedLang.index == 1
                          ? e.name.toString()
                          : e.nameRu.toString();
                    }).toList(),
                    showSearchBox: true,
                    // label: "Menu mode",
                    // hint: "country in menu mode",

                    onChanged: (value) {
                      data.isUniver = true;
                      // final selected =
                      //     data.univer.where((element) => element.name == value);
                      // data.getFaculty(selected.last.id!);
                      print(data.isUniver);
                      // final get  = data.univer.map((e) => data.UniverId = e.id.toString());
                      // print('${get}----------------------');

                      // print(data.UniverId);

                      setState(() {
                        dropDown2 = value.toString();
                      });
                    },

                    selectedItem: tr("OTM ni tanlang"),
                    // onFind: (var item) => data.UniverId = item,
                    //   onSaved: (val) {
                    //     data.univer.map((e) =>   val =  e.id.toString() );
                    //     // data.UniverId = value.toString();
                    //   print(val);
                    //   },
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  // Text(
                  //   "Kurs",
                  //   style: TextStyle(
                  //     color: AppColors.textColor,
                  //     fontSize: 14.sp,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ).tr(),
                  // SizedBox(height: 4.h),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey.shade400),
                  //       borderRadius: BorderRadius.circular(4.r)),
                  //   child: Container(
                  //     width: 324.w,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10.r)),
                  //     child: DropdownButtonFormField2(
                  //       isExpanded: true,
                  //       hint: Text("Kursingizni tanlang").tr(),
                  //       decoration: const InputDecoration(
                  //           isDense: true,
                  //           border: OutlineInputBorder(),
                  //           focusColor: Colors.grey),
                  //
                  //       icon: Icon(Icons.arrow_drop_down_outlined),
                  //       // value: snapshot.data!.length,
                  //       items: kurs.map((e) {
                  //         return DropdownMenuItem<String>(
                  //           onTap: () {
                  //             // print("${e.id}");
                  //           },
                  //           value: e.toString(),
                  //           child: Text(e.toString()),
                  //         );
                  //       }).toList(),
                  //       onChanged: (newValue) {
                  //         data.isCourse = true;
                  //         setState(() {
                  //           _titleCourse = newValue.toString();
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 18.h,
                  // ),
                  Text(
                    "Xonadon ma’lumoti",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ).tr(),
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
                          ).tr(),
                          SizedBox(height: 4.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)),
                            child: DropdownButtonFormField(
                              hint: Text("Kv yoki xovli").tr(),
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
                          ).tr(),
                          SizedBox(height: 4.h),
                          Container(
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)),
                            child: DropdownButtonFormField(
                              hint: Text("Soni").tr(),
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
                  ).tr(),
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
                        hint: Text("Ijara muddati").tr(),
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
                      Text("Metroga yaqin").tr()
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    "Narxi",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ).tr(),
                  SizedBox(height: 12.h),
                  Text("Dan").tr(),
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
                              onTap: () {
                                data.isFromCost = true;
                              },
                              controller: fromCost,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: tr("dan"),
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
                              onTap: () {
                                data.isToCost = true;
                              },
                              controller: toCost,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: tr("gacha"),
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => super.widget));
                      },
                      child: Container(
                        width: 280.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.error),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                            child: Text(
                              "Tozalash",
                              style: TextStyle(
                                  color: AppColors.error,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 31.w),
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

                            print('-----------------');
                            print(data.RegionId);
                            print(data.districtId);
                            print(data.UniverId);
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
                              // data.isCourse ? Course : '0',
                              data.isTypeHouse ? TypeHouse : '0',
                              data.isCount ? roomCount : '0',
                              // data.isRent ? _titleTime: '0',
                              data.isSubway ? subwayof : '0',
                              data.isFromCost ? fromCost.text : '0',
                              data.isToCost ? toCost.text : '0',
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
                              // data.isCourse ? Course : '0',
                              data.isTypeHouse ? TypeHouse : '0',
                              data.isCount ? roomCount : '0',
                              // data.isRent ? _titleTime: '0',
                              data.isSubway ? subwayof : '0',
                              data.isFromCost ? fromCost.text : '0',
                              data.isToCost ? toCost.text : '0',
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
                          ).tr(),
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
