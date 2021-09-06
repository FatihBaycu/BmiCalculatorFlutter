import 'package:flutter/material.dart';

class MyValues{

 static const String vkiNedir="Obezitenin hesaplanmasında kişinin boy ve kilo değeri üzerinden yapılan Vücut Kitle İndeksi (VKİ) (Boy Kilo Endeksi) hesaplaması kullanılır.";
 static const String zayif = "18, 5 kg/m.'nin altında olanlar: Zayıf";
 static const String normalKilolu = "18.5 – 24, 9 kg/m. arasında olanlar: Normal kilolu";
 static const String fazlaKilo = "25 – 29, 9 kg/m. arasında olanlar: Fazla kilolu";
 static const String obez = "30 – 39, 9 kg/m. arasında olanlar: Obez";
 static const String morbidObez = "40 kg/m.'nin üzerinde olanlar: İleri derecede obez (morbid obez), olarak görülür.";

 static const TR_LOCALE=Locale("tr","TR");
 static const EN_LOCALE=Locale("en","US");
 static const DE_LOCALE=Locale("de","DE");

 static const supportedLocale=[TR_LOCALE,EN_LOCALE,DE_LOCALE];


 static const LANG_PATH="assets/lang";

}