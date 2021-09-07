import 'package:bmi_calculator/generated/locale_keys.g.dart';
import 'package:bmi_calculator/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class Calculations{

  static double calculateBmi({bool? gender, double? width, double? weight}) {
     int number=50;
     number = gender == true ?number = 50 : 45;

    double result = weight! / (width! * width);
    String value = result.toString().substring(4,6);
    double newVal=double.parse(value);
    return newVal;
  }

 static String calculateIdealWeight({bool? gender, double? width}) {
    int number = 50;
    number = gender == true ? number = 50 : 45;

    var result = number + 2.3 * ((width! / 2.54) - 60);
    String value = result.toString();
    return value.substring(0, 2);
  }

  static String isMyWeightNormal(double value){
  if(value<18.4)     {return LocaleKeys.result_weak.locale;}
  else if(value<24.9){return LocaleKeys.result_normal.locale;}
  else if(value<29.9){return LocaleKeys.result_owerweight.locale;}
  else if(value<34.9){return LocaleKeys.result_obese.locale;}
  else if(value<44.9){return LocaleKeys.result_morbidlyObese.locale;}
  else               {return LocaleKeys.result_morbidlyObese.locale;}
}
 static String getBmiMessage(double value){
  if(value<18.4)return LocaleKeys.resultDetail_weak.locale;
  else if(value<24.9)return LocaleKeys.resultDetail_normalWeight.locale;
  else if(value<29.9)return LocaleKeys.resultDetail_overweight.locale;
  else if(value<34.9)return LocaleKeys.resultDetail_obese.locale;
  else if(value<44.9)return LocaleKeys.resultDetail_morbidlyObese.locale;
  else return LocaleKeys.resultDetail_morbidlyObese.locale; 
}

 static Color getWeightWarningColor(double value){
   if(value<=0){return Colors.red;}
   if(value>=40)
    return Colors.red;
  if(value>=30)
    return Colors.redAccent.shade100;
  if(value>=25)
    return Colors.orange;
  else
    return Colors.green;
}
}