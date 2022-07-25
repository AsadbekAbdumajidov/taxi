// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      this.preffixIcon,
      this.icon,
      this.textInputAction,
      required this.hintText,
      this.onChanged})
      : super(key: key);
  final TextEditingController controller;
  final Icon? preffixIcon;
  final Icon? icon;
  final TextInputAction? textInputAction;
  final String hintText;
  final Function(String title)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      textInputAction: textInputAction,
      controller: controller,
      
      readOnly: false,
      autofocus: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: preffixIcon,
        contentPadding: EdgeInsets.zero,
        suffixIcon: IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: Center(child: icon),
        ),
        filled: true,
        fillColor: AppColors.instance.white,
        border: inputBorderActive(),
        focusedBorder: inputBorderActive(),
        enabledBorder: inputBorderPassive(),
      ),
    );
  }

  OutlineInputBorder inputBorderActive() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: AppColors.instance.primaryColor, width: 0),
      );

  OutlineInputBorder inputBorderPassive() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.instance.white, width: 0),
      );
}

/// textfield with prefix widget

class CustomPrefixTextField extends StatelessWidget {
  CustomPrefixTextField(
      {Key? key,
      required this.textEditingController,
      required this.onChange,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      this.obscure,
      this.textInputAction,
      required this.textInputType,
      this.validator})
      : super(key: key);

  final TextEditingController textEditingController;
  final Function(String value) onChange;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: AppTextStyle.instance.styleBlackW500S14
          .copyWith(fontWeight: FontWeight.w400),
      obscureText: obscure ?? false,
      textInputAction: textInputAction,
      onChanged: onChange,
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyle.instance.styleBlackW500S14,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: AppColors.instance.neutral200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: AppColors.instance.primaryColor,
            width: 1.2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.instance.neutral200),
        ),
      ),
    );
  }
}
