import 'package:flutter/material.dart';

import 'language_data_model.dart';

List<LanguageDataModel> languagesModels = [
  LanguageDataModel(
      id: 1,
      name: 'English',
      languageCode: 'en',
      fullLanguageCode: 'en-US',
      flag: 'assets/images/ic_us.png'),
  LanguageDataModel(
      id: 2,
      name: 'Arabic',
      languageCode: 'ar',
      fullLanguageCode: 'ar-AR',
      flag: 'assets/images/ic_ar.png'),
];

abstract class BaseLanguage {
  static BaseLanguage of(BuildContext context) =>
      Localizations.of<BaseLanguage>(context, BaseLanguage)!;

  String get appName;
  String get logIn ;
  String get logInWithFingerSignature;
  String get decisions ;
  String get decision;
  String get meetingMinuts;
  String get preparatoryDisclousre;
  String get normal;
  String get secret;
  String get username;
  String get password;

}
