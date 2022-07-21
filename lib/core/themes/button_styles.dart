import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class AppButtonStyle {
  static final AppButtonStyle _instance = AppButtonStyle._inint();
  static AppButtonStyle get instance => _instance;
  AppButtonStyle._inint();

  ButtonStyle buttonStyleBorder8ColorPrimaryHe36Wi101 =
      OutlinedButton.styleFrom(
    fixedSize: Size(wi(320), he(42)),
    padding: const EdgeInsets.all(0),
    backgroundColor: AppColors.instance.primaryColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  ButtonStyle buttonStyleBorder8He36Wi101 = OutlinedButton.styleFrom(
      fixedSize: Size(wi(320), he(44)),
      padding: const EdgeInsets.all(0),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ));
}
