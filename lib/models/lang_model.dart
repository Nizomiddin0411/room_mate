import 'package:flutter/cupertino.dart';
import 'package:talaba_uy/models/lan_classs.dart';

class LangData {
  static final List<Language> languageList = [
    Language(
      index: 1,
      langName: "O'zbekcha",
      locale: const Locale('uz', 'UZ'),
    ),
    Language(
      index: 2,
      langName: "Русский",
      locale: const Locale('ru', 'RU'),
    ),
  ];
}