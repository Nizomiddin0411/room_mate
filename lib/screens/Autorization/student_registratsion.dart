import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/core/data/mockdata.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/get_region_model.dart';
import 'package:talaba_uy/provider/universitet_provider.dart';
import 'package:talaba_uy/screens/Autorization/LoginPage.dart';
import 'package:talaba_uy/screens/Autorization/offerto_dart.dart';
import 'package:talaba_uy/services/get_district_service.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_region_service.dart';
import 'package:talaba_uy/services/get_univer_service.dart';
import 'package:talaba_uy/services/post_create_student.dart';

import '../../models/get_univer_model.dart';

class StudentUser extends StatefulWidget {
  const StudentUser({Key? key}) : super(key: key);

  @override
  State<StudentUser> createState() => _StudentUserState();
}

class _StudentUserState extends State<StudentUser> {
  String Phonenumber = '';
  String FullName = '';
  String UniderId = '';
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
  String drowdown1='';
  String drowdown2='';

  final List<String> genderItems = [
    'Ayol',
    'Erkak',
  ];
  final List<String> kursingizItems = [
    '1 ',
    '2',
    '3 ',
    '4 ',
  ];
  bool value = false;
  String? value3;
  final myController = TextEditingController();
  final nameController = TextEditingController();
  String? selectedValue;
  String? dropdownvalue;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Consumer<UniversitetProvider>(
            builder: (_, data, __) {
          return Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text("Ism va familiya ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) {
                      if (e!.length > 3) {
                        return null;
                      } else {
                        return 'Kamida 4ta soz bolishi kerak'.tr();
                      }
                    },
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: myController.text == ''
                                  ? Colors.red
                                  : Colors.black12)),
                      labelText: 'Ism va familiyangizni kiriting'.tr(),
                    ),
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
                      Text("Telefon raqami").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
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
                        return '12  ta raqam kiriting ';
                      }
                    },
                    keyboardType: TextInputType.phone,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefon raqamini kiriting',
                    ),
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
                      Text("Jins ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: jinsiColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Jinsni tanlang',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        itemPadding: EdgeInsets.only(left: 10, right: 15),
                        itemHeight: 30,
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: genderItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Oliy o’quv yurti").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: univerColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Oliy o’quv yurtini tanlang',
                          style: TextStyle(fontSize: 14),
                        ).tr(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: data.universitet.map((e) {
                          return DropdownMenuItem<String>(
                            onTap:(){
                            data.universiterid=e.id.toString();
                          },
                            value: e.name ?? "",
                            child: Text(
                              e.name.toString(),
                              style:  TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) async {
                          print("Selected ----------- $newValue");
                          final selected = data.universitet
                              .where((element) => element.name == newValue);
                          data.getFakultet(selected.last.id!);
                          setState(() {
                            drowdown1 = newValue.toString();
                            drowdown1=UniderId;
                            univer = true;
                            univerColor = Colors.black12;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Fakultet ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                 , data.isFakultet
                  ? Column(
                    children: [
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: fakultColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        isExpanded: true,
                        isDense: true,
                        hint: const Text(
                          'Fakultetni kiriting',
                          style: TextStyle(fontSize: 14),
                        ).tr(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: data.fakultet
                            .map(
                              (e) => DropdownMenuItem<String>(
                                onTap: () {
                                  data.fakultetid=e.id.toString();
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
                        onChanged: (newValue)async {
                          setState(() {
                            drowdown1 =  newValue.toString();
                            drowdown1 = fakultetId;
                            fakultet = true;
                            fakultColor = Colors.black12;
                          });
                        },
                      ),

                    ],
                  ):
                  Column(
                    children: [
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: fakultColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        isExpanded: true,
                        isDense: true,
                        hint: const Text(
                          'Fakultetni kiriting',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                        const EdgeInsets.only(left: 20, right: 10),
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
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Kurs ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        isDense: true,
                        buttonElevation: 2,
                        hint: const Text(
                          "Kursni tanlang",
                          style: TextStyle(fontSize: 14),
                        ).tr(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: kursingizItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Viloyat ").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      DropdownButtonFormField2<String>(

                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: viloyatColor)),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                "Viloyatni tanlang",
                                style: TextStyle(fontSize: 14),
                              ).tr(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: data.Viloyat
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      onTap:(){
                                        data.districtid=e.id.toString();
                                        print('${data.districtid}hhcshcbscuvsycvtuc');
                                      },
                                      value: e.name ??"",
                                      child: Text(
                                        e.name.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                             onChanged: (newValue) async {
                        print("Selected ----------- $newValue");
                        final selected = data.Viloyat
                            .where((element) => element.name == newValue);
                        data.getTuman(selected.last.id!);
                        setState(() {
                          viloyat = true;
                          viloyatColor = Colors.black12;
                          drowdown2 = newValue.toString();
                          drowdown2= District.toString();
                        });
                      },
                              onSaved: (value) {
                                dropdownvalue = value.toString();
                              },
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
                      Text("Tuman").tr(),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  data.istuman
                  ?
                  Column(
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
                              hint: const Text(
                                "Tumanni tanlang",
                                style: TextStyle(fontSize: 14),
                              ).tr(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items:data.tumanlar
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: data.istuman
                                      ?e.name.toString()
                                      :data.defaultvalue1,
                                      child: Text(
                                        e.name.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
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
                  ):
                  Column(
                    children: [
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: fakultColor)),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        isExpanded: true,
                        isDense: true,
                        hint: const Text(
                          'Tumanni tanlang',
                          style: TextStyle(fontSize: 14),
                        ).tr(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                        const EdgeInsets.only(left: 20, right: 10),
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
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sherik kerak".tr(),
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text("Roziman ".tr()),
                  InkWell(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OffertoPage()));
                          },
                          child: Text(
                            "Foydalanuvchi shartlariga roziman".tr(),
                            style: TextStyle(
                                color: AppColors.mainColor, fontSize: 15),
                          )))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  showDialog(context: context, builder: ( context){
                    return AlertDialog(
                      title: Text("Ro'yxatdan muaffaqiyatli o'tdingi  "),
                      content: Text("Tabriklaymiz !!!"),
                    );
                  });

                  if (kurs &&
                      viloyat &&
                      univer &&
                      fakultet &&
                      ktuman &&
                      myController.text != '' &&
                      jinsi
                   &&value) {
                    await RegistratsiyaStudent().CreateAdsStudent(
                        FullName: myController.text,
                        fakultetId: data.fakultetid.toString(),
                        Course: Course.toString(),
                        Roommate: isSwitched.toString()=='ha' ? '1':'2',
                        District: data.districtid.toString(),
                        Phonenumber: nameController.text,
                        gender: dropdownvalue.toString() == 'Erkak' ? '1' : '2',
                        UniderId: data.universiterid.toString()
                    );
                    Hive.box('name').put( 'name', myController.text );
                    Hive.box('number').put( 'number', nameController.text );
                    print('${myController} maulotiiiiiiiii+++++++++++');
                    print('${Roommate} sherik kerak mi +++++++++++');
                    print('${UniderId} malumotlar  +++++++++++');
                    print('${District} maulotiiiiiiiii+++++++++++');
                    print('${fakultetId} maulotiiiiiiiii+++++++++++');
                    print('${nameController.text} maulotiiiiiiiii+++++++++++');
                    print('${dropdownvalue} maulotiiiiiiiii+++++++++++');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
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
                      "Ro’yxatda o’tish",
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
}
