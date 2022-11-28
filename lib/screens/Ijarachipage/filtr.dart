import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import '../../cubit/aut_cubit.dart';
import '../../models/lang_model.dart';
import '../../provider/region_provider.dart';

class FiltrPage extends StatefulWidget {
  const FiltrPage({Key? key}) : super(key: key);

  @override
  State<FiltrPage> createState() => _FiltrPageState();
}

class _FiltrPageState extends State<FiltrPage> {
  bool _checkMetro = false;

  String dropDown = "";
  String dropDown2 = "";
  String _titleTime = "Ijara muddati";

  String TypeHouse = '';
  String TypeOfRent = '';
  String subwayof = '';

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

    Provider.of<RegionProvider>(context, listen: false).getUnivers();
    Provider.of<RegionProvider>(context, listen: false).getRegion().asStream();
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
                      menuMaxHeight: 100.h,
                      hint:  Text("Viloyatni tanlang",style: TextStyle(fontSize: 14.sp),).tr(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey),
                      // value: ,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
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
                            menuMaxHeight: 100.h,
                            isExpanded: true,
                            hint:  Text("Tumanni tanlang",style: TextStyle(fontSize: 14.sp)).tr(),
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
                              hint:  Text("Tumanni tanlang",style: TextStyle(fontSize: 14.sp)).tr(),
                              decoration: const InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.grey),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: const [],
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
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    items: data.univer.map((e) {
                      if (context.read<AutCubit>().selectedLang.index == 1) {
                        if (dropDown2 == e.name) {
                          data.UniverId = e.id.toString();

                          print(data.UniverId);
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
                      print('${data.isUniver}  is univer bool');
                      // final selected =
                      // data.univer.where((element) => element.name == value);
                      // data.getFaculty(selected.last.id!);
                      setState(() {
                        dropDown2 = value.toString();
                        print(dropDown2);
                      });
                    },
                    selectedItem: tr("OTM ni tanlang"),
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
                              hint:  Text("Kv yoki xovli",style: TextStyle(fontSize: 14.sp)).tr(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.grey),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
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
                              menuMaxHeight: 100.h,
                              hint:  Text("Soni",style: TextStyle(fontSize: 14.sp)).tr(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.grey),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
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
                        hint:  Text("Ijara muddati",style: TextStyle(fontSize: 14.sp)).tr(),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusColor: Colors.grey),
                        icon: const Icon(Icons.arrow_drop_down_outlined),
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
                      SizedBox(
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
                       Text("Metroga yaqin",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),).tr()
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
                   Text("Dan",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),).tr(),
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
                                hintText: tr("dan",),
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
                        data.isRegion = false;
                        data.isDistricts = false;
                        data.isUniver = false;
                        // data.isCourse = false;
                        data.isTypeHouse = false;
                        data.isCount = false;
                        data.isRent = false;
                        data.isSubway = false;
                        data.isFromCost = false;
                        data.isToCost = false;
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
                        ).tr()),
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 31.w),
                    child: SizedBox(
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
                            // setState(() {
                            //   if (_titleGendor == 'Ayol') {
                            //     gender = '2';
                            //   } else {
                            //     gender = '1';
                            //   }
                            // });
                            print('-----------------');
                            print(data.RegionId + 'region id ');
                            print(data.districtId + 'district id');
                            print(data.UniverId + 'Univer id');
                            print('++++++++++++++++');
                            print(TypeHouse + 'Uy turi');
                            print(roomCount + ' hona soni');
                            print(_titleTime + 'ijara vaqti');
                            print(subwayof + 'metro');
                            print(fromCost.text + 'Cost from');
                            print(toCost.text + 'cost to');
                            print('-----------------');

                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => MenuPage()),
                            //         (route) => false);

                            await data.getFiltrApi(
                              data.isRegion ? data.RegionId : '0',
                              data.isDistrict ? data.districtId : '0',
                              data.isUniver ? data.UniverId : '0',
                              // data.isCourse ? Course : '0',
                              data.isTypeHouse ? TypeHouse : '0',
                              data.isCount ? roomCount : '0',
                              data.isRent ? _titleTime : '0',
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

                            await data.getFiltrForStudent(
                              data.isRegion ? data.RegionId : '0',
                              data.isDistrict ? data.districtId : '0',
                              data.isUniver ? data.UniverId : '0',
                              // data.isCourse ? Course : '0',
                              data.isTypeHouse ? TypeHouse : '0',
                              data.isCount ? roomCount : '0',
                              data.isRent ? _titleTime : '0',
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
                            print(data.isRegion);
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
