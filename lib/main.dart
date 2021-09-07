import 'package:bmi_calculator/pages/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'others/my_values.dart';

void main()async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
        child: MyApp(),
       supportedLocales: MyValues.supportedLocale,
      fallbackLocale: MyValues.TR_LOCALE,
      path:MyValues.LANG_PATH));
}
