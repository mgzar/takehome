import 'package:flutter/material.dart';
import 'package:zarnikyawtest/utils/style.dart';

import 'colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
        color: kPrimaryLightColor,
        iconTheme: const IconThemeData(color: kTextColorBlack),
        titleTextStyle: appBarTitle()),
    brightness: Brightness.light,
    scaffoldBackgroundColor: kPrimaryLightColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: kPrimaryDark,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Poppins',
        ),
  );
}
