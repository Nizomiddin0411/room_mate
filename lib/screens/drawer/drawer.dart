import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:talaba_uy/chat/all_chats.dart';
import 'package:talaba_uy/chat/chat_page.dart';
import 'package:talaba_uy/screens/Settings/setting.dart';

import '../Favorit_Ads_Page/favorit_ads_page.dart';
import '../Favorit_Page/favorits_page.dart';
import '../Feedback_Page/feedback_page.dart';
import '../Notification_Page/notification_page.dart';


class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                 physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    ListTile(
                      title:  Text("Asosiy").tr(),
                      onTap: () {},
                      leading: Image.asset('assets/images/Vector.png'),
                    ),
                    ListTile(
                      title:  Text("E’lonlarim").tr(),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const FavoritAds()));
                      },
                      leading: const Icon(Icons.checklist_rtl_sharp),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title:  Text("Sozlamalar").tr(),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Setting()));
                      },
                      // expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    // ListTile(
                    //     title:  Text("Bildirishnomalar").tr(),
                    //     onTap: () {
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) => const NotificationPage()));
                    //     },
                    //     leading: const Icon(Icons.notifications_none)),
                    ListTile(
                      title:  Text("Chat").tr(),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllChats()));
                      },
                      leading: const Icon(Icons.chat),
                    ),
                    ListTile(
                        title:  Text("Sevimlilar").tr(),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const FavoritPage()));
                        },
                        leading: const Icon(Icons.favorite_border)),
                    // ListTile(
                    //     title:  Text("Feedback qoldirish").tr(),
                    //     onTap: () {
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) => const FeedbackPage()));
                    //     },
                    //     leading: const Icon(Icons.textsms)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 100, 0, 0),
                      child: ListTile(
                        title: const Text("Version 1.1.0"),
                        onTap: () {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: const Text("ha"),
    onPressed: () async {
      Hive.box('token').clear();
    },
  );
  Widget notButton = ElevatedButton(
    child: const Text("yoq"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("Simple Alert"),
    content: const Text("Accountdan chiqish"),
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
