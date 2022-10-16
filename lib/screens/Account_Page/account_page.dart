import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Autorization/language_dart.dart';

import '../../services/post_change_profile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final bool _switchValue = false;
  bool isSwitched = Hive.box('hide_phone').get('hide_phone') != null && Hive.box('hide_phone').get('hide_phone') == 1
      ?   true
      :  false;
  bool isSwitchedSecond = Hive.box('hide_profile').get('hide_profile') != null
      ? true
      : false;
  String name = Hive.box('fullname').get('fullname').toString();
  String number = Hive.box('phone').get('phone').toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: const Text(
            "Shaxsiy kabinet",
            style: TextStyle(color: AppColors.mainColor),
          ).tr(),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/accountImage.png',
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              Hive.box('fullname').isEmpty ? 'name' : name,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(Hive.box('fullname').isEmpty ? 'phone' : number),
            SizedBox(
              height: 20.h,
            ),
            //       InkWell(
            //       onTap: () {},
            // child: ListTile(
            //         leading: Container(
            //             width: 40.w,
            //             height: 40.h,
            //             decoration: BoxDecoration(
            //               color: AppColors.iconBack,
            //               borderRadius: BorderRadius.circular(8.r),
            //             ),
            //             child: const Icon(
            //               Icons.payment,
            //               color: AppColors.mainColor,
            //             )),
            //         title: Text(
            //           "To'lovlar",
            //           style: TextStyle(fontSize: 18.sp),
            //         ),
            //       ),
            //       ),
            // InkWell(
            // onTap: () {},
            // child: ListTile(
            //         leading: Container(
            //             width: 40.w,
            //             height: 40.h,
            //             decoration: BoxDecoration(
            //               color: AppColors.iconBack,
            //               borderRadius: BorderRadius.circular(8.r),
            //             ),
            //             child: const Icon(
            //               Icons.chat,
            //               color: AppColors.mainColor,
            //             )),
            //         title: Text(
            //           "Fikr qoldirish",
            //           style: TextStyle(fontSize: 18.sp),
            //         ),
            //       ),
            // ),
            Hive.box('type').get('type') == 2 ? ListTile(
              leading: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.iconBack,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const Icon(
                    Icons.call,
                    color: AppColors.mainColor,
                  )),
              title: Text(
                "Telefon raqamni ko’rinmas qilish",
                style: TextStyle(fontSize: 18.sp),
              ),
              trailing: Container(
                height: 60.h,
                width: 80.w,
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    ChangeProfile().ChangeProf(
                        hidePhone: _switchValue ? '1' : '2', hideProfile: ''
                    );
                    setState(() {
                      isSwitched = value;
                      Hive.box('hide_phone').put('hide_phone',value ? '1':'2');
                    });
                  },
                ),
              ),
            ):Container(),
            Hive.box('type').get('type') == 2 ? ListTile(
              leading: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.iconBack,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const Icon(
                    Icons.visibility_off,
                    color: AppColors.mainColor,
                  )),
              title: Text(
                "Profilni ro’yxatda ko’rinmas qilish",
                style: TextStyle(fontSize: 18.sp),
              ),
              trailing: Container(
                height: 60.h,
                width: 80.w,
                child: Switch(
                  value: isSwitchedSecond,
                  onChanged: (value) {
                    ChangeProfile().ChangeProf(
                        hideProfile: _switchValue ? '1' : '2', hidePhone: '');
                    setState(() {
                      isSwitchedSecond = value;
                      Hive.box('hide_profile').put('hide_profile',value);
                    });
                  },
                ),
              ),
            ) : Container(),
            Hive.box('type').get('type') != 2 ? InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: ListTile(
                leading: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.colorBack2,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(
                      Icons.exit_to_app,
                      color: AppColors.error,
                    )),
                title: Text(
                  "Akkauntdan chiqish ",
                  style: TextStyle(fontSize: 18.sp, color: AppColors.error),
                ).tr(),
              ),
            ):Center(
              child: InkWell(
                onTap: () {
                  showAlertDialog(context);
                },
                child: ListTile(
                  leading: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.colorBack2,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(
                        Icons.exit_to_app,
                        color: AppColors.error,
                      )),
                  title: Text(
                    "Akkauntdan chiqish ",
                    style: TextStyle(fontSize: 18.sp, color: AppColors.error),
                  ).tr(),
                ),
              ),
            ),
            SizedBox(
              height: 230.h,
            ),
            const Center(
              child: Text("Version 1.1.0"),
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: AppColors.error),
    child: Text("Chiqish").tr(),
    onPressed: () async {
      Hive.box('token').clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LanguagePage()),
          (route) => false);
    },
  );
  Widget notButton = ElevatedButton(
    child: Text("Bekor qilish").tr(),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Akkauntdan chiqish ").tr(),
    content: Text("Akkauntdan chiqishga ishonchingiz komilmi?").tr(),
    actions: [
      notButton,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
