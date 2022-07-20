import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class ItemDriwer extends StatelessWidget {
   const ItemDriwer(
      { Key? key, required this.title, required this.ontap, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
          onTap: ontap,
          title: Text(title, style: AppTextStyle.instance.styleBlackW600S16),
          
          leading: Icon(
            icon,
            size: he(30),
          ),
    );
  }
}
