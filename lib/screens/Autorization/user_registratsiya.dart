import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Autorization/LoginPage.dart';
import 'package:talaba_uy/screens/Autorization/offerto_dart.dart';
import 'package:easy_mask/easy_mask.dart';

import '../../services/post_user registratsion.dart';
class UserRegistratsion extends StatefulWidget {
  const UserRegistratsion({Key? key}) : super(key: key);

  @override
  State<UserRegistratsion> createState() => _UserRegistratsionState();
}

class _UserRegistratsionState extends State<UserRegistratsion> {
  String Phonenumber = '';
  String FullName = '';
  String UniderId = '';
  String fakultetId = '';
  String Course = '1';
  String Roommate = '';
  String District = '';
  String? gender;
  Color jinsiColor = Colors.black12;
  bool jinsi= false;
  bool checkBox = false;

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

  final myController = TextEditingController();
  final nameController = TextEditingController();
  String? selectedValue;
  String? dropdownvalue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("Ism va familiya "),
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
                    labelText: "Ism va familiyangizni kiriting",
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
                    Text("Telefon raqami "),
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
                    Text("Jins "),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: this.checkBox,
                  onChanged: (bool? value) {
                    setState(() {
                      this.checkBox = value!;
                    });
                  },
                ),
                Text("Roziman "),
                InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OffertoPage())),
                    },
                    child: Text(
                      "Foydalanuvchi shartlariga roziman",
                      style: TextStyle(
                          color: AppColors.mainColor, fontSize: 15),
                    ))
              ],
            ),
            SizedBox(height: 100.h),
            ElevatedButton(
              onPressed: () async {
               if(myController.text != ''&&jinsi&&checkBox){
                 await RegistratsiyaUser().CreateAdsUser(
                   FullName: myController.toString(),
                   Phonenumber: nameController.text,
                   gender: dropdownvalue.toString() == 'Erkak' ? '1' : '2',);
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => LoginPage()));
               }
               else{
                 jinsiColor = Colors.red;
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
