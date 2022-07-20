import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';

import '../../../components/size_konfig.dart';

class TitleDriwer extends StatelessWidget {
  const TitleDriwer({Key? key, required this.title, required this.ontap}) : super(key: key);
  final String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: AppColors.instance.greeySearch,
        child: Icon(
          Icons.person,
          size: he(35),
          color: AppColors.instance.darkGrey,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.instance.styleBlackW600S16,
      ),
      subtitle: Text(
        "Edit profile",
        style: AppTextStyle.instance.styleBlackW500S14,
      ),
    );
  }
}
