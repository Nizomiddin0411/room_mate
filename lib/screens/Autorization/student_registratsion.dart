import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/get_district_model.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/get_region_model.dart';
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
  String Course = '1';
  String Roommate = '';
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
  bool kurs = false;
  bool univer = false;
  bool viloyat = false;
  bool ktuman = false;
  bool fakultet = false;
  bool jinsi= false;

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
  final myController = TextEditingController();
  final nameController = TextEditingController();
  String? selectedValue;
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("To’liq ism , familyangiz"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e){
                    if(e!.length > 3){
                      return null;
                    }else{
                      return 'Kamida 4ta soz bolishi kerak';
                    }
                  },
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:myController.text == '' ? Colors.red : Colors.black12)
                    ),
                    labelText: 'Ism familyangizni kiriting',
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
                    Text("Telefon raqamingiz"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e){
                    if(e!.length > 12){
                      return null;
                    }else{
                      return '12  ta raqam kiriting ';
                    }
                  },
                  keyboardType: TextInputType.phone,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '+ 998 ** *** ** **',
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
                    Text("Jinsingiz tanlang"),
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
                        'Jinsingiz',
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
                          jinsi=true;
                          jinsiColor = Colors.black12;
                          print(dropdownvalue);
                        });
                      },
                      onSaved: (value) {
                        dropdownvalue = value.toString();
                        setState(() {

                        });
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
                    Text("Oliy o’quv yurtingiz"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    FutureBuilder<List<GetUniverModel>?>(
                      future: GetUniverService().fetchUniver(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField2<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: univerColor)),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Oliy o’quv yurtingiz',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding: const EdgeInsets.only(
                                left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: snapshot.data!
                                .map(
                                  (value) => DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(
                                  value.name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return ' Oliy o’quv yurtingiz ';
                              }
                              setState(() {

                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                UniderId = (value as String?)!;
                                univer=true;
                                univerColor = Colors.black12;
                              });
                            },
                            onSaved: (value) {
                              UniderId = value.toString();
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
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
                    Text("Fakultetingiz"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    FutureBuilder<List<GetFacultyModel>?>(
                      future: GetFacultyService().fetchFaculty(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField2<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: fakultColor)),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            isDense: false,
                            hint: const Text(
                              'Fakultetingiz',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding: const EdgeInsets.only(
                                left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: univer ? snapshot.data!
                                .map(
                                  (value) => DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(
                                  value.name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                                .toList() : [],
                            onChanged: (value) {
                              fakultetId = (value)!;
                              fakultet = true;
                              fakultColor = Colors.black12;

                            } ,
                            validator: (value){
                              if(value==null|| value.isEmpty){
                                print("qwwwwwwwwwwwwwwwwwwwwww");
                                return 'Fakultetni tanlang';
                              }
                              return null;
                            },

                          );

                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
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
                    Text("Kursingiz"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kursColor)),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                      isDense: false,
                      buttonElevation: 2,
                      hint: const Text(
                        'Kursingizni kiriting',
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
                      validator: (value)=>value==value?'Kursingizni kiriting':null,
                      onChanged: (String? value) {
                        selectedValue = value;
                        kurs = true;
                        kursColor = Colors.black12;
                        setState(() {

                        });
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
                    Text("Qaysi viloyatliksiz"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    FutureBuilder<List<GetRegionModel>?>(
                      future: GetRegionService().fetchRegion(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField2<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: viloyatColor)),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Qaysi viloyatliksiz',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding: const EdgeInsets.only(
                                left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: snapshot.data!
                                .map(
                                  (value) => DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(
                                  value.name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return '';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                District = (value as String?)!;
                                viloyat=true;
                                viloyatColor = Colors.black12;
                              });
                            },
                            onSaved: (value) {
                              dropdownvalue = value.toString();
                            },
                          );
                        }
                        return CircularProgressIndicator();
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
                    Text(" Qaysi tumanidansiz"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    FutureBuilder<List<GetDistrictModel>?>(
                      future: GetDistrictService().fetchDistrict(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField2<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: tumanColor)),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              ' Qaysi tumanidansiz',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding: const EdgeInsets.only(
                                left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: snapshot.data!
                                .map(
                                  (value) => DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(
                                  value.name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                            validator: (value) {

                            },
                            onChanged: (value) {
                              setState(() {
                                Tuman = (value as String?)!;
                                ktuman=true;
                                tumanColor = Colors.black12;
                              });
                            },
                          );
                        }
                        return CircularProgressIndicator();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sherik kerak",
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 35.h,
                        width: 80.w,
                        child: Switcher(
                          value: false,
                          size: SwitcherSize.medium,
                          switcherButtonRadius: 30.r,
                          enabledSwitcherButtonRotate: true,
                          iconOff: Icons.lock,
                          iconOn: Icons.check,
                          colorOff: Colors.blue.withOpacity(0.3),
                          colorOn: Colors.blue,
                          onChanged: (bool state) {},
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
                Text("Roziman "),
                InkWell(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OffertoPage()));
                        },
                        child: Text(
                          "  Foydalanuvchi shartlariga",
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
                if(kurs && viloyat && univer && fakultet&& ktuman && myController.text != ''&&jinsi){
                  await RegistratsiyaStudent().CreateAdsStudent(
                      FullName: myController.toString(),
                      fakultetId: fakultetId,
                      Course:selectedValue.toString(),
                      Roommate: value.toString(),
                      District: District.toString(),
                      Phonenumber: nameController.text,
                      gender: dropdownvalue.toString() == 'Erkak' ? '1' : '2',
                      UniderId: UniderId.toString());
                  print('${myController} maulotiiiiiiiii+++++++++++');
                  print('${selectedValue} maulotiiiiiiiii+++++++++++');

                  print('${UniderId} malumotlar  +++++++++++');
                  print('${District} maulotiiiiiiiii+++++++++++');
                  print('${fakultetId} maulotiiiiiiiii+++++++++++');
                  print('${nameController.text} maulotiiiiiiiii+++++++++++');
                  print('${dropdownvalue} maulotiiiiiiiii+++++++++++');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()));
                }
                else{
                  kursColor = Colors.red;
                  univerColor = Colors.red;
                  viloyatColor = Colors.red;
                  tumanColor = Colors.red;
                  fakultColor = Colors.red;
                  jinsiColor = Colors.red;
                  if(kurs) kursColor = Colors.black12;
                  if(univer) univerColor = Colors.black12;
                  if(viloyat) viloyatColor = Colors.black12;
                  if(ktuman) tumanColor = Colors.black12;
                  if(fakultet) fakultColor = Colors.black12;
                  if(jinsi) jinsiColor = Colors.black12;


                  setState(() {

                  });
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
                        color: AppColors.backgroundWhite,
                        fontSize: 20.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
