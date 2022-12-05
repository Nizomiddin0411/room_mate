import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Autorization/language_dart.dart';

import '../../provider/profile_provider.dart';
import '../../services/post_change_profile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {


  String name = Hive.box('fullname').get('fullname').toString();
  String number = Hive.box('phone').get('phone');
  bool isSwitched = false;
  bool isSwitchedSecond = false;
  @override
  void initState() {
    super.initState();
    Provider.of<ProfieleProvider>(context, listen: false).getProfile().asStream();
    // isSwitched = Hive.box('hide_phone').get('hide_phone') == null || Hive.box('hide_phone').get('hide_phone').toString() == '2'
    //   ?   false
    //   :  true;
    // isSwitchedSecond = Hive.box('hide_profile').get('hide_profile') == null || Hive.box('hide_profile').get('hide_profile').toString() == '2'
    //   ? false
    //   : true;
    if(Provider.of<ProfieleProvider>(context, listen: false).profile.hidePhone == 1){
      isSwitched = true;
    }else{
      isSwitched = false;
    }

    if(Provider.of<ProfieleProvider>(context, listen: false).profile.hideProfile == 1){
      isSwitchedSecond = true;
    }else{
      isSwitchedSecond = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    print(Hive.box('hide_profile').get('hide_profile').toString() + "aa");

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
      body: Consumer<ProfieleProvider>(

     builder: (_, data, __) {


    return SingleChildScrollView(
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
              // Hive.box('fullname').isEmpty ? 'name' : name,
              data.profile.fullName.toString(),
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
            data.profile.roleId.toString() == 2.toString() ? ListTile(
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
              ).tr(),
              trailing: SizedBox(
                height: 60.h,
                width: 80.w,
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) async{
                    print(isSwitched);
                    setState(() {
                      isSwitched = value;
                    });
                    ChangeProfile().ChangeProf(
                      hide: isSwitched ? '1' : '2', isHide: '1',
                    );
                    print(isSwitched);

                    await data.getProfile();
                  },
                ),
              ),
            ):Container(),
            data.profile.roleId == 2 ? ListTile(
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
              ).tr(),
              trailing: SizedBox(
                height: 60.h,
                width: 80.w,
                child: Switch(
                  value: isSwitchedSecond,
                  onChanged: (value) {


                    setState(() {
                      isSwitchedSecond = value;
                    });
                    ChangeProfile().ChangeProf(
                      hide: isSwitchedSecond ? '1' : '2',
                      isHide: '2',
                    );
                  },
                ),
              ),
            ) : Container(),
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
                  "Akkauntdan chiqish ",
                  style: TextStyle(fontSize: 18.sp, color: AppColors.error),
                ).tr(),
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
      );
  },
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
