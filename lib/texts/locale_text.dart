import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/extensions/string_extensions.dart';

class LocaleText extends StatelessWidget{
 late final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text.locale);
  }
}