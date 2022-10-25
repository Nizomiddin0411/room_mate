import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/bloc/bloc_region/region_bloc.dart';
import 'package:talaba_uy/cubit/aut_cubit.dart';
import 'package:talaba_uy/provider/chat_permit_provider.dart';
import 'package:talaba_uy/provider/day_provider.dart';
import 'package:talaba_uy/provider/favorite_provider.dart';
import 'package:talaba_uy/provider/feedback_provider.dart';
import 'package:talaba_uy/provider/month_provider.dart';
import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/provider/search_universitet_provider.dart';
import 'package:talaba_uy/provider/universitet_provider.dart';
import 'package:talaba_uy/repository/region_repository.dart';
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
import 'package:talaba_uy/screens/menu/menu_for.dart';

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
  await Hive.openBox('type');
  // await Hive.openBox('name');
  await Hive.openBox('number');
  await Hive.openBox('regionId');
  await Hive.openBox('id'); // myId
  await Hive.openBox('Id'); // friendId
  await Hive.openBox('fullname');
  await Hive.openBox('phone');
  await Hive.openBox('scrollController');
  await Hive.openBox('hide_profile');
  await Hive.openBox('hide_phone');

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
  MyApp({Key? key}) : super(key: key);
  final repository = RegionRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context1) => UniversitetProvider()),
              ChangeNotifierProvider(create: (context) => RegionProvider()),
              ChangeNotifierProvider(create: (context) => DayProvider()),
              ChangeNotifierProvider(create: (context) => MonthProvider()),
              ChangeNotifierProvider(create: (context) => FavoriteProvider()),
              ChangeNotifierProvider(create: (context) => SearchUniversitet()),
              ChangeNotifierProvider(create: (context) => ChatPermit()),
              ChangeNotifierProvider(create: (context) => FeedbackProvider())
            ],
            child: BlocProvider(
              create: (context) => AutCubit(),
              child: MaterialApp(
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
              ),
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
      body: Hive
          .box('token')
          .isEmpty ? LanguagePage() : Hive.box('type').get('type') == '2' ? MenuPage() :MenuFor() ,
      // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
