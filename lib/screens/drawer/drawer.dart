import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talaba_uy/screens/Settings/setting.dart';

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
              decoration: BoxDecoration( color: Colors.blue
              ),
              child: Image.asset('assets/images/Vector.png'),
            ),
            ListTile(
              title:  const Text("Asosiy"),
              onTap: (){
              },
              leading:  Image.asset('assets/images/Vector.png'),
            ),
            ListTile(
              title:  const Text("E’lonlarim"),onTap: (){

            },
              leading:  Icon(Icons.checklist_rtl_sharp),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text("Sozlamalar"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
              },
              // expandedCrossAxisAlignment: CrossAxisAlignment.start,
            ),
            ListTile(
              title:  const Text("Bildirishnomalar"),onTap: (){

            },
              leading:Icon(Icons.notifications_none)
            ),
            ListTile(
              title:  const Text("Chat"),
              onTap: (){

              },
              leading: Icon(Icons.chat),
            ),
            ListTile(
              title:  const Text("Sevimlilar"),onTap: (){
            },
              leading: Icon(Icons.favorite_border)
            ),Padding(
              padding: const EdgeInsets.fromLTRB(80, 100, 0,0),
              child: ListTile(
                  title:  const Text("Version 1.1.0"),onTap: (){
              },
              ),
            ),
            GestureDetector(
              onTap: (){
                showAlertDialog(context);
              },

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