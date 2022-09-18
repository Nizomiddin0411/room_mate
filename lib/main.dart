import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talaba_uy/screens/Account_Page/account_page.dart';
import 'package:talaba_uy/screens/All_Ads_Page/all_ads_page.dart';
import 'package:talaba_uy/screens/Autorization/language_dart.dart';
import 'package:talaba_uy/screens/Create_ads/create_ads_page.dart';
import 'package:talaba_uy/screens/Settings/setting.dart';
import 'package:talaba_uy/screens/Autorization/StartPage.dart';
import 'package:talaba_uy/screens/Search_University/search_page.dart';
import 'package:talaba_uy/screens/drawer/drawer.dart';
import 'package:talaba_uy/screens/menu/menu.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //   apiKey: "a",
    //   appId: "a",
    //   messagingSenderId: "",
    //   projectId: "1",
    // ),
  );
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('token');
  await Hive.openBox('id'); // myId
  await Hive.openBox('Id'); // friendId
  await Hive.openBox('haveMessage');

  runApp(EasyLocalization(
    path: 'assets/locale',
    supportedLocales: [
      Locale('ru', 'RU'),
      Locale('uz', 'UZ'),
    ],
    fallbackLocale: Locale('uz', 'UZ'),
    saveLocale: true,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(
              title: '',
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LanguagePage(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
