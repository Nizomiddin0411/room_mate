import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../core/const/app_colors.dart';

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
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.kblue,
              ),
              child: Image.asset('assets/images/Vector.png'),
            ),
            ListTile(
              title:  const Text("Asosiy"),
              onTap: (){

              },
              leading:  Image.asset('assets/images/Group.png'),
            ),
            ListTile(
              title:  const Text("E’lonlarim"),onTap: (){

            },
              leading:  Image.asset('assets/images/settings.png'),
            ),
            ListTile(
              leading: Image.asset('assets/nav_bar_logo/galeriya.png'),
              title: const Text("Sozlamalar"),
              onTap: (){
              },
              // expandedCrossAxisAlignment: CrossAxisAlignment.start,
            ),
            ListTile(
              title:  const Text("Bildirishnomalar"),onTap: (){

            },
              leading: Image.asset('assets/images/notification_important.png'),
            ),
            ListTile(
              title:  const Text("Chat"),
              onTap: (){

              },
              leading: Image.asset('assets/nav_bar_logo/play.png'),
            ),
            ListTile(
              title:  const Text("Sevimlilar"),onTap: (){
            },
              leading: Image.asset('assets/nav_bar_logo/save.png'),
            ),
            GestureDetector(
              onTap: (){
                showAlertDialog(context);
              },
              child: ListTile(
                title:   Text(""),
                leading: Image.asset('assets/nav_bar_logo/exit.png'),
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
    child: Text("ha"),
    onPressed: () async{
      Hive.box('token').clear();

    },
  );
  Widget notButton = ElevatedButton(

    child: Text("yoq"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("Simple Alert"),
    content: Text("Accountdan chiqish"),
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