import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Autorization/language_dart.dart';

import '../../services/post_change_profile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _switchValue = false;
  bool isSwitched = false;
  String name = Hive.box('fullname').get('fullname').toString();
  String number = Hive.box('phone').get('phone').toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Text(
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
      body: Column(
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
            Hive.box('fullname').isEmpty ? 'name' :  name,
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
          ListTile(
            leading: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.iconBack,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(
                  Icons.supervisor_account,
                  color: AppColors.mainColor,
                )),
            title: Text(
              "Sherik kerak",
              style: TextStyle(fontSize: 18.sp),
            ),
            trailing: Container(
              height: 60.h,
              width: 80.w,
              child:
              Switch(
                value: isSwitched,
                onChanged: (value) {
                   ChangeProfile().ChangeProf(id: _switchValue ? '2': '1');
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
          ),
          InkWell(
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
                "Hisobdan chiqish",
                style: TextStyle(fontSize: 18.sp, color: AppColors.error),
              ),
            ),
          ),
          SizedBox(
            height: 230.h,
          ),
          Center(
            child: Text("Version 1.1.0"),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(

    style: ElevatedButton.styleFrom(
        primary: AppColors.error
    ),
    child: Text("Chiqish"),
    onPressed: () async{
      Hive.box('token').clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => const LanguagePage()),
              (route) => false);
    },
  );
  Widget notButton = ElevatedButton(

    child: Text("Bekor qilish"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hisobdan chiqish"),
    content: Text("Hisobdan chiqishga ishonchingiz komilmi ?"),
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