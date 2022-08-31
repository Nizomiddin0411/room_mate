// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
//
// import '../../core/const/app_colors.dart';
//
// class DrawerPage extends StatefulWidget {
//   const DrawerPage({Key? key}) : super(key: key);
//
//   @override
//   State<DrawerPage> createState() => _DrawerPageState();
// }
//
// class _DrawerPageState extends State<DrawerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children:  [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: AppColors.kblue,
//               ),
//               child: Image.asset('assets/images/Logo.png'),
//             ),
//             ListTile(
//               title:  const Text("Dashboard"),
//               onTap: (){
//                 Navigator.pushReplacementNamed(context, pageRoutes.Dashboard);
//               },
//               leading: Image.asset('assets/nav_bar_logo/dashboard.png'),
//             ),
//             ListTile(
//               title:  const Text("Manitorlar"),onTap: (){
//               Navigator.pushReplacementNamed(context, pageRoutes.Monitor);
//             },
//               leading: Image.asset('assets/nav_bar_logo/monitor.png'),
//             ),
//             ListTile(
//               leading: Image.asset('assets/nav_bar_logo/galeriya.png'),
//               title: const Text("Galereya"),
//               onTap: (){
//                 Navigator.pushReplacementNamed(context, pageRoutes.Galleriya);
//               },
//               // expandedCrossAxisAlignment: CrossAxisAlignment.start,
//             ),
//             ListTile(
//               title:  const Text("Paketlar"),onTap: (){
//               Navigator.pushReplacementNamed(context, pageRoutes.Paketlar);
//             },
//               leading: Image.asset('assets/nav_bar_logo/folder.png'),
//             ),
//             ListTile(
//               title:  const Text("Play"),
//               onTap: (){
//                 Navigator.pushReplacementNamed(context, pageRoutes.Play);
//               },
//               leading: Image.asset('assets/nav_bar_logo/play.png'),
//             ),
//             ListTile(
//               title:  const Text("Log"),onTap: (){
//               Navigator.pushReplacementNamed(context, pageRoutes.Log);
//             },
//               leading: Image.asset('assets/nav_bar_logo/save.png'),
//             ),
//             GestureDetector(
//               onTap: (){
//                 showAlertDialog(context);
//               },
//               child: ListTile(
//                 title:   Text("Chiqish"),
//                 leading: Image.asset('assets/nav_bar_logo/exit.png'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
// }
// showAlertDialog(BuildContext context) {
//   // Create button
//   Widget okButton = ElevatedButton(
//     child: Text("ha"),
//     onPressed: () async{
//       Hive.box('token').clear();
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//               builder: (_) => const LoginPage()),
//               (route) => false);
//     },
//   );
//   Widget notButton = ElevatedButton(
//
//     child: Text("yoq"),
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );
//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     // title: Text("Simple Alert"),
//     content: Text("Accountdan chiqish"),
//     actions: [
//       notButton,
//       okButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }