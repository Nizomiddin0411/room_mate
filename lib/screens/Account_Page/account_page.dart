import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _switchValue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: const Center(
          child: Text(
            "Shaxsiy kobinet",
            style: TextStyle(color: AppColors.mainColor),
          ),
        ),
        leading: IconButton(
          icon: Icon(
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
                  image: DecorationImage(
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
            "Abdullayev Axmatjon",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          Text("+998991234567"),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            leading: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.iconBack,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(
                  Icons.payment,
                  color: AppColors.mainColor,
                )),
            title: Text(
              "To'lovlar",
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          ListTile(
            leading: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.iconBack,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(
                  Icons.chat,
                  color: AppColors.mainColor,
                )),
            title: Text(
              "Fikr qoldirish",
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
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
            height: 85.h,
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
      // Hive.box('token').clear();
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) => const LoginPage()),
      //         (route) => false);
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