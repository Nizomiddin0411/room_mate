
import 'package:easy_localization/easy_localization.dart';
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



  Color jinsiColor = Colors.black12;
  bool jinsi = false;
  bool checkBox = false;




  final myController = TextEditingController();
  final nameController = TextEditingController(text: "+998 ");



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
                    const Text("Ism va familiya").tr(),
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
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 95.h,
                      width: 345.w,
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
                            return tr('9 ta raqam kiriting');
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
                  children: const [],
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
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OffertoPage())),
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
                          "Foydalanuvchi shartlariga roziman".tr(),
                          style: TextStyle(
                              color: AppColors.mainColor, fontSize: 15.sp),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(height: 100.h),
            ElevatedButton(
              onPressed: () async {
                if (!checkBox) _showToast(context, checkBox);
                if (myController.text != '' &&
                    checkBox &&
                    nameController.text != '') {
                  await RegistratsiyaUser().CreateAdsUser(
                    FullName: myController.text,
                    Phonenumber: nameController.text,
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } else {
                  jinsiColor = Colors.red;
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
                    "Ro’yhatdan o’tish".tr(),
                    style: TextStyle(
                        color: AppColors.backgroundWhite, fontSize: 20.sp),
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

void _showToast(BuildContext context, bool isCheck) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content:  Text(
        tr("Foydalanish shartini bajarmadingiz")+ '!!!',
        style: const TextStyle(
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
