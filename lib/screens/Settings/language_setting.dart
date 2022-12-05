import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import '../../cubit/aut_cubit.dart';
import '../../models/lang_model.dart';

class LanguageSettting extends StatefulWidget {
  const LanguageSettting({Key? key}) : super(key: key);

  @override
  State<LanguageSettting> createState() => _LanguageSetttingState();
}

class _LanguageSetttingState extends State<LanguageSettting> {

  String? _groupValue;
  String _language = 'uz';
  bool value1 = false;
  bool lang = false;
  void setlocale(Locale locale) => context.setLocale(context.locale);
  @override
  Widget build(BuildContext context) {
    setlocale(context.locale);
    // context.cubit
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        elevation: 0,
        title: Text(
          "Til sozlamalari".tr(),
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 48.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.iconBack)),
              child: InkWell(
                onTap: () {
                  context.locale = Locale('uz', 'UZ');
                  setState(() {
                    lang = true;
                    _language = 'uz';
                    value1 = true;
                  });
                  context.read<AutCubit>().selectLanguage(LangData.languageList
                      .singleWhere((e) => e.locale == context.locale));
                },
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: Image.asset("assets/images/uzb.png"),
                  title: SizedBox(
                      child: Text(
                        "O’zbek (Lotin)",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      )),
                  trailing: _language == 'uz' && lang
                      ? CircleAvatar(
                    radius: 12.r,
                    child: Icon(
                      Icons.check,
                      size: 14.sp,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(149, 149, 149, 1),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.w)),
                    child: CircleAvatar(
                      backgroundColor: AppColors.backgroundWhite,
                      radius: 10.r,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.iconBack)),
              child: InkWell(
                onTap: () {
                  context.locale = const Locale('ru', 'RU');
                  print( context.read<AutCubit>().selectedLang.index.toString() +'-----------------------');

                  setState(() {
                    lang = true;
                    _language = 'rus';
                    value1 = true;
                  });
                  context.read<AutCubit>().selectLanguage(LangData.languageList
                      .singleWhere((e) => e.locale == context.locale));
                 // context.read<AutCubit>().selectSettingLan(selectedLang, context);
                },
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: Image.asset("assets/images/rus.png"),
                  title: SizedBox(
                      child: Text(
                        "Русский",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      )),
                  trailing: _language == 'rus' && lang
                      ? CircleAvatar(
                    radius: 12.r,
                    child: Icon(
                      Icons.check,
                      size: 14.sp,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(149, 149, 149, 1),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.w)),
                    child: CircleAvatar(
                      backgroundColor: AppColors.backgroundWhite,
                      radius: 10.r,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
