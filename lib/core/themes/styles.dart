import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';
class AppTextStyle {
  static final AppTextStyle _instance = AppTextStyle._inint();
  static AppTextStyle get instance => _instance;
  AppTextStyle._inint();
  
 static TextStyle styleW800S20Black = TextStyle(
      fontSize: he(20), fontWeight: FontWeight.w800, color: AppColors.instance.black);
}
