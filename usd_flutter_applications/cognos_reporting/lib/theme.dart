import 'package:flutter/material.dart';

const Color usdBlue = Color(0xff184D79);
const Color gray = Color(0xffeaeaea);

ThemeData appTheme = ThemeData(
  primaryColor: usdBlue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonColor: usdBlue,
  buttonTheme: ButtonThemeData(
    buttonColor: usdBlue,
    textTheme: ButtonTextTheme.primary,
  ),
  unselectedWidgetColor: usdBlue,
);
