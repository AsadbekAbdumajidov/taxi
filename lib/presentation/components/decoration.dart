import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';

class AppDecoration {
  static final AppDecoration _instance = AppDecoration._inint();
  static AppDecoration get instance => _instance;
  AppDecoration._inint();

  BoxDecoration styleBoxShadowBorderRadiusAll20White = BoxDecoration(
    color: AppColors.instance.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, -2),
      ),
    ],
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  BoxDecoration styleGreeySearchBorderRadius16 = BoxDecoration(
      color: AppColors.instance.greeySearch,
      borderRadius: BorderRadius.circular(16));

  BoxDecoration styleGreeySearchBorderRadius12 = BoxDecoration(
      color: AppColors.instance.greeySearch,
      borderRadius: BorderRadius.circular(12));

  BoxDecoration styleWhiteBorderRadius12 = BoxDecoration(
      color: AppColors.instance.white,
      boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, -2),
      ),
    ],
      borderRadius: BorderRadius.circular(12));
}
