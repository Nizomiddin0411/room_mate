import 'package:dropdown_button2/dropdown_button2.dart';
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
  String? gender;

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
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                TextField(
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
                        border: OutlineInputBorder(
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
                          return 'Please select gender.';
                        }
                      },
                      onChanged: (String? value) {
                        setState(() {
                          dropdownvalue = value;
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
                                return '  ';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                UniderId = (value as String?)!;
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
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
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
                                return 'Oliy o’quv yurtingiz';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                fakultetId = (value as String?)!;
                              });
                            },
                            onSaved: (value) {
                              fakultetId = value.toString();
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
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      isExpanded: true,
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
                      validator: (value) {
                        if (value == null) {
                          return 'Please select gender.';
                        }
                      },
                      onChanged: (String? value) {
                        selectedValue = value;
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
                                return 'Oliy o’quv yurtingiz';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                UniderId = (value as String?)!;
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
                              if (value == null) {
                                return 'Oliy o’quv yurtingiz';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                District = (value as String?)!;
                              });
                            },
                            onSaved: (value) {
                              District = value.toString();
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
                await RegistratsiyaStudent().CreateAdsStudent(
                    FullName: myController.toString(),
                    fakultetId: fakultetId,
                    Course:selectedValue.toString(),
                    Roommate: value.toString(),
                    District: District,
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
