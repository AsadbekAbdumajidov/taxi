import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class AppTextStyle {
  static final AppTextStyle _instance = AppTextStyle._inint();
  static AppTextStyle get instance => _instance;
  AppTextStyle._inint();

  TextStyle styleW800S20Black = TextStyle(
      fontSize: he(20),
      fontWeight: FontWeight.w800,
      color: AppColors.instance.black);

  TextStyle styleBlackW600S20 = TextStyle(
      color: AppColors.instance.black,
      fontWeight: FontWeight.w600,
      fontSize: he(20));

  TextStyle styleBlackW600S16 = TextStyle(
      color: AppColors.instance.black,
      fontWeight: FontWeight.w600,
      fontSize: he(16));

       TextStyle stylegreenW600S16 = TextStyle(
      color: AppColors.instance.green,
      fontWeight: FontWeight.w600,
      fontSize: he(16));

  TextStyle styleWhiteW600S16 = TextStyle(
      color: AppColors.instance.white,
      fontWeight: FontWeight.w600,
      fontSize: he(16));

  TextStyle styleBlackW500S14 = TextStyle(
      color: AppColors.instance.darkGrey,
      fontWeight: FontWeight.w500,
      fontSize: he(14));
}
