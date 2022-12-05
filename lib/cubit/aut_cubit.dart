import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:talaba_uy/models/lan_classs.dart';
import 'package:talaba_uy/models/lang_model.dart';

part 'aut_state.dart';

class AutCubit extends Cubit<AutState> {


  AutCubit() : super(AutInitial());

  Language selectedLang=LangData.languageList[0];
  void selectLanguage(lang){
    selectedLang = lang;
  }


  Future<void> selectSettingLan(Language language,BuildContext context) async{
    selectedLang=language;
    if (selectedLang.langName == "O'zbekcha") {
      await context.setLocale(const Locale('uz', 'UZ'));
    }else {
      await context.setLocale(const Locale('ru', 'RU'));
    }
    emit(AutInitial());
  }
}
