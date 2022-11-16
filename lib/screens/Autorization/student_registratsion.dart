import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/lang_model.dart';
import 'package:talaba_uy/provider/universitet_provider.dart';
import 'package:talaba_uy/screens/Autorization/offerto_dart.dart';
import 'package:talaba_uy/screens/Autorization/registratsiya%20succedful_page.dart';
import 'package:talaba_uy/services/post_create_student.dart';

import '../../cubit/aut_cubit.dart';

class StudentUser extends StatefulWidget {
  const StudentUser({Key? key}) : super(key: key);

  @override
  State<StudentUser> createState() => _StudentUserState();
}

class _StudentUserState extends State<StudentUser> {
  String Phonenumber = '';
  String FullName = '';
  String? university_id;
  String fakultetId = '';
  String Course = '';
  String? Roommate;
  String District = '';
  String Tuman = '';
  String? gender;
  Color kursColor = Colors.black12;
  Color fakultColor = Colors.black12;
  Color univerColor = Colors.black12;
  Color numberColor = Colors.black12;
  Color nameColor = Colors.black12;
  Color viloyatColor = Colors.black12;
  Color tumanColor = Colors.black12;
  Color jinsiColor = Colors.black12;
  String value2 = '';
  String? value1;
  bool kurs = false;
  bool univer = false;
  bool viloyat = false;
  bool ktuman = false;
  bool fakultet = false;
  bool jinsi = false;
  String drowdown1 = '';
  String drowdown2 = '';

