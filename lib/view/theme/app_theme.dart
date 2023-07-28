
import 'package:flutter/material.dart';

import '../../utils/constant/app_color.dart';

class AppTheme{
  static ThemeData get lightThem{
    ThemeData base =ThemeData.light();
    return base.copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.appColor,
      cardColor: AppColor.appColor,
      brightness: Brightness.light,
      textTheme:base.textTheme.copyWith(
        titleMedium: const TextStyle(
          color: Color(0xFF14130E),
        ),
        headlineLarge: const TextStyle(
          color: Color(0xFFB9B8B1),
        ),
      ),
    );
  }

  static ThemeData get darkThem{
    ThemeData base = ThemeData.dark();
    return base.copyWith(
        scaffoldBackgroundColor: const Color(0xFF14130E),
        cardColor:AppColor.appDarkContainer,
        brightness: Brightness.dark,
        textTheme:base.textTheme.copyWith(
          headlineLarge: const TextStyle(
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            color: Colors.white,
          ),
        ),
    );
  }
  static ThemeData getColorsTheme(BuildContext context){
    return Theme.of(context);
  }
  static cardColors(BuildContext context){
    return getColorsTheme(context).cardColor;
  }
  static textFieldColor(BuildContext context){
    return getColorsTheme(context).canvasColor;
  }
  static scaffoldBackgroundColor(BuildContext context){
    return getColorsTheme(context).scaffoldBackgroundColor;
  }
  static getTextColor(BuildContext context){
    return getColorsTheme(context).textTheme.headlineMedium!.color;
  }
}