  final List<String> genderItems = [
    "O'g'il",
    'Qiz',
  ];
  final List<String> kursingizItems = [
    '1 ',
    '2',
    '3 ',
    '4 ',
  ];
  bool checkBox = false;
  bool hidenumber = false;
  String? value3;
  final myController = TextEditingController();
  final nameController = TextEditingController(text: "+998");
  String? selectedValue;
  String? dropdownvalue;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    context.read<AutCubit>().selectSettingLan(
        LangData.languageList.singleWhere((e) => e.locale == context.locale),
        context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: SingleChildScrollView(
        child: Consumer<UniversitetProvider>(builder: (_, data, __) {
          return Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Ism va familiya ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) {
                      if (e!.length > 3) {
                        return null;
                      } else {
                        return "Kamida 2 ta so’zdan iborat bo’lishi kerak".tr();
                      }
                    },
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: myController.text == ''
                                  ? Colors.red
                                  : Colors.black12)),
                      hintText: "Ism va familiyangizni kiriting".tr(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Telefon raqami").tr(),
                      SizedBox(width: 165.w,),
                           Text(
                            "Ko’rinmasin",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 80.h,
                        width: 240.w,
                        child: TextFormField(
                          inputFormatters: [
                            TextInputMask(
                              mask: '\\+ 999 99 999 99 99',
                              placeholder: '_ ',
                              maxPlaceHolders: 13,
                            )
                          ],
                          autovalidateMode: AutovalidateMode.always,
                          validator: (e) {
                            if (e!.length > 12) {
                              return null;
                            } else {
                              return '9 ta raqam kiriting';
                            }
                          },
                          keyboardType: TextInputType.phone,
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Column(
                        children: [
                     
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.w,10.h,5.w,25.h),
                            child: Checkbox(
                              value: hidenumber,
                              onChanged: (bool? value) {
                                setState(() {
                                  hidenumber = value!;
                                  print(hidenumber);
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Jins".tr()),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    children: [
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: jinsiColor),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        isExpanded: true,
                        hint: Text(
                          "Jinsni tanlang",
                          style: TextStyle(fontSize: 14.sp),
                        ).tr(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        itemPadding: EdgeInsets.only(left: 10.w, right: 15.w),
                        itemHeight: 30.h,
                        iconSize: 30.sp,
                        buttonHeight: 60.h,
                        buttonPadding: EdgeInsets.only(left: 20.w, right: 10.w),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        items: genderItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Jinsingiz tanlang';
                          }
                        },
                        onChanged: (String? value) {
                          setState(() {
                            dropdownvalue = value;
                            jinsi = true;
                            jinsiColor = Colors.black12;
                            print(dropdownvalue);
                          });
                        },
                        onSaved: (value) {
                          dropdownvalue = value.toString();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Oliy o’quv yurti").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    children: [
                      // DropdownButtonFormField2(
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: univerColor)),
                      //     isDense: true,
                      //     contentPadding: EdgeInsets.zero,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      //   isExpanded: true,
                      //   hint: const Text(
                      //     'Oliy o’quv yurtini tanlang',
                      //     style: TextStyle(fontSize: 14),
                      //   ).tr(),
                      //   icon: const Icon(
                      //     Icons.arrow_drop_down,
                      //     color: Colors.black45,
                      //   ),
                      //   iconSize: 30,
                      //   buttonHeight: 60,
                      //   buttonPadding:
                      //       const EdgeInsets.only(left: 20, right: 10),
                      //   dropdownDecoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   items: data.universitet.map((e) {
                      //     return DropdownMenuItem<String>(
                      //       onTap:(){
                      //       data.universiterid=e.id.toString();
                      //     },
                      //       value: e.name ?? "",
                      //       child: Text(
                      //         e.name.toString(),
                      //         style:  TextStyle(
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   onChanged: (newValue) async {
                      //     print("Selected ----------- $newValue");
                      //     final selected = data.universitet
                      //         .where((element) => element.name == newValue);
                      //     data.getFakultet(selected.last.id!);
                      //     setState(() {
                      //       drowdown1 = newValue.toString();
                      //       drowdown1=UniderId;
                      //       univer = true;
                      //       univerColor = Colors.black12;
                      //     });
                      //   },
                      // ),
                      DropdownSearch<String>(
                        mode: Mode.BOTTOM_SHEET,
                        items: data.universitet.map((e) {
                          if (drowdown2 == e.name) {
                            data.UniversiterId = e.id.toString();
                            data.isId = e.id;
                            university_id = e.id.toString();
                          }
                          return context.read<AutCubit>().selectedLang.index ==
                                  1
                              ? e.name.toString()
                              : e.nameRu.toString();
                        }).toList(),
                        showSearchBox: true,
                        onChanged: (value) async {
                          data.isUniver = true;
                          final selected = data.universitet
                              .where((element) => element.name == value);
                          data.getFakultet(selected.last.id!);
                          print("${selected.last.id}iminjonov");
                          setState(() {
                            drowdown2 = value.toString();
                            univer = true;
                            univerColor = Colors.black12;
                          });
                          print(drowdown2 + "LLLKLKLJJJHHHGGGGGGGGGGGGG");
                        },
                        selectedItem: tr("Oliy o’quv yurtini tanlang"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Ta'lim yo'nalishini tanglang ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  data.isFakultet
                      ? Column(
                          children: [
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: fakultColor)),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              isExpanded: true,
                              isDense: true,
                              hint: Text(
                                "Yo'nalishni tanlang",
                                style: TextStyle(fontSize: 14.sp),
                              ).tr(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30.sp,
                              buttonHeight: 60.h,
                              buttonPadding:
                                  EdgeInsets.only(left: 20.w, right: 10.w),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              items: data.fakultet
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      onTap: () {
                                        data.fakultetid = e.id.toString();
                                      },
                                      value: data.isFakultet
                                          ? e.name.toString()
                                          : data.defaultvalue,
                                      child: Text(data.isFakultet
                                          ? e.name.toString()
                                          : data.defaultvalue),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) async {
                                setState(() {
                                  drowdown1 = value.toString();
                                  drowdown1 = fakultetId;
                                  fakultet = true;
                                  fakultColor = Colors.black12;
                                });
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: fakultColor)),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              isExpanded: true,
                              isDense: true,
                              hint: Text(
                                "Yo'nalishni tanlang ",
                                style: TextStyle(fontSize: 14.sp),
                              ).tr(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30.sp,
                              buttonHeight: 60.h,
                              buttonPadding:
                                  EdgeInsets.only(left: 20.w, right: 10.w),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: [],
                              onChanged: null,
                            ),
                          ],
                        ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Kurs ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5.r,
                  ),
                  Column(
                    children: [
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kursColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        isDense: true,
                        buttonElevation: 2,
                        hint: Text(
                          "Kursni tanlang",
                          style: TextStyle(fontSize: 14.sp),
                        ).tr(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30.sp,
                        buttonHeight: 60.h,
                        buttonPadding: EdgeInsets.only(left: 20.w, right: 10.w),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        items: kursingizItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) =>
                            value == value ? 'Kursni tanlang' : null,
                        onChanged: (String? value) {
                          Course = value.toString();
                          kurs = true;
                          kursColor = Colors.black12;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Viloyat").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    children: [
                      DropdownButtonFormField2<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: viloyatColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        isExpanded: true,
                        hint: Text(
                          "Viloyatni tanlang",
                          style: TextStyle(fontSize: 14.sp),
                        ).tr(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30.sp,
                        buttonHeight: 60.h,
                        buttonPadding: EdgeInsets.only(left: 20.w, right: 10.w),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: data.Viloyat.map(
                          (e) => DropdownMenuItem<String>(
                            onTap: () {
                              data.districtid = e.id.toString();
                              print('${data.districtid}hhcshcbscuvsycvtuc');
                            },
                            value: e.name ?? "",
                            child: Text(
                              e.name.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ).toList(),
                        onChanged: (newValue) async {
                          print("Selected ----------- $newValue");
                          final selected = data.Viloyat.where(
                              (element) => element.name == newValue);
                          data.getTuman(selected.last.id!);
                          setState(() {
                            viloyat = true;
                            viloyatColor = Colors.black12;
                            drowdown2 = newValue.toString();
                            drowdown2 = District.toString();
                          });
                        },
                        onSaved: (value) {
                          dropdownvalue = value.toString();
                          print("${dropdownvalue}KJJJJJJGGGGGGGGGGGGGGGGGGGG");
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Tuman").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  data.istuman
                      ? Column(
                          children: [
                            DropdownButtonFormField2<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: tumanColor)),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              isExpanded: true,
                              hint: Text(
                                "Tumanni tanlang",
                                style: TextStyle(fontSize: 14.sp),
                              ).tr(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30.sp,
                              buttonHeight: 60.h,
                              buttonPadding:
                                  EdgeInsets.only(left: 20.w, right: 10.w),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: data.tumanlar
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      onTap: () {
                                        print("${e.name}${e.id}");
                                        data.districtId = e.id.toString();
                                      },
                                      value: data.istuman
                                          ? e.name.toString()
                                          : data.defaultvalue1,
                                      child: Text(
                                        e.name.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  Tuman = (value as String?)!;
                                  ktuman = true;
                                  tumanColor = Colors.black12;
                                });
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: fakultColor)),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              isExpanded: true,
                              isDense: true,
                              hint: Text(
                                'Tumanni tanlang',
                                style: TextStyle(fontSize: 14.sp),
                              ).tr(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30.sp,
                              buttonHeight: 60.h,
                              buttonPadding:
                                  EdgeInsets.only(left: 20.w, right: 10.w),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              items: [],
                              onChanged: null,
                            ),
                          ],
                        ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profilni ro’yxatda ko’rinmas qilish".tr(),
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w, vertical: 8.0.h),
                        child: SizedBox(
                          height: 40.h,
                          width: 70.w,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;

                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBox,
                    onChanged: (bool? value) {
                      setState(() {
                        checkBox = value!;
                      });
                    },
                  ),
                  InkWell(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OffertoPage()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Roziman".tr(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.sp),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Foydalanuvchi shartlariga",
                            style: TextStyle(
                                color: AppColors.mainColor, fontSize: 15.sp),
                          ),
                          const Divider(
                            color: Colors.red,
                            thickness: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text("Ro’yxatdan muvaffaqiyatli o’tdingiz"),
                  //       );
                  //     });
                  if (!checkBox) _showToast(context, checkBox);
                  if (kurs &&
                      viloyat &&
                      fakultet &&
                      univer &&
                      ktuman &&
                      myController.text != '' &&
                      jinsi &&
                      checkBox) {
                    // print("${myController.text}" +'full name' );
                    // print("${nameController.text}" + ' telefon');
                    // print("${hidenumber ? '1' : '2'}" + 'hide phone');
                    // print("${dropdownvalue.toString() == "O'g'il" ? '1' : '2'}" + 'Gendor');
                    // print("${university_id.toString()}" + 'universitet id');
                    // print("${data.fakultetid.toString()}" + 'facultet');
                    // print("${Course.toString()}" + 'course');
                    // print("${isSwitched.toString() == 'Ha' ? '1' : '2'}" + 'hide profile');
                    // print("${data.districtId.toString()}" + 'tuman');



                    await RegistratsiyaStudent().CreateAdsStudent(
                      FullName: myController.text,
                      fakultetId: data.fakultetid.toString(),
                      Course: Course.toString(),
                      HideProfile: isSwitched ? '1' : '2',
                      District: data.districtId.toString(),
                      Phonenumber: nameController.text,
                      gender: dropdownvalue.toString() == "O'g'il" ? '1' : '2',
                      UniderId: university_id.toString(),
                      Hidenumber: hidenumber ? '1' : '2',
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuccedfulPage()));
                  } else {
                    kursColor = Colors.red;
                    univerColor = Colors.red;
                    viloyatColor = Colors.red;
                    tumanColor = Colors.red;
                    fakultColor = Colors.red;
                    jinsiColor = Colors.red;
                    if (kurs) kursColor = Colors.black12;
                    if (univer) univerColor = Colors.black12;
                    if (viloyat) viloyatColor = Colors.black12;
                    if (ktuman) tumanColor = Colors.black12;
                    if (fakultet) fakultColor = Colors.black12;
                    if (jinsi) jinsiColor = Colors.black12;
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Container(
                  width: 250.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    // color: AppColors.buttonLinear
                  ),
                  child: Center(
                    child: Text(
                      "Ro’yxatdan o’tish".tr(),
                      style: TextStyle(
                          color: AppColors.backgroundWhite, fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void _showToast(BuildContext context, bool isCheck) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: const Text(
          'Foydalanish shartini bajarmadingiz !!!',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        action: SnackBarAction(
            label: '',
            onPressed: () {
              scaffold.hideCurrentSnackBar();
              isCheck = true;
              print(isCheck);
            }),
      ),
    );
  }
}
